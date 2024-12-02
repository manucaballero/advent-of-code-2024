import 'package:advent_of_code_2024/utils/utils.dart';

int partA(){

  int response = 0;
  List<String> lines = obtainFileLines('lib/day01/input.txt');

  List<int> listOne = [];
  List<int> listTwo = [];

  for(String line in lines){

    int firstSpace = line.indexOf(' ');
    int lastSpace = line.lastIndexOf(' ');
    listOne.add(int.parse(line.substring(0, firstSpace)));
    listTwo.add(int.parse(line.substring(lastSpace + 1, line.length)));
  }

  listOne.sort();
  listTwo.sort();

  for(int i = 0; i < listOne.length; i++){

    int difference = listOne[i] - listTwo[i];
    response += difference.abs();
  }

  return response;
}