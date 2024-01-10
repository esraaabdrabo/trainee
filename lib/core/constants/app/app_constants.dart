// ignore_for_file: constant_identifier_names

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralizing application constants
class AppConstants {
  static const TITLE_APP_NAME = 'Yacotch';

  /// Shared Preference keys
  static const KEY_LANGUAGE = LANG_AR;
  static const KEY_TOKEN = 'token';
  static const KEY_ENCRYPTED_TOKEN = '';
  static const KEY_PHONE = 'phone';
  static const KEY_FIREBASE_TOKEN = 'firebase_token';
  static const KEY_FIRST_START = 'First_start';
  static const KEY_APP_THEME = 'appTheme';
  static const KEY_LONGITUDE = 'longitude';
  static const KEY_LATITUDE = 'latitude';
  static const FONT_FAMILY = 'Tajawal';

  /// Headers
  static const HEADER_AUTH = 'authorization';
  static const HEADER_APP_VERSION = 'appversion';
  static const HEADER_OS = 'os';
  static const HEADER_SESSION = 'session';
  static const HEADER_LANGUAGE = 'Accept-Language';

  /// Animations

  /// ERROR ANIMATIONS
  static const ANIM_LOTTIE_ERROR =
      "assets/anim/lottie/error/general_error_placeholder.json";
  static const ANIM_LOTTIE_ERROR_403_401 =
      "assets/images/png/error/403-error.png";
  static const ANIM_LOTTIE_ERROR_EMPTY =
      "assets/images/png/error/empty_placeholder.png";
  static const ANIM_LOTTIE_ERROR_INVALID =
      "assets/images/png/error/invalid_error.png";
  static const ANIM_LOTTIE_ERROR_SERVER =
      "assets/images/png/error/500-error.png";
  static const ANIM_LOTTIE_ERROR_TIMEOUT =
      "assets/images/png/error/timout_error.png";
  static const ANIM_LOTTIE_ERROR_UNKNOWING =
      "assets/images/png/error/unknown_error.png";
  // connection, not found

  /// Image
  static const defaultRestaurantImage =
      'https://th.bing.com/th/id/OIP.MlZXr9dd8Om34xx-wydaQQHaE9?pid=ImgDet&rs=1';
  static const defaultShopImage =
      'https://i.pinimg.com/originals/70/97/e7/7097e7a47ec728f0c2f62631c90cd451.jpg';
  static const LOGIN_BACKGROUND = "assets/png/login_background.jpg";
  static const REGISTER_BACKGROUND = "assets/png/register_background.png";
  static const APP_LOGO_IMG = "assets/images/png/app_logo.png";
  static const APP_LOGO_IMG_HORIZONTAL =
      "assets/images/png/app_logo_horizontal.png";
  static const INTRO_BACK1_IMG = "assets/images/png/intro_back1.png";
  static const INTRO_BACK2_IMG = "assets/images/png/intro_back2.png";
  static const INTRO_BACK3_IMG = "assets/images/png/intro_back3.png";
  static const PLAY_IMG = "assets/images/png/play.png";
  static const SHADOW1_IMG = "assets/images/png/shadow1.png";
  static const SHADOW2_IMG = "assets/images/png/shadow2.png";
  static const SHADOW3_IMG = "assets/images/png/shadow3.png";
  static const CARD_IMG = "assets/images/png/card.png";
  static const HOME_ICON = "assets/images/png/home_icon.png";
  static const MAIL_ICON = "assets/images/png/mail_icon.png";
  static const SEARCH_ICON = "assets/images/png/search_icon.png";
  static const PROFILE_ICON = "assets/images/png/profile_icon.png";
  static const MAP_STYLE_JSON = "assets/map_styles/dark_style.json";
  static const BOXER_ICON = "assets/images/png/boxer_icon.png";
  static const RESTAURANT_ICON = "assets/images/png/restaurant_icon.png";
  static const STORE_ICON = "assets/images/png/store_icon.png";
  static const WHISTLE_ICON = "assets/images/png/whistle_icon.png";
  static const YOGA_IMG = "assets/images/png/temp/yoga_img.png";
  static const BIKE_RIDING_IMG = "assets/images/png/temp/bike_riding_img.png";
  static const KARAM_IMG = "assets/images/png/temp/karam_img.png";
  static const KCAL2_IMG = "assets/images/png/temp/kcal2_img.png";
  static const KCAL_IMG = "assets/images/png/temp/kcal_img.png";
  static const MOTCHY2_IMG = "assets/images/png/temp/motchy2_img.png";
  static const MOTCHY_IMG = "assets/images/png/temp/motchy_img.png";
  static const SWIMMING_IMG = "assets/images/png/temp/swimming_img.png";
  static const VEGGIE2_IMG = "assets/images/png/temp/veggie2_img.png";
  static const VEGGIE_IMG = "assets/images/png/temp/veggie_img.png";
  static const WEIGHT_LIFTING_IMG =
      "assets/images/png/temp/weight_lifting_img.png";
  static const TRAINEE_IMG = "assets/images/png/trainee.png";
  static const COACH1_IMAGE = "assets/images/png/temp/coach1.png";
  static const COACH2_IMAGE = "assets/images/png/temp/coach2.png";
  static const COACH3_IMAGE = "assets/images/png/temp/coach3.png";
  static const COACH4_IMAGE = "assets/images/png/temp/coach4.png";
  static const COACH5_IMAGE = "assets/images/png/temp/coach15.png";
  static const MALE_ICON = "assets/images/png/male_icon.png";
  static const FEMALE_ICON = "assets/images/png/female_icon.png";
  static const KID_ICON = "assets/images/png/kid_icon.png";
  static const FILTER_ICON = "assets/images/png/filter_icon.png";
  static const COACH_COVER_IMG = "assets/images/png/temp/coach_cover.png";
  static const CLOCK_IMG = "assets/images/png/clock_img.png";
  static const VIDEO_CALL_ICON = "assets/images/png/video_call_icon.png";
  static const PHONE_CALL_ICON = "assets/images/png/phone_call_icon.png";
  static const CHAT_ICON = "assets/images/png/chat_icon.png";
  static const MASTER_CARD_IMG = "assets/images/png/temp/master_card_img.png";
  static const LIKE_ICON = "assets/images/png/like_icon.png";
  static const SHARE_ICON = "assets/images/png/share_icon.png";
  static const EDIT_PROFILE_ICON = "assets/images/png/edit_profile_icon.png";
  static const CALL_ICON = "assets/images/png/call_icon.png";
  static const LOCATION_ICON = "assets/images/png/location_icon.png";
  static const CAMERA_ICON = "assets/images/png/camera_icon.png";
  static const MARKER_ICON = "assets/images/png/marker_icon.png";
  static const PLACE_MARKER_RED_ICON =
      "assets/images/png/place_marker_red_icon.png";
  static const PLACE_MARKER_YELLOW_ICON =
      "assets/images/png/place_marker_yellow_icon.png";
  static const PLACE_MARKER_GREEN_ICON =
      "assets/images/png/place_marker_green_icon.png";
  static const PLACE_MARKER_BLUE_ICON =
      "assets/images/png/place_marker_blue_icon.png";

  /// Svg

  /// ERROR IMAGES
  static const ERROR_403_401 = "assets/images/png/error/403.png";
  static const ERROR_EMPTY = "assets/images/png/error/empty.png";
  static const ERROR_INVALID = "assets/images/png/error/invalid.png";
  static const ERROR_SERVER = "assets/images/png/error/server_error.png";
  static const ERROR_TIMEOUT = "assets/images/png/error/time_out.png";
  static const ERROR_UNKNOWING = "assets/images/png/error/unknowing_error.png";

  /// Languages
  static const LANG_AR = 'ar';
  static const LANG_EN = 'en';

  /// Languages code & output
  static const LANG_AR_CODE = 'AR';
  static const LANG_EN_CODE = 'EN';

  static const LANG_AR_OUTPUT = 'العربية';
  static const LANG_EN_OUTPUT = 'English';

  static const DEFAULT_COUNTRY_CODE = 'SA';
  static const DEFAULT_COUNTRY_DIAL = '+966';

  /// APP constants
  static const MENU_CHANGE_LANG = "assets/png/menu/change_lang.png";
  static const MENU_LOGOUT = "assets/png/menu/logout.png";

  /// Mock Json API Token
  static const MOCK_JSON_TOKEN = 'H6HWs31en2BV1yYbXpkARg';

  ///Border radius
  static double borderRadius2 = 2.r;
  static double borderRadius3 = 3.r;
  static double borderRadius4 = 4.r;
  static double borderRadius6 = 6.r;
  static double borderRadius7 = 7.r;
  static double borderRadius8 = 8.r;
  static double borderRadius10 = 10.r;
  static double borderRadius12 = 12.r;
  static double borderRadius24 = 24.r;
  static double borderRadius32 = 32.r;

  ///Text sizes
  static double textSize8 = 8.sp;
  static double textSize10 = 10.sp;
  static double textSize12 = 12.sp;
  static double textSize14 = 14.sp;
  static double textSize15 = 15.sp;
  static double textSize16 = 16.sp;
  static double textSize18 = 18.sp;
  static double textSize20 = 20.sp;
  static double textSize24 = 24.sp;
  static double textSize40 = 40.sp;
  static double textSize48 = 48.sp;

  ///Blur degree
  static const double blurDegree = 5;
  static const double blurDegree10 = 10;

  static const int pageLength = 10;
}
