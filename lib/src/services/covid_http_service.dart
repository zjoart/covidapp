import 'package:covidapp/src/http/api_manager.dart';
import 'package:covidapp/src/models/country_data_model.dart';
import 'package:covidapp/src/models/word_data_model.dart';

class CovidHttpService extends ApiManager {
  CovidHttpService() : super();

  final _worldWideDataRoute = '/all';
  final _mostAffectedCountryRoute = '/countries?yesterday=false&sort=deaths';

  Future<WorldDataModel> getWorldwideData() async {
    final response = await getHttp(_worldWideDataRoute);
    return WorldDataModel.fromJson(response.data);
  }

  Future<List<CountryDataModel>> mostAffectedCountries() async {
    final response = await getHttp(_mostAffectedCountryRoute);
    final res = response.data.map((e) => CountryDataModel.fromJson(e)).toList();
    return res;
  }
}
