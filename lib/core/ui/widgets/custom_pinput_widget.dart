import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';

class CustomPinPut extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  Function(String)? onChanged;

   CustomPinPut({Key? key, required this.controller, this.focusNode,this.onChanged})
      : super(key: key);

  BoxDecoration _getUnselectedBoxDecoration() {
    return BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius8));
  }

  BoxDecoration _getSelectedBoxDecoration() {
    return BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius12));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        controller: controller,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        focusNode: focusNode,
        cursorColor: Colors.white,

        enableActiveFill: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          selectedFillColor: Colors.transparent,
          selectedColor: Colors.white,
          borderWidth: 1,
          fieldWidth: 50,
          inactiveFillColor: Colors.black,
          inactiveColor: Colors.white,
          disabledColor: Colors.transparent,
          activeFillColor: Colors.black,
          activeColor: Colors.brown,
        ),
        animationDuration:
        const Duration(milliseconds: 300),
        textStyle:
        const TextStyle(fontSize: 20, height: 1.6),
        backgroundColor: Colors.transparent,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        validator: (text) {
          // if (!Validators.isNotEmptyString(text ?? ''))
          //  // return Translation.of(context).enter_pin_code;
          // if (!Validators.isValidPinCode(text ?? ''))
          //  // return Translation.of(context).enter_pin_code;
        },
        // selectedFieldDecoration: _getUnselectedBoxDecoration(),
        // submittedFieldDecoration: _getSelectedBoxDecoration(),
        // followingFieldDecoration: _getUnselectedBoxDecoration(),
        appContext: context,
        length: 6,
        onChanged: (String value) {
          onChanged!(value);
        },
      ),
    );
  }
}
