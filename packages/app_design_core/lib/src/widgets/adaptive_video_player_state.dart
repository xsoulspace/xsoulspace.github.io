part of 'adaptive_video_player_web.dart';

class AdaptiveVideoPlayerStateDiDto {
  AdaptiveVideoPlayerStateDiDto({
    required this.url,
  });
  final String url;
}

AdaptiveVideoPlayerState useAdaptiveVideoPlayerState({
  required final AdaptiveVideoPlayerStateDiDto diDto,
}) =>
    use(
      LifeHook(
        debugLabel: 'AdaptiveVideoPlayerState',
        state: AdaptiveVideoPlayerState(diDto: diDto),
      ),
    );

class AdaptiveVideoPlayerState extends LifeState {
  AdaptiveVideoPlayerState({
    required this.diDto,
  });
  final controller = WebViewController();

  final AdaptiveVideoPlayerStateDiDto diDto;

  bool loaded = false;
  @override
  void initState() {
    super.initState();
    onLoad();
  }

  Future<void> onLoad() async {
    await controller.loadHtmlString(diDto.url);
    loaded = true;
    setState();
  }

  @override
  void dispose() {
    // controller.close();
    super.dispose();
  }
}
