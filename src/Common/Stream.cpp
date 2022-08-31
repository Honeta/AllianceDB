#include <Common/Stream.hpp>
#include <fstream>
#include <Utils/Logger.hpp>
void AllianceDB::Stream::Load(const std::string &fileName, bool StreamR) {
  std::fstream file;
  std::string buffer;
  file.open(fileName, std::ios::in);
  if (!file.is_open()) ERROR("cannot open the file: " + fileName);
  while (getline(file, buffer)) {
    tsType ts;
    keyType key;
    valueType v;
    sscanf(buffer.data(), "%ld,%ld,%ld", &key, &v, &ts);
    //keyType key = stoi(buffer);
    TuplePtr tuple = std::make_shared<Tuple>(key);
    tuple->timestamp = ts;
    tuple->payload = v;
    tuple->type = StreamR;
    this->Tuples.push_back(tuple);
    TRACE("Push tuple: " + tuple->toString());
  }
  file.close();
}
