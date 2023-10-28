part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileIntial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {}

class ProfileSuccess extends ProfileState {
  ProfileModel profileModel;

  ProfileSuccess({required this.profileModel});
}

class GetTrainersLoading extends ProfileState {}

class GetTrainersError extends ProfileState {}

class GetTrainersSuccess extends ProfileState {
  final TrainersModel trainersModel;

  GetTrainersSuccess({required this.trainersModel});
}

class GetCurrentCoursesLoading extends ProfileState {}

class GetCurrentCoursesError extends ProfileState {}

class GetCurrentCoursesSuccess extends ProfileState {
  CoursesModel currentCoursesModel;

  GetCurrentCoursesSuccess({required this.currentCoursesModel});
}

class FinishedCoursesLoading extends ProfileState {}

class FinishedCoursesError extends ProfileState {}

class FinishedCoursesSuccess extends ProfileState {
  CoursesModel finishedCoursesModel;

  FinishedCoursesSuccess({required this.finishedCoursesModel});
}

class EditProfileLoading extends ProfileState {}

class EditProfileError extends ProfileState {}

class EditProfileSuccess extends ProfileState {}

class EditProfileIMGSuccess extends ProfileState {
  final String url;
  EditProfileIMGSuccess({required this.url});
}
