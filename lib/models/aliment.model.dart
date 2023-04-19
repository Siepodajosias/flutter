class Aliment {
  late final int id;
  late final int prix;
  late final int quantite;
  late final String designation;
  late final String description;

  Aliment(this.id,
          this.prix,
          this.quantite,
          this.designation,
          this.description) {}

  Aliment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prix = json['prix'];
    quantite = json['quantite'];
    designation = json['designation'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['prix'] = prix;
    data['quantite'] = quantite;
    data['designation'] = designation;
    data['description'] = description;
    return data;
  }

}
