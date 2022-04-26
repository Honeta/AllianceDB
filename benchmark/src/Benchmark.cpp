// Copyright (C) 2021 by the IntelliStream team (https://github.com/intellistream)

/**
 * @brief This is the main entry point of the entire program.
 * We use this as the entry point for benchmarking.
 */
#include <Utils/Logger.hpp>
#include <Utils/UtilityFunctions.hpp>
#include <Common/Types.hpp>
#include <Common/DatasetTool.hpp>
#include <Utils/MicroDataSet.hpp>
#include <WindowSlider/AbstractLazyWS.h>
#include <Engine/Verify.hpp>
#include <Engine/Execute.hpp>
#include <Common/Result.hpp>

using namespace std;
using namespace INTELLI;

int main() {
  //Setup Logs
  setupLogging("benchmark.log", LOG_DEBUG);
  //Load Inputs
  auto relations = Relations::create();
  string pwd = getcwd(NULL, 0); //Get current directory
  string fileRName = pwd + "/datasets/" + DATASET_NAME + "-R.txt";
  string fileSName = pwd + "/datasets/" + DATASET_NAME + "-S.txt";
  DatasetTool dataSet;
  dataSet.load3VText(relationCouple.relationR, fileRName);
  dataSet.load3VText(relationCouple.relationS, fileSName);

  Result exeResult = Result();
  Execute<AbstractLazyWS> execute;
  execute.Run(exeResult, relationCouple, 2, 500, 200);

  Result verifyResult = Result();
  Verify verify;
  verify.Run(verifyResult, relationCouple, 500, 200);

  if (exeResult.joinNumber == verifyResult.joinNumber) {
    cout << "Congratulations, the result " + to_string(exeResult.joinNumber) + " is correct!" << endl;
    return true;
  } else {
    cout << "Ops, ot matched, expecting " + to_string(verifyResult.joinNumber) + "but return "
        + to_string(exeResult.joinNumber) << endl;
    return false;
  }
}