import 'package:flutter/material.dart';

class FormAliment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormAlimentState();
}

class FormAlimentState extends State<FormAliment> {
  final alimentForms = GlobalKey<FormState>();
  final designation = TextEditingController();
  final description = TextEditingController();
  final prix = TextEditingController();
  final quantite = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Formulaire des Aliments")),
        body: Center(
            child: Form(
          key: alimentForms,
          child: Column(children: [
            TextFormField(
                controller: designation,
                decoration: InputDecoration(labelText: 'Désignation')),
            TextFormField(
                controller: description,
                decoration: InputDecoration(labelText: 'Description')),
            TextFormField(
                controller: prix,
                decoration: InputDecoration(labelText: 'Prix')),
            TextFormField(
                controller: quantite,
                decoration: InputDecoration(labelText: 'Quantite'))
          ]),
        )));
  }
}
