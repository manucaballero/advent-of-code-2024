import 'dart:math';

import 'package:advent_of_code_2024/utils/utils.dart';


int partA(){

  int response = 0;

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

  reports.forEach((element) {
    
    bool isSafe = isReportSafe(element);
    if(isSafe) response++;
  });

  return response;
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