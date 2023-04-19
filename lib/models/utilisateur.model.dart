class Utilisateur {
  late final String nom;
  late final String prenom;
  late final String numero;
  late final String login;
  late final String password;
  late final String role;
  Utilisateur({required this.nom, required this.prenom, required this.numero,
    required this.password, required this.login,required this.role}) {}

  Utilisateur.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    numero = json['numero'];
    login = json['login'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['numero'] = numero;
    data['login'] = login;
    data['password'] = password;
    /*if (this.client != null) {
      data['client'] = this.client.toJson();
    }*/
    return data;
  }

}
