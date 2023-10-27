part of 'booking_request_cubit.dart';

@immutable
abstract class BookingRequestState {}

class BookingRequestInitial extends BookingRequestState {}
class GetBookingRequestsLoading extends BookingRequestState {}
class GetBookingRequestsLoaded extends BookingRequestState {}
class GetBookingRequestsError extends BookingRequestState {}

class ApproveBookingRequestLoading extends BookingRequestState {}
class ApproveBookingRequestLoaded extends BookingRequestState {}
class ApproveBookingRequestError extends BookingRequestState {}

class RejectBookingRequestLoading extends BookingRequestState {}
class RejectBookingRequestLoaded extends BookingRequestState {}
class RejectBookingRequestError extends BookingRequestState {}

