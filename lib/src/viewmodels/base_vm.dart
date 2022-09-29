import 'package:covidapp/src/providers/general.dart';
import 'package:covidapp/src/utils/navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseViewModel extends StateNotifier {
  final Reader read;
  late NavigationService _navigationService;

  BaseViewModel(this.read) {
    _navigationService = read(navService);
  }

  void setBusy(bool value) {}

  bool validateAndSave(dynamic _key) {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void pop() {
    _navigationService.goBack();
  }

  void navigateTo(String destination, {dynamic arguments}) async {
    await _navigationService.navigateTo(destination, arguments: arguments);
  }

  void navigateToReplacement(String destination, {dynamic arguments}) async {
    await _navigationService.navigateToReplacement(destination,
        arguments: arguments);
  }

  void navigatePopUntil(String destination, {dynamic arguments}) async {
    await _navigationService.navigatePopUntil(destination,
        arguments: arguments);
  }

  void navigateAndClearHistory(String destination, {dynamic arguments}) async {
    await _navigationService.navigateAndClearHistory(destination,
        arguments: arguments);
  }

  void navigateToAndRemoveUntil(String destination, String routeToRemoveUntil,
      {dynamic arguments}) async {
    await _navigationService.navigatePushAndRemoveUntil(
        destination, routeToRemoveUntil,
        arguments: arguments);
  }
}
