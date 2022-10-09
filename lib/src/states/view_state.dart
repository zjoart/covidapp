enum ViewState {
  idle(false),
  loading(true),
  error(true);

  const ViewState(this.isLoading);
  final bool isLoading;
}
