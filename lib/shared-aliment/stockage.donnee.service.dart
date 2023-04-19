import 'package:shared_preferences/shared_preferences.dart';

class StockageDonneesService{

    /// Trouver une value dans le cache
    /// @param key
    static Future<String> getValuesInPreferences(String key) async {
      //await est l'équivalent des observables en angular. indique un rang d'execussion
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key)!;
    }

    /// Enregistrer le token de l'utilisateur connecté dans le cache.
    /// @param token
    static enregistrerToken(String token) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
    }

    /// Vider le cache local
    static Future<void> cleanAllValuesInPreferences() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    }

}
