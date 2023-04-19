import 'package:aliment/services/login.service.dart';
import 'package:flutter/material.dart';

class AccueilWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccueilState();
}

class _AccueilState extends State<AccueilWidget> {
  final textEditingValue = TextEditingController();
  late String nom;
  late String prenoms;
  late List<String> data = [
    "Canada",
    "Brazil",
    "USA",
    "Japan",
    "China",
    "UK",
    "Uganda",
    "Uruguay"
  ];
  double loginWidth = 40.0;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Aliments'),
    Tab(text: 'Utilisateurs')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            return ListeAliment();
          }).toList(),
        ),
      ),
    );
  }

  Center ListeAliment() {
    LoginServe.reccupererUtilisateurConnecter()
        .then((value) => {nom = value.nom, prenoms = value.prenom});
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        Row(children: [
          ElevatedButton(
              onPressed: () => {_doanimation(), print(loginWidth)},
              child: Text('Animation'))
        ]),
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Text(nom + prenoms),
            ),
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            ),
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            ),
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            ),
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            ),
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            )
          ],
        )
      ]),
    ));
  }

  _doanimation() {
    setState(() {
      loginWidth == 0.0 ? loginWidth = 250 : loginWidth = 0.0;
    });
  }
}

// le type de widget dans ce package(widget) doit être le meme type de wedget présent dans le package (ecrans)
