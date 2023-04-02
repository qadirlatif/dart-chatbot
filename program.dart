import 'dart:io';

void main() {
  File file = new File("main.txt");
  var textTokenized = file.readAsStringSync().split('.');
  print("******************Welcome to Dart Chatbot**********************");
  print("Please Enter keyword Which topic do you want to learn? or write 'bye' for exit.");
  while (true) {
    print("You: ");
    String userInput = stdin.readLineSync() as String;
    userInput = userInput.toLowerCase();
    if (userInput == "bye") {
      print("BOT: Ok Bye, Thank You!");
      break;
    } else if(userInput!="") {
      TextGenerator generator=new TextGenerator();
      generator.generateText(textTokenized, userInput);
    }
    else {
      print("please Write a Proper Question!");
    }
  }
}

class TextFinder{
bool findingText(var spacetokenized, String text) {
  bool check = false;
  List<String> commonWords = [
    "and",
    "are",
    "is",
    "to",
    "for",
    "also",
    "of",
    "it's",
    "like",
    "a"
  ];
  List tokenizedText = text.split(' ');
  spacetokenized.forEach((element) {
    tokenizedText.forEach((element1) {
      bool commonwordschecker = false;
      
      commonWords.forEach((element) {
        if (element == element1.toLowerCase()) {
          commonwordschecker = true;
        }
      });
      if (commonwordschecker == true) {
      } else if (element.toLowerCase() == element1.toLowerCase()) {
        check = true;
      }
    });
  });
  return check;
}
}
class TextGenerator extends TextFinder{
void generateText(var textTokenized, String userInput) {
  int check = 0;
  for (int count = 0; count < textTokenized.length; count++) {
    var spacetokenized = textTokenized[count].split(' ');
    if (spacetokenized.length > 1 && findingText(spacetokenized, userInput)) {
      stdout.write("-> ");
      print("BOT: ${textTokenized[count]}");
      ++check;
    }
  }
  if (check == 0) {
    print("BOT: Sorry! I didn't Understood You");
  }
}
}