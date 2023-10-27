import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/app_colors.dart';

class DishesView extends StatelessWidget {
  final String restaurantName;
  final String plateName;
  final String? imagePlate;
  final String price;
  final void Function()? onTap;

  const DishesView({
    Key? key,
    required this.price,
    required this.imagePlate,
    required this.restaurantName,
    required this.plateName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plateName,style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Text(
                            restaurantName,
                            style: const TextStyle(color: Colors.yellow, fontSize: 11),
                          ),
                        ),
                        Text(
                          "$price ر.س ",
                          style: const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagePlate ??
                      "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",),
                  fit: BoxFit.cover
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
