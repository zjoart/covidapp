import 'package:covidapp/src/models/country_data_model.dart';
import 'package:covidapp/src/models/word_data_model.dart';
import 'package:covidapp/src/states/view_state.dart';

class HomeState {
  final ViewState viewState;
  final WorldDataModel? worldDataModel;
  final List<CountryDataModel>? countryDataModel;
  const HomeState._(
      {required this.viewState,
      required this.worldDataModel,
      required this.countryDataModel});

  factory HomeState.initial() => const HomeState._(
      viewState: ViewState.idle, worldDataModel: null, countryDataModel: null);

  HomeState copyWith(
          {ViewState? viewState,
          WorldDataModel? worldDataModel,
          List<CountryDataModel>? countryDataModel}) =>
      HomeState._(
          viewState: viewState ?? this.viewState,
          worldDataModel: worldDataModel ?? this.worldDataModel,
          countryDataModel: countryDataModel ?? this.countryDataModel);
}
