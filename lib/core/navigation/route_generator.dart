import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/video_call_screen.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/voice_call_screen.dart';
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/more_screen/about/about_app_screen.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/more_screen/feedback/feedback_screen.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/more_screen/privacy_policy/privacy_policy_screen.dart';
import 'package:upgrade_traine_project/features/restaurant/data/model/response/plates_model.dart';

import '../../di/service_locator.dart';
import '../../features/account/presentation/screen/account_verification_screen.dart';
import '../../features/account/presentation/screen/change_password_screen.dart';
import '../../features/account/presentation/screen/create_new_password_screen.dart';
import '../../features/account/presentation/screen/forgot_password_screen.dart';
import '../../features/account/presentation/screen/login_screen.dart';
import '../../features/account/presentation/screen/register_screen.dart';
import '../../features/category/domain/entity/category_entity.dart';
import '../../features/category/presentation/screen/category_list_screen.dart';
import '../../features/coach/presentation/screen/coach_profile_screen.dart';
import '../../features/coach/presentation/screen/coaches_list_screen.dart';
import '../../features/home/presentation/screen/home_screen/home_screen.dart';
import '../../features/home/presentation/screen/navigator_screen.dart';
import '../../features/profile/presentation/screen/edit_profile_screen.dart';
import '../../features/restaurant/presentation/screen/plates_view.dart';
import '../../features/restaurant/presentation/screen/all_restaurants.dart';
import '../../features/shop/presentation/screen/shops_view.dart';
import '../../features/splash/presentation/screen/intro_screen.dart';
import '../params/screen_params/account_verification_screen_params.dart';
import '../params/screen_params/create_new_password_screen_params.dart';
import 'animations/animated_route.dart';
import 'animations/fade_route.dart';
import 'navigation_service.dart';

@lazySingleton
class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      //agora voice call screen
      case VoiceCallScreen.routeName:
        int? trainerId;
        String? channelName;
        String? remoteName;

        if (settings.arguments != null) {
          trainerId = ((settings.arguments as Map)['id'] as int);
          channelName = ((settings.arguments as Map)['channel_name'] as String);
          remoteName = ((settings.arguments as Map)['remote_name'] as String);
        }
        return AnimatedRoute(
            page: VoiceCallScreen(trainerId, channelName!,
                remoteName: remoteName!),
            settings: settings);
      //agora video call screen
      case VideoCallScreen.routeName:
        int? trainerId;
        String? channelName;
        String? remoteName;

        if (settings.arguments != null) {
          trainerId = ((settings.arguments as Map)['id'] as int);
          channelName = ((settings.arguments as Map)['channel_name'] as String);
          remoteName = ((settings.arguments as Map)['remote_name'] as String);
        }
        return AnimatedRoute(
            page: VideoCallScreen(trainerId, channelName!,
                remoteName: remoteName!),
            settings: settings);
      case LoginScreen.routeName:
        return AnimatedRoute(
            page: LoginScreen(
              executeOnInit: settings.arguments != null
                  ? settings.arguments as Function(BuildContext)
                  : (context) {},
            ),
            settings: settings);
      case IntroScreen.routeName:
        return FadeRoute(page: const IntroScreen(), settings: settings);
      case RegisterScreen.routeName:
        return AnimatedRoute(page: const RegisterScreen(), settings: settings);
      case HomeScreen.routeName:
        return FadeRoute(page: HomeScreen(), settings: settings);
      case NavigatorScreen.routeName:
        return FadeRoute(page: const NavigatorScreen(), settings: settings);
      case AccountVerificationScreen.routeName:
        AccountVerificationScreenParams params =
            settings.arguments as AccountVerificationScreenParams;
        return AnimatedRoute(
            page: AccountVerificationScreen(
              onVerify: params.onVerification,
              phoneNumber: params.phone,
              isCreateNewPassword: params.isCreateNewPassword,
            ),
            settings: settings);
      case ForgotPasswordScreen.routeName:
        return AnimatedRoute(
            page: const ForgotPasswordScreen(), settings: settings);
      case CreateNewPasswordScreen.routeName:
        CreateNewPasswordScreenParams params =
            settings.arguments as CreateNewPasswordScreenParams;
        return AnimatedRoute(
            page: CreateNewPasswordScreen(
              // code: params.code,
              phone: params.phone,
            ),
            settings: settings);
      case CategoryListScreen.routeName:
        return AnimatedRoute(
            page: const CategoryListScreen(), settings: settings);
      case CoachesListScreen.routeName:
        CategoryEntity? categoryEntity;
        if (settings.arguments != null) {
          categoryEntity = (settings.arguments as CategoryEntity);
        }
        return AnimatedRoute(
            page: CoachesListScreen(
              categoryEntity: categoryEntity,
            ),
            settings: settings);
      case CoachProfileScreen.routeName:
        return AnimatedRoute(
            page: CoachProfileScreen(
              coachModel: settings.arguments as CoachEntity,
            ),
            settings: settings);
      case EditProfileScreen.routeName:
        return AnimatedRoute(
            page: const EditProfileScreen(), settings: settings);
      case PrivacyPolicyScreen.routeName:
        return AnimatedRoute(
            page: const PrivacyPolicyScreen(), settings: settings);
      case AboutAppScreen.routeName:
        return AnimatedRoute(page: const AboutAppScreen(), settings: settings);
      case FeedbackScreen.routeName:
        return AnimatedRoute(page: const FeedbackScreen(), settings: settings);
      case RestaurantView.routeName:
        return AnimatedRoute(page: RestaurantView(), settings: settings);
      case PlatesView.routeName:
        return AnimatedRoute(
            page: PlatesView(
              platesModel: settings.arguments as PlatesModel,
            ),
            settings: settings);
      case ShopsView.routeName:
        return AnimatedRoute(page: ShopsView(), settings: settings);
      case ChangePasswordScreen.routeName:
        return AnimatedRoute(
            page: const ChangePasswordScreen(), settings: settings);
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(
                  getIt<NavigationService>().getNavigationKey.currentContext!)
              .scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ROUTE ERROR CHECK THE ROUTE GENERATOR'),
          ),
        );
      },
    );
  }
}
