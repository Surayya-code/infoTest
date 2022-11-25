import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() => runApp(const BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
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

  List<Widget> selected = [
    
  ];
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Bilgi Testi Soruları',
                textAlign: TextAlign.center,
                style: TextStyle(
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
          children: widget.selected,
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
                          onPressed: () {setState(() {
                            widget.selected.add(kFalseIcon);
                          });
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
                            setState(() {
                              widget.selected.add(kCorrectIcon);
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}


