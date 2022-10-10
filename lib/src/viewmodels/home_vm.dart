import 'package:covidapp/src/models/country_data_model.dart';
import 'package:covidapp/src/models/word_data_model.dart';
import 'package:covidapp/src/providers/general.dart';
import 'package:covidapp/src/services/covid_http_service.dart';
import 'package:covidapp/src/states/home_state.dart';
import 'package:covidapp/src/states/view_state.dart';
import 'package:covidapp/src/utils/navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  late NavigationService _navigationService;
  late CovidHttpService _service;
  HomeViewModel(Ref ref) : super(HomeState.initial()) {
    _navigationService = ref.read(navService);
    _service = ref.read(covidHttpServiceProvider);
    getALLData();
  }

  void setBusy(ViewState viewState) {
    state = state.copyWith(viewState: viewState);
  }

  getALLData() async {
    setBusy(ViewState.loading);
    try {
      final res = await Future.wait(
          [_service.getWorldwideData(), _service.mostAffectedCountries()]);
      state = state.copyWith(
          viewState: ViewState.idle,
          countryDataModel: res[1] as List<CountryDataModel>,
          worldDataModel: res[0] as WorldDataModel);
    } catch (e) {
      state = state.copyWith(
          viewState: ViewState.idle,
          countryDataModel: null,
          worldDataModel: null);
    }
  }

  void pop() {
    _navigationService.goBack();
  }

  void navigateTo(String destination, {dynamic arguments}) async {
    await _navigationService.navigateTo(destination, arguments: arguments);
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
    (ref) => HomeViewModel(ref));
