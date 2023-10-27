part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.splashInitState() = SplashInitState;

  const factory SplashState.splashLoadingState() = SplashLoadingState;

  const factory SplashState.splashErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = SplashErrorState;
}
