import 'dart:io';

void main() {
  File file = new File("main.txt");
  List<String> textTokenized = file.readAsStringSync().split('.');
  textwriter(textTokenized);
}

void textwriter(List<String> textTokenized) {
  print("");
  print("\t\t\tWelcome to Dart Chatbot");
  print(
      "_______________________________________________________________________________");
  print("Ask me anything about Dart: ");
  print("Please search through keywords for the topics which you want to learn or write 'bye' for exit.");
  while (true) {
    stdout.write("YOU-> ");
    //print("You: ");
    String userInput = stdin.readLineSync() as String;
    userInput = userInput.toLowerCase();
    stdout.write("BOT-> ");
    if (userInput == "bye") {
      print("Good Bye, Have a great day!");
      break;
    } else if (userInput != "") {
      TextGenerator generator = new TextGenerator();
      generator.generateText(textTokenized, userInput);
    } else {
      print("Please Write a Proper Question!");
    }
  }
}

class TextFinder {
  bool findingText(List<String> spacetokenized, String text) {
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
    List<String> tokenizedText = text.split(' ');
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

class TextGenerator extends TextFinder {
  void generateText(List<String> textTokenized, String userInput) {
    // print(textTokenized);
    int check = 0;
    for (int count = 0; count < textTokenized.length; count++) {
      List<String> spacetokenized = textTokenized[count].split(' : ');
      List<String> colonTokenized = spacetokenized[0].split(' ');
      // print(colonTokenized);
      if (spacetokenized.length > 1 && findingText(colonTokenized, userInput)) {
        //stdout.write("BOT-> ");
        print("${textTokenized[count]}");
        ++check;
        break;
      }
    }
    if (check == 0) {
      //stdout.write("BOT-> ");
      print("Sorry! I didn't Understood You");
    }
  }
}
