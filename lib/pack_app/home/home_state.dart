part of 'home.dart';

class HomeScreenDiDto {
  // ignore: avoid_unused_constructor_parameters
  HomeScreenDiDto.use(final Locator read);
}

HomeScreenState useHomeScreenState({
  required final Locator read,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'HomeScreenState',
        state: HomeScreenState(diDto: HomeScreenDiDto.use(read)),
      ),
    );

class HomeScreenState extends ContextfulLifeState {
  HomeScreenState({
    required this.diDto,
  });
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onChangeCurrentIndex(final int value) {
    _currentIndex = value;
    setState();
  }

  void onAddProject() {
    unawaited(showAddNewProject(getContext()));
  }

  final selectedTypes = <int>{0};
  void onSelectionChanged(final Set<int> newSet) {
    selectedTypes
      ..clear()
      ..addAll(newSet);
    setState();
  }

  final HomeScreenDiDto diDto;
}
