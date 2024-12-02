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

int partB(){

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
  Map<int, int> map = {};
  for(int i = 0; i < listOne.length; i++){

    map.putIfAbsent(listOne[i], () => 0);
  }

  for(int i = 0; i < listTwo.length; i++){
    
    int number = listTwo[i];
    
    if(map.containsKey(number)){
      map.update(number, (value) => value + 1);
    }
  }

  map.forEach((key, value) {
    response += key * value;
  });

  return response;
}