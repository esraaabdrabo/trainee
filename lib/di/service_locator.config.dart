// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i38;
import 'package:shared_preferences/shared_preferences.dart' as _i45;
import 'package:upgrade_traine_project/core/common/session_data.dart' as _i44;
import 'package:upgrade_traine_project/core/common/style/text_styles.dart'
    as _i3;
import 'package:upgrade_traine_project/core/localization/localization_provider.dart'
    as _i37;
import 'package:upgrade_traine_project/core/navigation/navigation_service.dart'
    as _i41;
import 'package:upgrade_traine_project/core/navigation/route_generator.dart'
    as _i40;
import 'package:upgrade_traine_project/core/net/http_client.dart' as _i4;
import 'package:upgrade_traine_project/core/theme/theme_config.dart' as _i49;
import 'package:upgrade_traine_project/di/modules/logger_module.dart' as _i63;
import 'package:upgrade_traine_project/di/modules/shared_preferences_module.dart'
    as _i64;
import 'package:upgrade_traine_project/features/account/data/datasources/account_remote.dart'
    as _i6;
import 'package:upgrade_traine_project/features/account/data/datasources/iaccount_remote.dart'
    as _i5;
import 'package:upgrade_traine_project/features/account/data/repository/account_repository.dart'
    as _i8;
import 'package:upgrade_traine_project/features/account/domain/repository/iaccount_repository.dart'
    as _i7;
import 'package:upgrade_traine_project/features/account/domain/usecase/change_password_usecase.dart'
    as _i51;
import 'package:upgrade_traine_project/features/account/domain/usecase/create_new_password_usecase.dart'
    as _i53;
import 'package:upgrade_traine_project/features/account/domain/usecase/forgot_password_usecase.dart'
    as _i54;
import 'package:upgrade_traine_project/features/account/domain/usecase/login_usecase.dart'
    as _i39;
import 'package:upgrade_traine_project/features/account/domain/usecase/register_usecase.dart'
    as _i42;
import 'package:upgrade_traine_project/features/account/domain/usecase/send_vc_usecase.dart'
    as _i43;
import 'package:upgrade_traine_project/features/account/domain/usecase/verify_account_usecase.dart'
    as _i50;
import 'package:upgrade_traine_project/features/category/data/datasource/category_remote.dart'
    as _i10;
import 'package:upgrade_traine_project/features/category/data/datasource/icategory_remote.dart'
    as _i9;
import 'package:upgrade_traine_project/features/category/data/repository/category_repository.dart'
    as _i12;
import 'package:upgrade_traine_project/features/category/domain/repository/icategory_repository.dart'
    as _i11;
import 'package:upgrade_traine_project/features/category/domain/usecase/get_categories_usecase.dart'
    as _i55;
import 'package:upgrade_traine_project/features/coach/data/datasource/coach_remote.dart'
    as _i14;
import 'package:upgrade_traine_project/features/coach/data/datasource/icoach_remote.dart'
    as _i13;
import 'package:upgrade_traine_project/features/coach/data/repository/coach_repository.dart'
    as _i16;
import 'package:upgrade_traine_project/features/coach/domain/repository/icoach_repository.dart'
    as _i15;
import 'package:upgrade_traine_project/features/coach/domain/usecase/get_coaches_usecase.dart'
    as _i56;
import 'package:upgrade_traine_project/features/home/data/datasource/home_remote.dart'
    as _i18;
import 'package:upgrade_traine_project/features/home/data/datasource/ihome_remote.dart'
    as _i17;
import 'package:upgrade_traine_project/features/home/data/repository/home_repository.dart'
    as _i20;
import 'package:upgrade_traine_project/features/home/domain/repository/ihome_repository.dart'
    as _i19;
import 'package:upgrade_traine_project/features/home/domain/usecase/comments_usecase.dart'
    as _i52;
import 'package:upgrade_traine_project/features/home/domain/usecase/get_index_usecase.dart'
    as _i57;
import 'package:upgrade_traine_project/features/home/domain/usecase/get_people_usecase.dart'
    as _i58;
import 'package:upgrade_traine_project/features/home/domain/usecase/get_stories_usecase.dart'
    as _i61;
import 'package:upgrade_traine_project/features/home/domain/usecase/get_story_usecase.dart'
    as _i62;
import 'package:upgrade_traine_project/features/home/domain/usecase/test_failure_usecase.dart'
    as _i46;
import 'package:upgrade_traine_project/features/home/domain/usecase/test_success_usecase.dart'
    as _i47;
import 'package:upgrade_traine_project/features/home/domain/usecase/test_validator_usecase.dart'
    as _i48;
import 'package:upgrade_traine_project/features/profile/data/datasource/iprofile_remote.dart'
    as _i21;
import 'package:upgrade_traine_project/features/profile/data/datasource/profile_remote.dart'
    as _i22;
import 'package:upgrade_traine_project/features/profile/data/repository/profile_repository.dart'
    as _i24;
import 'package:upgrade_traine_project/features/profile/domain/repository/iprofile_repository.dart'
    as _i23;
import 'package:upgrade_traine_project/features/restaurant/data/datasource/irestaurant_remote.dart'
    as _i25;
import 'package:upgrade_traine_project/features/restaurant/data/datasource/restaurant_remote.dart'
    as _i26;
import 'package:upgrade_traine_project/features/restaurant/data/repository/restaurant_repository.dart'
    as _i28;
import 'package:upgrade_traine_project/features/restaurant/domain/repository/irestaurant_repository.dart'
    as _i27;
import 'package:upgrade_traine_project/features/restaurant/domain/usecase/get_restaurants_usecase.dart'
    as _i59;
import 'package:upgrade_traine_project/features/shop/data/datasource/ishop_remote.dart'
    as _i29;
import 'package:upgrade_traine_project/features/shop/data/datasource/shop_remote.dart'
    as _i30;
import 'package:upgrade_traine_project/features/shop/data/repository/shop_repository.dart'
    as _i32;
import 'package:upgrade_traine_project/features/shop/domain/repository/ishop_repository.dart'
    as _i31;
import 'package:upgrade_traine_project/features/shop/domain/usecase/get_shops_usecase.dart'
    as _i60;
import 'package:upgrade_traine_project/features/splash/data/datasource/isplash_remote.dart'
    as _i33;
import 'package:upgrade_traine_project/features/splash/data/datasource/splash_remote.dart'
    as _i34;
import 'package:upgrade_traine_project/features/splash/data/repository/splash_repository.dart'
    as _i36;
import 'package:upgrade_traine_project/features/splash/domain/repository/isplash_repository.dart'
    as _i35;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final facebookLoginModule = _$FacebookLoginModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.lazySingleton<_i3.AppTextStyles>(() => _i3.AppTextStyles());
    gh.lazySingleton<_i4.HttpClient>(() => _i4.HttpClient());
    gh.factory<_i5.IAccountRemoteSource>(() => _i6.AccountRemoteSource());
    gh.factory<_i7.IAccountRepository>(
        () => _i8.AccountRepository(gh<_i5.IAccountRemoteSource>()));
    gh.singleton<_i9.ICategoryRemoteSource>(_i10.CategoryRemoteSource());
    gh.singleton<_i11.ICategoryRepository>(
        _i12.CategoryRepository(gh<_i9.ICategoryRemoteSource>()));
    gh.singleton<_i13.ICoachRemoteSource>(_i14.CoachRemoteSource());
    gh.singleton<_i15.ICoachRepository>(
        _i16.CoachRepository(gh<_i13.ICoachRemoteSource>()));
    gh.factory<_i17.IHomeRemoteSource>(() => _i18.HomeRemoteSource());
    gh.factory<_i19.IHomeRepository>(
        () => _i20.HomeRepository(gh<_i17.IHomeRemoteSource>()));
    gh.singleton<_i21.IProfileRemoteSource>(_i22.ProfileRemoteSource());
    gh.singleton<_i23.IProfileRepository>(
        _i24.ProfileRepository(gh<_i21.IProfileRemoteSource>()));
    gh.singleton<_i25.IRestaurantRemoteSource>(_i26.RestaurantRemoteSource());
    gh.singleton<_i27.IRestaurantRepository>(
        _i28.RestaurantRepository(gh<_i25.IRestaurantRemoteSource>()));
    gh.singleton<_i29.IShopRemoteSource>(_i30.ShopRemoteSource());
    gh.singleton<_i31.IShopRepository>(
        _i32.ShopRepository(gh<_i29.IShopRemoteSource>()));
    gh.singleton<_i33.ISplashRemoteSource>(_i34.SplashRemoteSource());
    gh.singleton<_i35.ISplashRepository>(
        _i36.SplashRepository(gh<_i33.ISplashRemoteSource>()));
    gh.singleton<_i37.LocalizationProvider>(_i37.LocalizationProvider());
    gh.lazySingleton<_i38.Logger>(() => facebookLoginModule.facebookLogin);
    gh.factory<_i39.LoginUseCase>(
        () => _i39.LoginUseCase(gh<_i7.IAccountRepository>()));
    gh.lazySingleton<_i40.NavigationRoute>(() => _i40.NavigationRoute());
    gh.lazySingleton<_i41.NavigationService>(() => _i41.NavigationService());
    gh.factory<_i42.RegisterUseCase>(
        () => _i42.RegisterUseCase(gh<_i7.IAccountRepository>()));
    gh.factory<_i43.SendVCUseCase>(
        () => _i43.SendVCUseCase(gh<_i7.IAccountRepository>()));
    gh.singleton<_i44.SessionDataProvider>(_i44.SessionDataProvider());
    await gh.factoryAsync<_i45.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i46.TestFailureUseCase>(
        () => _i46.TestFailureUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i47.TestSuccessUseCase>(
        () => _i47.TestSuccessUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i48.TestValidatorUseCase>(
        () => _i48.TestValidatorUseCase(gh<_i19.IHomeRepository>()));
    gh.lazySingleton<_i49.ThemeConfig>(() => _i49.ThemeConfig());
    gh.factory<_i50.VerifyAccountUseCase>(
        () => _i50.VerifyAccountUseCase(gh<_i7.IAccountRepository>()));
    gh.factory<_i51.ChangePasswordUseCase>(
        () => _i51.ChangePasswordUseCase(gh<_i7.IAccountRepository>()));
    gh.factory<_i52.CommentsUseCase>(
        () => _i52.CommentsUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i53.CreateNewPasswordUseCase>(
        () => _i53.CreateNewPasswordUseCase(gh<_i7.IAccountRepository>()));
    gh.factory<_i54.ForgotPasswordUseCase>(
        () => _i54.ForgotPasswordUseCase(gh<_i7.IAccountRepository>()));
    gh.factory<_i55.GetCategoriesUseCase>(
        () => _i55.GetCategoriesUseCase(gh<_i11.ICategoryRepository>()));
    gh.factory<_i56.GetCoachesUseCase>(
        () => _i56.GetCoachesUseCase(gh<_i15.ICoachRepository>()));
    gh.factory<_i57.GetIndexUseCase>(
        () => _i57.GetIndexUseCase(homeRepository: gh<_i19.IHomeRepository>()));
    gh.factory<_i58.GetPeopleUseCase>(
        () => _i58.GetPeopleUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i59.GetRestaurantsUseCse>(
        () => _i59.GetRestaurantsUseCse(gh<_i27.IRestaurantRepository>()));
    gh.factory<_i60.GetShopsUseCase>(
        () => _i60.GetShopsUseCase(gh<_i31.IShopRepository>()));
    gh.factory<_i61.GetStoriesUseCase>(
        () => _i61.GetStoriesUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i62.GetStoryUseCase>(
        () => _i62.GetStoryUseCase(gh<_i19.IHomeRepository>()));
    return this;
  }
}

class _$FacebookLoginModule extends _i63.FacebookLoginModule {}

class _$SharedPreferencesModule extends _i64.SharedPreferencesModule {}
