import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/features/orders/controller/order_cubit.dart';


import '../../../core/ui/toast.dart';
import '../controller/payment_cubit.dart';
import 'package:unicode_moyasar/unicode_moyasar.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key, required this.amount, required this.onSuccess,})
      : super(key: key);

  final num amount;
  final Function? onSuccess;



  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: MoyasarPayment(
              moyasarPaymentData: MoyasarPaymentData(
                appName: "UNICODE",

                secretKey: "sk_test_v9YxowEXSjAoNvLTczCZGxLfcYJNhaAwzAHr4nJi",
                publishableSecretKey:
                    "pk_test_vmALpRCM5khhCm2uc1X4aCi4prXkN6dcTJNBPLwX",
                purchaseAmount: widget.amount,
                locale: PaymentLocale.en,
                paymentEnvironment: PaymentEnvironment.test,
                paymentOptions: [
                  PaymentOption.card,
                  PaymentOption.applepay,
                  PaymentOption.stcpay,
                ],
              ),
              onPaymentSucess: (response) {
                PaymentCubit.of(context)
                    .createPayment(context, widget.amount);
                widget.onSuccess;
                debugPrint("Success ------> ${response.toMap()}");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              onPaymentFailed: (response) {
                Toast.show('Errror');
                print("err:${response.description}");
                Navigator.of(context).pop();
              },
            ),
          );
        },
      ),
    );
  }
}
