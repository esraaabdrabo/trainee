import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/ui/toast.dart';
import '../../models/book_request_model.dart';
import '../../repositories/book_state.dart';

part 'booking_request_state.dart';

class BookingRequestCubit extends Cubit<BookingRequestState> {
  BookingRequestCubit() : super(BookingRequestInitial());

  static BookingRequestCubit of(context) => BlocProvider.of(context);

  final _bookingRequestRepo = BookingRequestRepo();

  List<BookingRequestModel> bookingRequests = [];

  Future getBookingRequests(  int status) async {
    emit(GetBookingRequestsLoading());
    final res = await _bookingRequestRepo.getBookingRequests(status);
    res.fold(
      (err) {
        print(err);
        Toast.show(err);
        emit(GetBookingRequestsError());
      },
      (res) {
        bookingRequests = res;
        emit(GetBookingRequestsLoaded());
      },
    );
  }

}
