/// API
// ignore_for_file: constant_identifier_names

class APIUrls {
  /// Domain url
  static const BASE_URL = "https://api.yacotch.com/api";
  static const BASE_JSON_PLACEHOLDER = "https://jsonplaceholder.typicode.com/";
  static const BASE_URL_MAP =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";
  static const placeLocationBaseUrl =
      'https://maps.googleapis.com/maps/api/place/details/json';
  static const directionsBaseUrl =
      'https://maps.googleapis.com/maps/api/directions/json';
  static const KEY_MAP = "AIzaSyC3omLdU3qLrhCHEp34jLFJf_GZfTssvCU";

  /// Urls
  static const API_REGISTER = "/services/app/Account/Register";

  ///TODO: passed success
  static const API_LOGIN = "/TokenAuth/Authenticate";
  static const API_CREATE_REPORT = "/services/app/Report/Create";

  ///TODO: passed success
  static const API_FORGOT_PASSWORD = "/services/app/Account/ForgotPassword";
  static const API_CREATE_NEW_PASSWORD =
      "/services/app/Account/ConfirmForgotPassword";
  static const API_CHANGE_PASSWORD = "/services/app/User/ChangePassword";
  static const API_DELETE_ACCOUNT = "/services/app/Trainee/DeleteAccount";

  ///TODO:passed success
  static const API_VERIFY_ACCOUNT = "/services/app/Account/VerifyAccount";
  static const API_SEND_VC = "/services/app/Account/ResendCode";
  static const API_GET_ALL_CATEGORIES = "/services/app/Category/GetAll";

  ///TODO: passed success
  static const API_GET_ALL_RESTAURANTS = "/services/app/Restaurant/GetAll";
  static const API_GET_ALL_COACHES = "/services/app/Trainer/GetAll";
  static const API_GET_ALL_SHOPS = "/services/app/Shop/GetAll";
  static const API_GET_INDEX = "/services/app/Index/GetAllLite";
  static const API_GET_STORIES = "/services/app/Story/GetAll";
  static const API_GET_STORY = "/services/app/Story/Get";
  static const API_GET_PLATES = "/services/app/Dish/GetAll";
  static const API_GET_PRODUCTS = "/services/app/Product/GetAll";
  static const API_GET_PROFILE = "/services/app/Trainee/GetProfile";
  static const API_GET_TRAINERS = "/services/app/Trainer/TranieeTrainers";
  static const API_GET_COURSES = "/services/app/Course/GetAll";
  static const API_GET_REVIEW = "/services/app/Review/GetAll";
  static const API_BOOK_COURSE = "/services/app/BookingRequest/Create";
  static const API_CREATE_REVIEW = "/services/app/Review/Create";
  static const API_USER_PROFILE_UPDATE = "/services/app/Trainee/UpdateProfile";
  static const API_USER_Image_UPDATE = "/services/app/Image/UploadImage";
  static const API_Get_Payment_Create = "/services/app/Payment/Create";
  static const API_Get_Order_Create = "/services/app/order/Create";
  static const API_GET_NOTIFICATIONS = "/services/app/Notification/GetAll";
  static const API_CREATE_NOTIFICATIONS =
      "/services/app/Notification/SendNewMessageNotification";
  static const API_UPDATE_DEVICE_TOKEN =
      "/services/app/Account/UpdateUserFirebaseToken";
  static const API_Upload_Image = "/services/app/Image/UploadImage";
  static const API_Upload_Story = "/services/app/Story/Create";
  static const API_GET_BOOKING_REQUESTS = "/services/app/BookingRequest/GetAll";
  static const API_APPROVE_BOOKING_REQUEST =
      "/services/app/BookingRequest/Approve";
  static const API_REJECT_BOOKING_REQUEST =
      "/services/app/BookingRequest/Reject";
}
