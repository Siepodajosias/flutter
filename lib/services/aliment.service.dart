import 'dart:convert';
import 'package:aliment/models/aliment.model.dart';
import 'package:aliment/shared-aliment/stockage.donnee.service.dart';
import 'package:aliment/shared-aliment/url-serveur.dart';
import 'package:http/http.dart' as http;

class AlimentService {
  /// Méthode de récuperation de la liste des aliments
  /// @return List<Aliment>
  static Future<List<Aliment>> recupererAliment() async {
    List<Aliment> aliments = [];
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
          Aliment aliment = Aliment.fromJson(element);
          aliments.add(aliment);
        }
      }
    } catch (e) {}
    return aliments;
  }

  /// Méthode d'enregistrement d'un aliment
  /// @param aliment
  /// @return bool
  static Future<bool> enregistrerAliment(Aliment aliment) async {
    String token = '';
    await StockageDonneesService.getValuesInPreferences("token")
        .then((tokens) => {
              token = tokens,
            });
    try {
      var response = await http.post(
          Uri.parse("$urlServeur/api/aliment/enregistrer"),
          headers: {"Content-Type": "application/json", "Authorization": token},
          body: json.encode(aliment));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
