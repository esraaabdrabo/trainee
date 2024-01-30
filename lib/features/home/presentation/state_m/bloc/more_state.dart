abstract class MoreState {}

class MoreInitial extends MoreState {}

class CreateReportLoading extends MoreState {}

class CreateReportLoaded extends MoreState {}

class CreateReportError extends MoreState {}

class ChangePassLoading extends MoreState {}

class ChangePassLoaded extends MoreState {}

class ChangePassError extends MoreState {}

class MoreChangeEnableNotificationsState extends MoreState {}
class MoreLoading extends MoreState{}
class MoreAccountDeletedSucc extends MoreState{}
class MoreAccountDeletionFailed extends MoreState{}

//privacy policy
class PrivacyPolicyLoading extends MoreState {}

class PrivacyPolicyLoaded extends MoreState {
  final String data;
  PrivacyPolicyLoaded(this.data);
}

class PrivacyPolicyError extends MoreState {}

//about app
class AboutAppLoading extends MoreState {}

class AboutAppLoaded extends MoreState {
  final String data;
  AboutAppLoaded(this.data);
}

class AboutAppError extends MoreState {}
