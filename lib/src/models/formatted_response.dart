class FormattedResponse {
  final bool success;
  final bool? deviceRegistered;
  final dynamic data;
  final String? responseCodeError;

  FormattedResponse({required this.success, this.deviceRegistered, this.data, this.responseCodeError});
}