import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hachingu/Notifiers/dark_theme_provider.dart';

class TrainScreen extends StatefulWidget {
  @override
  _TrainScreenState createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  var sWidth, sHeight;

  @override
  Widget build(BuildContext context) {
    sWidth = MediaQuery.of(context).size.width;
    sHeight = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return TrainBody(themeProvider);
  }

  Widget TrainBody(DarkThemeProvider themeProvider) {
    return new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor, size: 30)),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        body: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
                children: [
                  Positioned(
                    top: 0,
                    child: Column(
                        children: [
                          Container(
                            width: sWidth,
                            height: sHeight * 0.03,
                          ),
                          Text(
                            "Writing Challenges",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Theme.of(context).primaryColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ]
                    ),
                  ),
                  Container(
                      height: sHeight * 0.73,
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          ChallengeCard("assets/images/learn.PNG", "Random",
                              "Answer characters, syllables, or words"),
                          ChallengeCard("assets/images/teach.png", "Character",
                              "Test your character knowledge"),
                          ChallengeCard("assets/images/learn.PNG", "Syllable",
                              "Test your syllable knowledge"),
                          ChallengeCard("assets/images/learn.PNG", "Word",
                              "Test your word knowledge")
                        ],
                      )),
                  /*Stack(
                      children: [
                        InkWell(
                            onTap: () {
                              print("Tapped");
                            },
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Text(
                                    "Character"
                                )
                            )
                        ),
                        InkWell(
                            onTap: () {
                              print("Tapped");
                            },
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Text(
                                    "Word"
                                )
                            )
                        )
                      ]
                  )*/
                ]
            )
        )
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String imageName;
  final String title;
  final String description;

  const ChallengeCard(this.imageName, this.title, this.description);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 10, right: 25),
      child: Row(
        children: <Widget>[
          Image.asset(
            imageName,
            width: 150,
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(description,
                        textAlign: TextAlign.right,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ])),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xff01AFE0),
        boxShadow: [
          BoxShadow(
              blurRadius: 8.0, offset: Offset(-3.0, 3.0), color: Colors.grey),
        ],
        borderRadius: BorderRadius.all(Radius.circular(26)),
      ),
    );
  }
}

/*class TrainScreen extends StatelessWidget {
  var sWidth, sHeight;
  @override
  Widget build(BuildContext context) {
    sWidth = MediaQuery.of(context).size.width;
    sHeight = MediaQuery.of(context).size.height;

  }
}*/