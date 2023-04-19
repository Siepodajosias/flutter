import 'dart:convert';
import 'package:aliment/models/user.model.dart';
import 'package:aliment/models/utilisateur.model.dart';
import 'package:aliment/shared-aliment/stockage.donnee.service.dart';
import 'package:aliment/shared-aliment/url-serveur.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class LoginServe {

  /// Enregistre le token de l'utilisateur connecté dans le cache.
  /// @param user
  /// @return bool
  static Future<bool> connexion(User user) async {
    try {
      var response = await http.post(Uri.parse('$urlServeur/api/securite/auth'),
          headers: {'Content-type': 'application/json'},
          body: json.encode(user));
      var jsonReponse = response.body;
      if (response.statusCode == 200) {
        if (jsonReponse != '') {
          var token = jsonDecode(jsonReponse)['token'];
          StockageDonneesService.enregistrerToken(token!);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print('erreur:$e');
      return false;
    }
  }

  /// Enregistre le token de l'utilisateur connecté dans le cache.
  /// @return Utilisateur
  static Future<Utilisateur> reccupererUtilisateurConnecter() async {
    var token = await StockageDonneesService.getValuesInPreferences('token');
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);
    Utilisateur utilisateur = Utilisateur(
        nom: payload['nom'],
        prenom: payload['prenoms'],
        numero: "",
        password: "",
        login: "",
        role: "");
    return utilisateur;
  }
}
