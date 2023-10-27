import '../../../../core/entities/base_entity.dart';

class ProfileEntity extends BaseEntity {
  ProfileEntity(
      {this.birthDate,
      this.age,
      this.name,
      this.gender,
      this.imageUrl,
      this.phoneNumber,
      this.countryCode,
      this.length,
      this.weight,
      this.bmi,
      this.lastLoginDate,
      this.appliedCoursesCount,
      this.status,
      this.isVerified,
      this.isActive,
      this.appliedCourses,
      this.neighbourhood,
      this.details,
      this.latitude,
      this.longitude,
      this.id});

  final String? birthDate;
  final int? age;
  final String? name;
  final String? gender;
  final String? imageUrl;
  final String? phoneNumber;
  final String? countryCode;
  final int? length;
  final int? weight;
  final int? bmi;
  final String? lastLoginDate;
  final String? appliedCoursesCount;
  final String? status;
  final bool? isVerified;
  final bool? isActive;
  final List<Null>? appliedCourses;
  final String? neighbourhood;
  final String? details;
  final String? latitude;
  final String? longitude;
  final int? id;

  @override
  List<Object?> get props => [
        this.birthDate,
        this.age,
        this.name,
        this.gender,
        this.imageUrl,
        this.phoneNumber,
        this.countryCode,
        this.length,
        this.weight,
        this.bmi,
        this.lastLoginDate,
        this.appliedCoursesCount,
        this.status,
        this.isVerified,
        this.isActive,
        this.appliedCourses,
        this.neighbourhood,
        this.details,
        this.latitude,
        this.longitude,
        this.id
      ];
}
