import 'package:fetraa/features/helth_food/data/models/meals_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class FoodItem extends StatefulWidget {
  const FoodItem(
      {super.key,
      required this.instance,
      required this.pageNum,
      required this.general});

  final Meal instance;
  final MealsModel general;
  final int pageNum;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.width20(context),
            vertical: AppConstants.height30(context)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.instance.name!,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .017,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff181818)),
                  ),
                  Text(
                    "Weight : ${widget.instance.weight!}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff4CAD73)),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (widget.pageNum == 1) {
                    if ((AppConstants.proteinMeal1 + widget.instance.protein) <=
                            widget.general.data!.proteinMeal1 &&
                        (AppConstants.fatMeal1 + widget.instance.fats) <=
                            widget.general.data!.fatMeal1 &&
                        (AppConstants.carbMeal1 + widget.instance.carb) <=
                            widget.general.data!.carbMeal1)
                      {
                        AppConstants.proteinMeal1 += widget.instance.protein;
                        AppConstants.fatMeal1 += widget.instance.fats;
                        AppConstants.carbMeal1 += widget.instance.carb;
                        widget.instance.quantity++;
                      }

                  } else if (widget.pageNum == 2) {
                    if ((AppConstants.proteinMeal2 + widget.instance.protein) <=
                        widget.general.data!.proteinMeal2 &&
                        (AppConstants.fatMeal2 + widget.instance.fats) <=
                            widget.general.data!.fatMeal2 &&
                        (AppConstants.carbMeal2 + widget.instance.carb) <=
                            widget.general.data!.carbMeal2)
                    {
                      AppConstants.proteinMeal2 += widget.instance.protein;
                      AppConstants.fatMeal2 += widget.instance.fats;
                      AppConstants.carbMeal2 += widget.instance.carb;
                      widget.instance.quantity++;
                    }
                  } else {
                    if ((AppConstants.proteinMeal3 + widget.instance.protein) <=
                        widget.general.data!.proteinMeal3 &&
                        (AppConstants.fatMeal3 + widget.instance.fats) <=
                            widget.general.data!.fatMeal3 &&
                        (AppConstants.carbMeal3 + widget.instance.carb) <=
                            widget.general.data!.carbMeal3)
                    {
                      AppConstants.proteinMeal3 += widget.instance.protein;
                      AppConstants.fatMeal3 += widget.instance.fats;
                      AppConstants.carbMeal3 += widget.instance.carb;
                      widget.instance.quantity++;
                    }
                  }

                });
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * .018,
                backgroundColor: const Color(0xff23AA49),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: AppConstants.width20(context),
            ),
            Text(
              "${widget.instance.quantity}",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .02,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: AppConstants.width20(context),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (widget.instance.quantity > 0) {
                    if (widget.pageNum == 1) {
                      if ((AppConstants.proteinMeal1 - widget.instance.protein) <=
                          widget.general.data!.proteinMeal1 &&
                          (AppConstants.fatMeal1 - widget.instance.fats) <=
                              widget.general.data!.fatMeal1 &&
                          (AppConstants.carbMeal1 - widget.instance.carb) <=
                              widget.general.data!.carbMeal1)
                      {
                        AppConstants.proteinMeal1 -= widget.instance.protein;
                        AppConstants.fatMeal1 -= widget.instance.fats;
                        AppConstants.carbMeal1 -= widget.instance.carb;
                        widget.instance.quantity--;
                      }

                    } else if (widget.pageNum == 2) {
                      if ((AppConstants.proteinMeal2 - widget.instance.protein) <=
                          widget.general.data!.proteinMeal2 &&
                          (AppConstants.fatMeal2 - widget.instance.fats) <=
                              widget.general.data!.fatMeal2 &&
                          (AppConstants.carbMeal2 - widget.instance.carb) <=
                              widget.general.data!.carbMeal2)
                      {
                        AppConstants.proteinMeal2 -= widget.instance.protein;
                        AppConstants.fatMeal2 -= widget.instance.fats;
                        AppConstants.carbMeal2 -= widget.instance.carb;
                        widget.instance.quantity--;
                      }
                    } else {
                      if ((AppConstants.proteinMeal3 - widget.instance.protein) <=
                          widget.general.data!.proteinMeal3 &&
                          (AppConstants.fatMeal3 - widget.instance.fats) <=
                              widget.general.data!.fatMeal3 &&
                          (AppConstants.carbMeal3 - widget.instance.carb) <=
                              widget.general.data!.carbMeal3)
                      {
                        AppConstants.proteinMeal3 -= widget.instance.protein;
                        AppConstants.fatMeal3 -= widget.instance.fats;
                        AppConstants.carbMeal3 -= widget.instance.carb;
                        widget.instance.quantity--;
                      }
                    }
                  }
                });
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * .018,
                backgroundColor: const Color(0xffF3F5F7),
                child: const Icon(
                  Icons.remove,
                  color: Color(0xff979899),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
