import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/notifications/notification_service.dart';
import 'package:upgrade_traine_project/core/notifications/onmessage_listener.dart';
import 'package:upgrade_traine_project/firebase_options.dart';
import 'app.dart';
import 'core/common/app_config.dart';
import 'core/constants/app/app_constants.dart';
import 'core/constants/enums/app_options_enum.dart';
import 'core/errors/error_global_handler/catcher_handler.dart';
import 'core/localization/localization_provider.dart';
import 'core/navigation/navigation_service.dart';
import 'core/net/http_overrides.dart';
import 'core/ui/error_ui/errors_screens/build_error_screen.dart';
import 'di/service_locator.dart';
import 'generated/l10n.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await _initAppConfigs();

  /// 1.1.1 define a navigator key

  runApp(App(navigatorKey: navigatorKey));
}

_initAppConfigs() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  setupNotifications();
  FirebaseMessaging.onBackgroundMessage(HandleBackGround);

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    handleOnMessageListener(event);
  });
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);

  /// Injectable initialization
  await configureInjection();

  /// Init Language.
  await getIt<LocalizationProvider>().fetchLocale();

  /// Init app config
  AppConfig().initApp();

  /// Init rotation of app (Should be called after [AppConfig.initApp()])
  await _initAppRotation();

  /// Init error catcher to catch any red screen error and add ability to send
  /// a report to developer e-mail
  _initErrorCatcher();

  /// In case of network handshake error
  HttpOverrides.global = new BadCertHttpOverrides();
}

Future<void> _initAppRotation() async {
  final appOption = AppConfig().appOptions;

  switch (appOption.orientation) {
    case OrientationOptions.PORTRAIT:
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );
      break;
    case OrientationOptions.LANDSCAPE:
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
      break;
    case OrientationOptions.BOTH:
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
      break;
  }
}

void _initErrorCatcher() {
  final appOption = AppConfig().appOptions;
  if (appOption.enableErrorCatcher) {
    /// Initialize the error screen with our custom error catcher
    ErrorWidget.builder = (flutterErrorDetails) {
      final _catcherHandler = CatcherHandler();

      /// We must init the catcher handler parameters
      _catcherHandler.init();

      final context = getIt<NavigationService>().appContext;

      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(140)),
          child: Center(
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildErrorScreen(
                    disableRetryButton: true,
                    title: Translation.of(context!).errorOccurred,
                    content: Translation.of(context).reportError,
                    imageUrl: AppConstants.ERROR_UNKNOWING,
                    callback: null,
                    context: context,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      Translation.of(context).send,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      );
    };
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
