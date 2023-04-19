import 'package:flutter/material.dart';
import 'package:aliment/models/user.model.dart';
import 'package:aliment/services/login.service.dart';

class LoginFormWidget extends StatelessWidget {
  final loginForms = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(30),
            child: Form(
              key: loginForms,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                          labelText: "Nom d'utilisateur")),
                  TextFormField(
                    controller: password,
                    decoration:
                        const InputDecoration(labelText: "Mot de passe"),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () => connexion(context),
                            child: Text('Se Connecter')),
                        ElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                                context, "/FormulaireUtilisateur"),
                            child: Text('S\'inscrire'))
                      ]),
                ],
              ),
            )),
      ),
    );
  }

  /// Méthode de connexion
  Future<void> connexion(context) async {
    User user = User(username: username.text, password: password.text);
    LoginServe.connexion(user).then((value) => {
          if (value)
            {Navigator.pushNamed(context, '/accueil')}
          else
            {print("Nom d'utilisateur ou Mot de passe incorrect")}
        });
  }
}
