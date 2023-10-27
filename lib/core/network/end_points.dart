class EndPoint {
  // static const String baseUrl =
  //     "https://tahara-backend-pilot.inovola-stage.com/api";
  static const String baseUrl =
      "http://tahara-backend.inovola-stage.com/api";

  static const String getAllArticle = "/get-articles";
  static const String getArticle = "/get-article/";
  static const String getAllCampaign = "/get-campaigns";
  static const String getAllArticleCampaign = "/get-categories-with-articles";
  static const String getAllCategoriesWithCampaign =
      "/get-categories-with-campaigns";
  static const String GET_WEEK_DATA = "/get-week-details";
  static const String getAllPrivacyData = "/get-privacy-policy";
  static const String signUp = "/register";
  static const String logIn = "/login";
  static const String getUserReport = "/get-user-report";
  static const String logOut = "/logout";
  static const String updateProfile = "/update-profile";
  static const String termsCondition = "/get-terms-and-conditions";
  static const String about = "/get-about";
  static const String verificationEmail = "/email/verification-notification";
  static const String changePassword = "/change-password";
  static const String forgetPassword = "/password/email/code";
  static const String checkPassword = "/password/code/check";
  static const String changePass = "/password/reset";
  static const String getRandomTip = "/get-random-tip";
  static const String getTipsForPeriod = "/get-tips-for-today";
  static const String verifyEmailPhone = "/verify-email-phone";
  static const String socialLogin = "/social-login";
  static const String addSymptoms = "/post-day-symptoms";
  static const String getAllSymptoms = "/get-symptom-attributes";
  static const String getSymptomsByDay = "/get-day-symptom-values";
  static const String getTipForDetectedPeriod = "/get-tips-for-period-day";
  static const String getCycleUserData = "/get-user-cycles";
  static const String addCycleData = "/add-cycle";
  static const String updateCycleData = "/update-cycle";
  static const String getActualAndNexCycle =
      "/get-actual-and-next-expected-cycels";
  static const String findTheActionOfButton = "/get-day-symptom-values";
  static const String search = "/search";
  static const String getUserCycle = "/get-user-history";
  static const String getAllNotification = "/get-all-notifications";
  static const String markNotificationAsRead = "/notification-mark-as-readed";
  static const String getAllFAQS = "/get-faqs";
  static const String sendContact = "/send-contact";
  static const String confirmFollowPregnant = "/confirm-follow-pregnant";
  static const String sendVerificationCode = "/get-verification-code";
  static const String checkVerification = "/check-verification-code";
  static const String sendNewsletter = "/send-newsletter";
  static const String changelang = "/change-lang";
}
