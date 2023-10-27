import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';


class EditProfileScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  late XFile? _image = XFile('');
  ProfileCubit profileCubit=ProfileCubit();

  XFile? get image => _image;

  set image(XFile? value) {
    _image = value;
  }

  /// Getters and Setters


  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }


}
