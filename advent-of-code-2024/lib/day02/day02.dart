import 'package:advent_of_code_2024/utils/utils.dart';


int partA(){

  int response = 0;

  List<List<int>> reports = obtainReports();

  reports.forEach((element) {
    
    bool isSafe = isReportSafe(element);
    if(isSafe) response++;
  });

  return response;
}

int partB(){

  int response = 0;

  List<List<int>> reports = obtainReports();

  reports.forEach((element) {
    
    bool isSafe = isReportSafeWithProblemDampener(element);
    if(isSafe) response++;
  });

  return response;
}


List<List<int>> obtainReports() {
  List<String> lines = obtainFileLines('lib/day02/input.txt');
  
  List<List<int>> reports = [];
  
  for(String line in lines){
  
   List<String> numbersAsString = line.split(' ');
   List<int> report = [];
   numbersAsString.forEach((element) {
  
    report.add(int.parse(element));
    });
    reports.add(report);
  }
  return reports;
}

bool isReportSafe(List<int> report){

  bool result = true;
  String sortType = 'desc';

  if(report[0] < report[1]){
    sortType = 'asc';
  }
  
  for(int i = 0; i < report.length - 1 && result; i++){
    int currentNumber = report[i];
    int comparingNumber = report[i + 1];

    if(sortType == 'desc'){
      if(currentNumber - comparingNumber >= 1 && currentNumber - comparingNumber <= 3){

      }else{
        result = false;
      }
    }else{
      if(comparingNumber - currentNumber >= 1 && comparingNumber - currentNumber <= 3){

      }else{
        result = false;
      }
    }
  }
  return result;
}

bool isReportSafeWithProblemDampener(List<int> report){
  
  bool result = true;
  int originalSize = report.length;

  result = isReportSafe(report);
  int counter = 0;
  while(!result && counter < originalSize){
    List<int> updatedReport = List.from(report);
    updatedReport.removeAt(counter);
    result = isReportSafe(updatedReport);
    counter++;
  }

  return result;
}