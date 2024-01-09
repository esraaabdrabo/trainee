import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/datasources/shared_preference.dart';
import 'package:upgrade_traine_project/features/home/domain/repository/more_repo.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/more_state.dart';
import '../../../../../core/ui/toast.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreInitial());

  static MoreCubit of(context) => BlocProvider.of(context);

  final moreRepo = MoreRepo();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode subjectFocusNode = FocusNode();
  FocusNode descFocusNode = FocusNode();

  final subjectController = TextEditingController();
  final descController = TextEditingController();

  Future addFeedback(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      unFocus(context);
      emit(CreateReportLoading());
      final res = await moreRepo.addFeedback(
          subjectController.text, descController.text);
      res.fold(
        (err) {
          Toast.show(err);
          emit(CreateReportError());
        },
        (res) async {
          Navigator.pop(context);
          emit(CreateReportLoaded());
        },
      );
    }
  }

  unFocus(context) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  bool isEnableNotification = true;
  void enableNotifications() async {
    isEnableNotification = !isEnableNotification;
    await (await SpUtil.instance)
        .putBool("is_notifications_enabled", isEnableNotification);
    emit(MoreChangeEnableNotificationsState());
  }

  void deleteAccount(int id) async {
    emit(MoreLoading());
    await moreRepo.deleteAccount(id).then((value) => value.fold(
        (l) => emit(MoreAccountDeletionFailed()),
        (r) => emit(MoreAccountDeletedSucc())));
  }
}
