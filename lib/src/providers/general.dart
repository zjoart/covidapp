import 'package:covidapp/src/services/covid_http_service.dart';
import 'package:covidapp/src/utils/navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navService = Provider<NavigationService>((ref) => NavigationService());
final covidHttpServiceProvider =
    Provider<CovidHttpService>((ref) => CovidHttpService());
