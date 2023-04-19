import 'package:aliment/models/utilisateur.model.dart';
import 'package:aliment/services/uilisateur.service.dart';
import 'package:flutter/material.dart';

class FormUtilisateur extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormUtilisateurState();
}

class FormUtilisateurState extends State<FormUtilisateur> {

  final utilisateurForms = GlobalKey<FormState>();
  final nom = TextEditingController();
  final prenoms = TextEditingController();
  final numero = TextEditingController();
  final login = TextEditingController();
  final password = TextEditingController();
  final role = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Formulaire des utilisateurs")),
        body: Center(
            child: Form(
          key: utilisateurForms,
          child: Column(children: [
            TextFormField(
                controller: nom, decoration: InputDecoration(labelText: 'Nom')),
            TextFormField(
                controller: prenoms,
                decoration: InputDecoration(labelText: 'Prénom')),
            TextFormField(
                controller: numero,
                decoration: InputDecoration(labelText: 'Numéro')),
            TextFormField(
                controller: login,
                decoration: InputDecoration(labelText: 'Nom d\'utilisateur')),
            TextFormField(
                controller: password,
                decoration: InputDecoration(labelText: 'Mot de passe')),
            TextFormField(
                controller: role,
                decoration: InputDecoration(labelText: 'Role')),
            ElevatedButton(
                onPressed: () => inscription(context),
                child: Text('inscription'))
          ]),
        )));
  }

  Future<void> inscription(context) async {
    Utilisateur utilisateur = Utilisateur(
        nom: nom.text,
        prenom: prenoms.text,
        numero: numero.text,
        password: password.text,
        login: login.text,
        role: role.text
    );
    UtilisateurService.enregistrerUtilisateur(utilisateur)
        .then((value) => {
          if(value){
            Navigator.pushNamed(context, "/accueil")
          }else{
            print("erreur")
          }
        });
  }
}
