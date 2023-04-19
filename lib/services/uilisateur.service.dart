import 'dart:convert';
import 'package:aliment/models/utilisateur.model.dart';
import 'package:aliment/shared-aliment/url-serveur.dart';
import 'package:http/http.dart' as http;
import '../shared-aliment/stockage.donnee.service.dart';

class UtilisateurService {

  /// Enregistre un utilisateur dans notre système
  /// @param utilisateur
  /// @return bool
  static Future<bool> enregistrerUtilisateur(Utilisateur utilisateur) async {
    try {
      var response = await http.post(
          Uri.parse('$urlServeur/api/utilisateur/auth'),
          headers: {'Content-type': 'application/json'},
          body: json.encode(utilisateur));
      String jsonReponse = response.body;
      print(jsonReponse);
      print('$urlServeur/api/utilisateur/auth');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('erreur:$e');
      return false;
    }
  }

  /// Récupère la liste des utilisateurs
  /// @return List<Utilisateur>
  static Future<List<Utilisateur>> recupererUtilisateur() async {
    List<Utilisateur> utilisateurs = [];
    try {
      String token = '';
      await StockageDonneesService.getValuesInPreferences('token')
          .then((value) => {
             token = value,
              });
      var response =
          await http.get(Uri.parse('$urlServeur/api/aliment/lister'), headers: {
         'Content-Type': 'application/json',
         'Authorization': token,
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        for (var element in data) {
          Utilisateur utilisateur = Utilisateur.fromJson(element);
          utilisateurs.add(utilisateur);
        }
      }
    } catch (e) {}
    return utilisateurs;
  }
}
