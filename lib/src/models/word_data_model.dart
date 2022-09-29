class WorldDataModel {
  late final double cases;
  late final double active;
  late final double recovered;
  late final double deaths;

  WorldDataModel(
      {required this.cases,
      required this.active,
      required this.recovered,
      required this.deaths});

  WorldDataModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'].toDouble();
    active = json['active'].toDouble();
    recovered = json['recovered'].toDouble;
    deaths = json['deaths'].toDouble();
  }
}
