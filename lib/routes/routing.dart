import 'package:flutter/material.dart';
import 'package:aliment/ecrans/accueil/accueil.ecran.dart';
import 'package:aliment/ecrans/accueil/login.ecran.dart';
import 'package:aliment/ecrans/aliments/formAliment.ecran.dart';
import 'package:aliment/ecrans/utilisateur/FormUtilisateur.ecran.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginForm());
      case '/accueil':
        return MaterialPageRoute(
            builder: (context) =>
                const MyHomePage(title: 'Bienvunue sur mon application'));
      case '/FormulaireUtilisateur':
        return MaterialPageRoute(builder: (context) => FormUtilisateur());
      case '/aliment':
        return MaterialPageRoute(builder: (context) => FormAliment());
      default:
        return MaterialPageRoute(builder: (context) => LoginForm());
    }
  }
}
