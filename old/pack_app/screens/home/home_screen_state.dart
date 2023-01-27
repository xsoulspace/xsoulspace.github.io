part of 'home_screen.dart';

class _HomeScreenDiDto {
  // ignore: avoid_unused_constructor_parameters
  _HomeScreenDiDto.use(final Locator read);
}

_HomeScreenState _useHomeScreenState({required final Locator read}) => use(
      LifeHook(
        debugLabel: '_HomeScreenState',
        state: _HomeScreenState(diDto: _HomeScreenDiDto.use(read)),
      ),
    );

class _HomeScreenState extends LifeState {
  _HomeScreenState({
    required this.diDto,
  });
  final appsKey = GlobalKey();
  final gamesKey = GlobalKey();
  final scrollController = ScrollController();
  final backgroundScrollController = ScrollController();
  final _HomeScreenDiDto diDto;

  @override
  void dispose() {
    scrollController.dispose();
    backgroundScrollController.dispose();
    super.dispose();
  }
}
