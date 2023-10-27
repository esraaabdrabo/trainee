import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:upgrade_traine_project/core/common/session_data.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/maps_cubit.dart';

import '../../di/service_locator.dart';
import '../../features/account/presentation/state_m/bloc/account_cubit.dart';
import '../../features/home/data/datasource/home_remote.dart';
import '../../features/home/data/repository/place_suggestation.dart';
import '../bloc/app_config/app_config_cubit.dart';
import '../localization/localization_provider.dart';

/// Centralizing all app providers in one class to be easy to adjust and read
class ApplicationProvider {
  static ApplicationProvider _instance = ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    /// Change notifier provider
    ChangeNotifierProvider.value(
      value: getIt<LocalizationProvider>(),
    ),
    ChangeNotifierProvider.value(
      value: getIt<SessionDataProvider>(),
    ),

    /// Bloc provider
    BlocProvider(
      create: (context) => AppConfigCubit(),
    ),
    BlocProvider(
      create: (cotext) => MapsCubit(
        PlaceSuggestationRepo(
          PlacesWebServices(),
        ),
      ),
    ),
    BlocProvider(
      create: (context) => AccountCubit(),
      lazy: true,
    ),
  ];

  List<SingleChildWidget> uiChangesItems = [];

  void dispose(BuildContext context) {
    Provider.of<LocalizationProvider>(context).dispose();
    Provider.of<AppConfigCubit>(context).close();
    Provider.of<AccountCubit>(context).close();
    Provider.of<SessionDataProvider>(context).dispose();
  }
}
