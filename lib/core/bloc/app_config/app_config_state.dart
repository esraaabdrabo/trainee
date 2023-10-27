part of 'app_config_cubit.dart';

class AppConfigState extends Equatable {
  final bool? isApplicationStarted;

  // Current user profile.
  final Profile? profile;

  AppConfigState({
    this.isApplicationStarted,
    this.profile,
  });

  AppConfigState copyWith({bool? isApplicationStarted, Profile? profile}) =>
      AppConfigState(
        isApplicationStarted: isApplicationStarted ?? this.isApplicationStarted,
        profile: profile ?? this.profile,
      );

  AppConfigState clearProfile() {
    return AppConfigState(
      isApplicationStarted: isApplicationStarted,
    );
  }

  @override
  List<Object> get props => [];

  Future<bool> get isUserAuthenticated async => await AppConfig().hasToken;

  Future<bool> get isUserVerified async =>
      await isUserAuthenticated &&
      this.profile != null &&
      this.profile!.phoneConfirmed;

  static AppConfigState get initialState => AppConfigState();
}
