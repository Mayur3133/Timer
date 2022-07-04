import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  TextEditingController entry = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> number = [];

    // print(_randomNumber2);

    return Scaffold(
      appBar: AppBar(title: Text("Timer")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Entries:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        height: 50,
                        // decoration: BoxDecoration(color: Colors.grey),
                        child: TextField(
                            keyboardType: TextInputType.number,
                            controller: entry,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "From:   ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: from,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "To:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: to,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i <= int.parse(entry.text); i++) {
                      Random random = Random();
                      var _randomNumber2 = int.parse(from.text) +
                          random.nextInt(
                              int.parse(to.text) - int.parse(from.text));
                      number.add(_randomNumber2);
                      print(number);
                    }
                    setState(() {});
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return lst(num: number);
                      },
                    ));
                  });
                },
                child: Text("Ok")),
          ],
        ),
      ),
    );
  }
}

class lst extends StatefulWidget {
  List<int> num = [];

  lst({required this.num});

  @override
  State<lst> createState() => _lstState();
}

class _lstState extends State<lst> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      for (int i = 0; i < widget.num.length; i++) {
        if (widget.num[i] == 0) {
          print("Complete");
        } else {
          widget.num[i]--;
          print(widget.num.length);
          setState(() {});
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.num.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: widget.num[index] == 0
                        ? BoxDecoration(color: Colors.green)
                        : BoxDecoration(color: Colors.grey),
                    child: ListTile(
                      title: widget.num[index] == 0
                          ? Text("Complete",
                              style: TextStyle(color: Colors.black))
                          : Text("Time left",
                              style: TextStyle(color: Colors.black)),
                      trailing: Text(widget.num[index].toString()),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
