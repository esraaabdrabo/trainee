
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../bloc/home_cubit.dart';

class SplashScreenNotifier extends ScreenNotifier {
  final HomeCubit homeCubit = HomeCubit();

  @override
  void closeNotifier() {}
}
