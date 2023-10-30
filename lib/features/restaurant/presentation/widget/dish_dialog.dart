import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/plates_view.dart';
import 'package:upgrade_traine_project/features/restaurant/data/model/response/plates_model.dart';

class DishAlertDialog extends StatelessWidget {
  final List<Items> items;
  final int index;
  const DishAlertDialog({required this.index, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: AlertDialogContent(
        image: items[index].images!.isEmpty
            ? "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
            : items[index].images![0],
        deliverPrice: "${items[index].price}",
        description: items[index].components.toString(),
        mainTitle: items[index].name.toString(),
        restName: items[index].restaurant!.text!,
        totalPrice: items[index].price!,
        weight: items[index].enComponents.toString(),
        id: items[index].id!,
      ),
      backgroundColor: AppColors.grey,
    );
  }
}
