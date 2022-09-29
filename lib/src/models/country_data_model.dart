class CountryDataModel {
  late final String cases;
  late final String active;
  late final String recovered;
  late final String deaths;
  late final String critical;
  late final String flag;
  late final String country;

  CountryDataModel(
      {required this.cases,
      required this.active,
      required this.recovered,
      required this.deaths,
      required this.critical,
      required this.flag,
      required this.country});

  CountryDataModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'].toString();
    active = json['active'].toString();
    recovered = json['recovered'].toString();
    deaths = json['deaths'].toString();
    critical = json['critical'].toString();
    flag = json['countryInfo']['flag'];
    country = json['country'];
  }
}
