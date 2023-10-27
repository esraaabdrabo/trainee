import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/ui/widgets/blur_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/error_ui/error_viewer/loader.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../controller/booking_cubit/booking_request_cubit.dart';
import '../../models/book_request_model.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({Key? key}) : super(key: key);

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  int tabbed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).my_orders,
      ),
      body: BlocProvider(
          create: (context) => BookingRequestCubit()..getBookingRequests(0),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              tabbed = 1;
                              BookingRequestCubit.of(context)
                                  .getBookingRequests(0);
                              tabController!.animateTo(0);
                            });
                          },
                          child: Container(
                              decoration: tabbed == 1
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColors.grey.withOpacity(0.5)),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(colors: [
                                        AppColors.transparent.withOpacity(0.3),
                                        AppColors.transparent.withOpacity(0),
                                      ]))
                                  : null,
                              child: Center(
                                child: CustomText(
                                  text: "قيد الأنتظار",
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppConstants.textSize16,
                                ),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              tabbed = 2;
                              BookingRequestCubit.of(context)
                                  .getBookingRequests(1);
                              tabController!.animateTo(1);
                            });
                          },
                          child: Container(
                              decoration: tabbed == 2
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColors.grey.withOpacity(0.5)),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(colors: [
                                        AppColors.transparent.withOpacity(0.3),
                                        AppColors.transparent.withOpacity(0),
                                      ]))
                                  : null,
                              child: Center(
                                child: CustomText(
                                  text: "الموافق عليها",
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppConstants.textSize16,
                                ),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              tabbed = 3;
                              BookingRequestCubit.of(context)
                                  .getBookingRequests(2);
                              tabController!.animateTo(2);
                            });
                          },
                          child: Container(
                              decoration: tabbed == 3
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColors.grey.withOpacity(0.5)),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(colors: [
                                        AppColors.transparent.withOpacity(0.3),
                                        AppColors.transparent.withOpacity(0),
                                      ]))
                                  : null,
                              child: Center(
                                child: CustomText(
                                  text: "الملغاه",
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppConstants.textSize16,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const <Widget>[
                    WaitingList(),
                    AcceptedList(),
                    RefusedList(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class WaitingList extends StatelessWidget {
  const WaitingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingRequestCubit()..getBookingRequests(0),
      child: BlocBuilder<BookingRequestCubit, BookingRequestState>(
          builder: (context, state) {
        if (state is GetBookingRequestsLoading) {
          return const Loader();
        } else {
          return BookingRequestCubit.of(context).bookingRequests.length == 0
              ? Center(
                  child: Text("لا يوجد طلبات"),
                )
              : ListView.builder(
                  itemCount:
                      BookingRequestCubit.of(context).bookingRequests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: false,
                          bookingRequestModel: BookingRequestCubit.of(context)
                              .bookingRequests[index]),
                    );
                  });
        }
      }),
    );
  }
}

class AcceptedList extends StatelessWidget {
  const AcceptedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingRequestCubit()..getBookingRequests(1),
      child: BlocBuilder<BookingRequestCubit, BookingRequestState>(
          builder: (context, state) {
        if (state is GetBookingRequestsLoading) {
          return const Loader();
        } else {
          return BookingRequestCubit.of(context).bookingRequests.length == 0
              ? Center(
                  child: Text("لا يوجد طلبات"),
                )
              : ListView.builder(
                  itemCount:
                      BookingRequestCubit.of(context).bookingRequests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: true,
                          bookingRequestModel: BookingRequestCubit.of(context)
                              .bookingRequests[index]),
                    );
                  });
        }
      }),
    );
  }
}

class RefusedList extends StatelessWidget {
  const RefusedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingRequestCubit()..getBookingRequests(2),
      child: BlocBuilder<BookingRequestCubit, BookingRequestState>(
          builder: (context, state) {
        if (state is GetBookingRequestsLoading) {
          return const Loader();
        } else {
          return BookingRequestCubit.of(context).bookingRequests.length == 0
              ? Center(
                  child: Text("لا يوجد طلبات"),
                )
              : ListView.builder(
                  itemCount:
                      BookingRequestCubit.of(context).bookingRequests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: true,
                          bookingRequestModel: BookingRequestCubit.of(context)
                              .bookingRequests[index]),
                    );
                  });
        }
      }),
    );
  }
}

class ImageWithNameTrainee extends StatelessWidget {
  final BookingRequestModel bookingRequestModel;

  const ImageWithNameTrainee({Key? key, required this.bookingRequestModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
        image: DecorationImage(
          image: NetworkImage(bookingRequestModel.trainee!.imageUrl ?? ""),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 35.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              BlurWidget(
                height: 100.h,
                child: Center(
                  child: CustomText(
                    text: bookingRequestModel.trainee!.name ?? "",
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    fontSize: AppConstants.textSize16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  final bool selectedCard;
  final BookingRequestModel bookingRequestModel;

  const CardDetails(
      {super.key,
      required this.selectedCard,
      required this.bookingRequestModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(colors: [
            AppColors.transparent.withOpacity(1),
            AppColors.transparent.withOpacity(0),
          ]),
          border: Border.all(color: AppColors.transparent.withOpacity(0.1))),
      height: 151.h,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text: bookingRequestModel.course!.text ?? "",
                  fontSize: AppConstants.textSize14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                CustomText(
                  text: "${"#${bookingRequestModel.number!}"}",
                  fontSize: AppConstants.textSize14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
                CustomText(
                  text:
                      "${bookingRequestModel.course!.fee ?? 0} ${Translation.of(context).saudi_riyal}",
                  color: AppColors.accentColorLight,
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstants.textSize14,
                ),
                CustomText(
                  text: "${bookingRequestModel.creationTime!.substring(0, 10)}",
                  color: AppColors.accentColorLight,
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstants.textSize14,
                ),
                // selectedCard
                //     ? const SizedBox()
                //     : Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         // BookingRequestCubit.of(context)
                //         //     .approveBookingRequest(
                //         //     context, bookingRequestModel.id!);
                //       },
                //       child: const CircleAvatar(
                //         backgroundColor: AppColors.green,
                //         child: Icon(
                //           FontAwesomeIcons.check,
                //           color: AppColors.white,
                //         ),
                //       ),
                //     ),
                //     Gaps.hGap12,
                //     InkWell(
                //       onTap: () {
                //         // BookingRequestCubit.of(context)
                //         //     .rejectBookingRequest(
                //         //     context, bookingRequestModel.id!);
                //       },
                //       child: const CircleAvatar(
                //         backgroundColor: AppColors.red,
                //         child: Icon(
                //           FontAwesomeIcons.xmark,
                //           color: AppColors.white,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          )),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: bookingRequestModel.course!.imageUrl == null
                    ? DecorationImage(
                        image: AssetImage(AppConstants.COACH4_IMAGE))
                    : DecorationImage(
                        image: NetworkImage(
                            bookingRequestModel.course!.imageUrl!)),
                borderRadius: BorderRadius.circular(10)),
          ))
        ],
      ),
    );
  }
}
