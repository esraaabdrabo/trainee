import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/common/validators.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/library/intl_phone_filed/phone_number_field.dart'
    as custom_phone_number;
import '../../../generated/l10n.dart';

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? passwordSecure;

  final Function(bool)? hidePassword;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function? onFieldSubmitted;
  final TextInputType? textInputType;
  final InputBorder? inputBorder;
  final String? labelText;
  final int? maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String)? onChanged;

  const _CustomTextField(
      {Key? key,
      required this.controller,
      this.passwordSecure = false,
      this.hidePassword,
      this.isPassword = false,
      this.validator,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.textInputType,
      this.inputBorder,
      this.labelText,
      this.maxLines,
      this.suffix,
      this.prefix,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: textInputType,
      onFieldSubmitted: (text) {
        if (onFieldSubmitted != null) onFieldSubmitted!();
      },
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        hintText: labelText,
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        errorBorder: inputBorder,
        disabledBorder: inputBorder,
      ),
      maxLines: passwordSecure! ? 1 : maxLines,
      obscureText: passwordSecure!,
      onChanged: onChanged,
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {
  final InputBorder? border;
  final bool hint;
  final TextEditingController textEditingController;
  final Function(String) onInputChanged;
  final Function(String) onDialChanged;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function? onFieldSubmitted;
  final String isoCode;
  final String dialCode;

  const PhoneNumberTextField(
      {Key? key,
      this.border,
      this.hint = true,
      required this.textEditingController,
      required this.onInputChanged,
      this.focusNode,
      required this.onDialChanged,
      this.textInputAction,
      this.onFieldSubmitted,
      this.dialCode = AppConstants.DEFAULT_COUNTRY_DIAL,
      this.isoCode = AppConstants.DEFAULT_COUNTRY_CODE})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom_phone_number.PhoneNumberField(
      textFieldController: textEditingController,
      focusNode: focusNode,
      formatInput: false,
      onFieldSubmitted: (term) {
        if (onFieldSubmitted != null) onFieldSubmitted!();
      },
      keyboardAction: textInputAction ?? TextInputAction.next,
      initialValue: PhoneNumber(isoCode: isoCode, dialCode: dialCode),
      onInputChanged: (text) {
        onInputChanged(text.isoCode ?? isoCode);
        debugPrint("bug:${text.dialCode}");
        debugPrint("bug2:$dialCode");
        onDialChanged(text.dialCode ?? dialCode);
        debugPrint("bug:${text.dialCode}");
        debugPrint("bug2:$dialCode");
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      selectorTextStyle: const TextStyle(color: AppColors.white_text),
      validator: (text) {
        if (!Validators.isNotEmptyString(text ?? '')) {
          return Translation.of(context).enter_phone_number;
        }
        if (!Validators.isValidPhoneNumber(text ?? '')) {
          return Translation.of(context).enter_valid_phone;
        }
      },
      inputDecoration: InputDecoration(
        labelText: hint ? Translation.of(context).phone : '',
        border: border,
        disabledBorder: border,
        enabledBorder: border,
        errorBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
      ),
    );
  }
}

class NormalTextField extends StatelessWidget {
  final InputBorder? inputBorder;
  final bool hint;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function? onFieldSubmitted;
  final int? maxLines;

  const NormalTextField({
    Key? key,
    this.inputBorder,
    this.hint = true,
    required this.controller,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CustomTextField(
      validator: (value) {
        if (value == null || value == '') {
          return Translation.of(context).insert_value;
        }
      },
      textInputType: TextInputType.text,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      focusNode: focusNode,
      inputBorder: inputBorder,
      maxLines: maxLines,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final bool passwordSecure;
  final bool? isConfirmPassword;
  final Function(bool) hidePassword;
  final TextEditingController controller;
  final TextEditingController? otherPasswordController;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function? onFiledSubmitted;
  final String? text;

  const PasswordTextField(
      {Key? key,
      required this.passwordSecure,
      required this.hidePassword,
      this.isConfirmPassword = false,
      required this.controller,
      this.otherPasswordController,
      this.textInputAction,
      this.focusNode,
      this.onFiledSubmitted,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? hidePasswordWidget;
    !passwordSecure
        ? hidePasswordWidget = GestureDetector(
            onTap: () {
              hidePassword(true);
            },
            child: const Icon(
              Icons.visibility_off_outlined,
              color: AppColors.white,
            ))
        : hidePasswordWidget = GestureDetector(
            onTap: () {
              hidePassword(false);
            },
            child: const Icon(
              Icons.visibility_outlined,
              color: AppColors.white,
            ));
    return _CustomTextField(
      validator: isConfirmPassword!
          ? (text) {
              if (!Validators.isNotEmptyString(text ?? '')) {
                return Translation.of(context).enter_confirm_password;
              }
              if (!Validators.isValidConfirmPassword(
                  text ?? '',
                  otherPasswordController == null
                      ? ''
                      : otherPasswordController!.text)) {
                return Translation.of(context).passwords_not_match;
              }
            }
          : (text) {
              if (!Validators.isNotEmptyString(text ?? '')) {
                return Translation.of(context).enter_password;
              }
              if (!Validators.isValidPassword(
                text ?? '',
              )) {
                return Translation.of(context).enter_valid_password;
              }
            },
      textInputType: TextInputType.visiblePassword,
      controller: controller,
      labelText: text ??
          (!isConfirmPassword!
              ? Translation.of(context).password
              : Translation.of(context).confirmPassword),
      hidePassword: hidePassword,
      isPassword: true,
      onFieldSubmitted: onFiledSubmitted,
      passwordSecure: passwordSecure,
      textInputAction: textInputAction,
      focusNode: focusNode,
      suffix: hidePasswordWidget,
    );
  }
}

/*class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function? onFiledSubmitted;
  const EmailTextField(
      {Key? key,
      required this.controller,
      this.textInputAction,
      this.focusNode,
      this.onFiledSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CustomTextField(
      validator:(text) {
        if (!Validators.isNotEmptyString(text ?? ''))
          return Translation.of(context).enter_password;
        if (Validators.isValidEmail(
          text ?? '',
        )) return Translation.of(context).enter_valid_password;
      },
      textInputType: TextInputType.emailAddress,
      controller: controller,
      isPassword: true,
      textInputAction: textInputAction,
      focusNode: focusNode,
    );
  }
}*/

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Function(String)? onChanged;

  const SearchTextField(
      {Key? key,
      this.suffix,
      required this.hintText,
      required this.controller,
      this.onFieldSubmitted,
      this.onChanged,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CustomTextField(
      controller: controller,
      labelText: hintText,
      inputBorder: InputBorder.none,
      prefix: const Icon(
        Icons.search,
        color: AppColors.white,
      ),
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      onChanged: onChanged,
      suffix: suffix,
    );
  }
}
