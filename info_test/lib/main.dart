import 'package:flutter/material.dart';
import 'package:info_test/info_data.dart';

import 'constants/constants.dart';

void main() => runApp(const BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.indigo[900],
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  SoruSayfasi({super.key});

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> selected = [];

  InfoData infoData = InfoData();
  void buttonFunction(bool answer) {
    if (infoData.endQuestion()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Bravo Testi Bitirdin !"),
              actions: [
                TextButton(
                  child: const Text("Əvvələ qayıt"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      infoData.testReset();
                      selected = [];
                    });
                  },
                ),
              ],
            );
          });
    } else {
      setState(() {
        infoData.getQuestionAnswer() == answer
            ? selected.add(kCorrectIcon)
            : selected.add(kFalseIcon);
        infoData.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                infoData.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: selected,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            //onPrimary: Colors.red[400],
                          ),
                          child: const Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            buttonFunction(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            //color: Colors.green[400],
                          ),
                          child: const Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            buttonFunction(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
