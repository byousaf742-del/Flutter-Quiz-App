import 'package:flutter/material.dart';
import 'package:quiz_app/views/result_screen.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List quizListData = [
    {
      "id": 1,
      "answer": "Human-Computer Interaction",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What does HCI stand for?",
      "options": [
        {
          "option": "a",
          "value": "Human-Computer Interaction",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Hardware-Computer Integration",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "High-Contrast Interface",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Hyperlink Control Interface",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "Usability",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Which term refers to the ease of use and learnability of a human-made object?",
      "options": [
        {
          "option": "a",
          "value": "Functionality",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Usability",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Efficiency",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Reliability",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 3,
      "answer": "User Interface (UI)",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What is the space where interactions between humans and machines occur?",
      "options": [
        {
          "option": "a",
          "value": "Operating System (OS)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "User Interface (UI)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Central Processing Unit (CPU)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Network Protocol",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 4,
      "answer": "User Experience (UX)",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Which concept focuses on the overall feeling a user has when interacting with a product or system?",
      "options": [
        {
          "option": "a",
          "value": "User Interface (UI)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "User Experience (UX)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "System Performance (SP)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Software Development Life Cycle (SDLC)",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 5,
      "answer": "Affordance",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What design principle suggests that an object's appearance should indicate its function?",
      "options": [
        {
          "option": "a",
          "value": "Feedback",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Consistency",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Affordance",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Mapping",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 6,
      "answer": "To make systems more user-friendly and efficient",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What is the primary goal of Human-Computer Interaction (HCI)?",
      "options": [
        {
          "option": "a",
          "value": "To develop faster computer hardware",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "To make systems more user-friendly and efficient",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "To reduce the cost of software development",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "To increase the complexity of user interfaces",
          "color": "0xFFFFFFFF",
        },
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;

  quizResult(context) {
    userPercentage = 0;
    wrongQ = 0;
    ommitedQuestion = 0;
    totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        ommitedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            ommitedQuestion: ommitedQuestion,
          ),
        ),
            (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF053251),
      appBar: AppBar(
        title: const Text("Quiz Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question :${questionINdex + 1}/${quizListData.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  print("Current page $page");
                  setState(
                        () {
                      questionINdex = page;
                    },
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFAB40),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      quizListData[index]
                      ['is_answer_status_right_wrong_omitted'] ==
                          2
                          ? Text(
                        "Sorry : Right answer is -> ${quizListData[index]['answer']} ",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                          : const SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(
                                    int.parse(
                                      data['color'],
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  if (quizListData[index]['is_answered'] ==
                                      0) {
                                    setState(() {
                                      if (data['value'] ==
                                          quizListData[index]['answer']) {
                                        data['color'] = "0xFF31CD63";
                                        quizListData[index][
                                        'is_answer_status_right_wrong_omitted'] = 1;
                                      } else {
                                        data['color'] = "0xFFFF0000";
                                        quizListData[index][
                                        'is_answer_status_right_wrong_omitted'] = 2;
                                      }
                                      quizListData[index]['is_answered'] =
                                      1;
                                    });
                                  } else {}
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            int.parse(
                                              data['color'],
                                            ),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            data['option'].toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        data['value'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (questionINdex == quizListData.length - 1) {
            print("Submit ");
            quizResult(context);
          } else {
            print("ELSE PART");
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label:
        Text(questionINdex == quizListData.length - 1 ? "Submit" : "Next"),
      ),
    );
  }
}
