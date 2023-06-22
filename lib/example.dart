import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  String text1 = "";
  String text2 = "";
  String text3 = "";
  TextEditingController textEditingController1 = new TextEditingController();
  TextEditingController textEditingController2 = new TextEditingController();
  TextEditingController textEditingController3 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 70, 160, 199),
        child: Center(
            child: Container(
                height: 600,
                width: 300,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(20),
                // color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: textEditingController1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: textEditingController2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: textEditingController3,
                      ),
                    ),
                    SizedBox(
                        width: 500,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                text1 = textEditingController1.text;
                                text2 = textEditingController2.text;
                                text3 = textEditingController3.text;
                              });
                            },
                            child: Text("Enter"))),
                    SizedBox(
                      height: 20,
                    ),
                    Text(text1),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(text2),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(text3),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.access_alarm_outlined,
                      color: Colors.black,
                      size: 40,
                    )
                  ],
                ))),
      ),
    );
  }
}
