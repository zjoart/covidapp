import 'package:covidapp/src/http/api_manager.dart';
import 'package:covidapp/src/models/country_data_model.dart';
import 'package:covidapp/src/models/word_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CovidHttpService extends ApiManager {
  CovidHttpService(Reader read) : super(read);

  final _worldWideDataRoute = '/all';
  final _mostAffectedCountryRoute = '/countries?yesterday=false&sort=deaths';

  Future<WorldDataModel> getWorldwideData() async {
    final response = await getHttp(_worldWideDataRoute);
    return response.data;
  }

  Future<CountryDataModel> mostAffectedCountries() async {
    final response = await getHttp(_mostAffectedCountryRoute);
    return response.data;
  }
}
