class Validator {
  Validator.internal();
  static final Validator _instance = Validator.internal();
  factory Validator() => _instance;
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is Required ";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) {
      return 'Please Enter Your Correct email';
    }
    return null;
  }

  String? passwordValidator(String? value, context) {
    if (value == null || value.isEmpty) {
      return "This field is Required ";
    }
    if (!RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$")
        .hasMatch(value)|| value.length < 8) {
      return '';
    } else {
      return null;
    }
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your phone number ";
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Name ";
    }
    return null;
  }
  String? confirmPassword({required String? value, required String password}){

    if(value!.isEmpty){
      return 'This field is Required';

    }
    if (value !=
      password) {
      return "Please Enter Match Password";
    } else {
      return null;
    }



  }
}
