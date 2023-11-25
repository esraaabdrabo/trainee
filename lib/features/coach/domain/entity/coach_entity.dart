import '../../../../core/entities/base_entity.dart';
import '../../../../core/entities/specialization_entity.dart';
import '../../../../core/entities/subscription_entity.dart';

class CoachEntity extends BaseEntity {
  CoachEntity(
      {this.birthDate,
      this.yearsOfExperience,
      this.specializationId,
      this.specialization,
      this.age,
      this.name,
      this.cvUrl,
      this.gender,
      this.imageUrl,
      this.address,
      this.emailAddress,
      this.latitude,
      this.longitude,
      this.phoneNumber,
      this.countryCode,
      this.lastLoginDate,
      this.coursesCount,
      this.rate,
      this.status,
      this.isVerified,
      this.isActive,
      this.subscription,
      this.id,
      this.ratingDetails,
      this.hoursPrice});

  final DateTime? birthDate;
  final int? yearsOfExperience;
  final int? specializationId;
  final SpecializationEntity? specialization;
  final int? age;
  final String? name;
  final String? cvUrl; //
  final int? gender;
  final String? imageUrl;
  final String? address;
  final String? emailAddress;
  final double? latitude; //
  final double? longitude; //
  final String? phoneNumber;
  final String? countryCode;
  final DateTime? lastLoginDate;
  final int? coursesCount;
  final double? rate;
  final int? status;
  final bool? isVerified;
  final bool? isActive;
  final SubscriptionEntity? subscription;
  final int? id;
  final double? hoursPrice;
  final RatingDetails? ratingDetails;

  @override
  List<Object?> get props => [];
}

class RatingDetails extends BaseEntity {
  final int? i1;
  final int? i2;
  final int? i3;
  final int? i4;
  final int? i5;

  RatingDetails({this.i1, this.i2, this.i3, this.i4, this.i5});

  @override
  // TODO: implement props
  List<Object?> get props =>[
    i1,
    i2,
    i3,
    i4,
    i5,
  ];
}
