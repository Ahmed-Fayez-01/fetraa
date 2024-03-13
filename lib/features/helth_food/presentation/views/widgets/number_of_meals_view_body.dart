import 'package:easy_localization/easy_localization.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/helth_food/presentation/views/design_health_food_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_dropdown_formfield.dart';

class NumberOfMealsViewBody extends StatefulWidget {
  const NumberOfMealsViewBody({super.key});

  @override
  State<NumberOfMealsViewBody> createState() => _NumberOfMealsViewBodyState();
}

class _NumberOfMealsViewBodyState extends State<NumberOfMealsViewBody> {
  var numberOfMealsValue;
  List<String> numberOfMeals = ["2", "3"];
  var formKeyMeals = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Form(
          key: formKeyMeals,
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppConstants.height20(context),),
                  Text(
                    "Choose Meals Number : ",
                    style: TextStyle(
                      color: const Color(0xff303030),
                      fontSize: MediaQuery.of(context).size.height*.019,
                    ),
                  ),
                  SizedBox(height: AppConstants.height20(context),),
                  CustomDropDownButton(
                    onChanged: (value) {
                      numberOfMealsValue = value;
                    },
                    items: numberOfMeals,
                    validator: (String? value) {
                      if (value == null) {
                        return "ValidationEmptyText".tr();
                      }
                      return null;
                    },
                    borderSideEnabledColor: const Color(0xB2F1F1F1),
                    iconDropColor: const Color(0xff0E5C6D),
                    fillColor: const Color(0xB2F1F1F1),
                    height: MediaQuery.of(context).size.height * .072,
                    hintText: 'Number of Meals',
                  ),
                  const Spacer(),
                  DefaultButton(
                    height: MediaQuery.of(context).size.height * .018,
                    onPress: () {
                      if (formKeyMeals.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DesignHealthFoodView(numberOfMeals: numberOfMealsValue,)));
                      }
                    },
                    text: 'Next'.tr(),
                    borderRadius: MediaQuery.of(context).size.height * .01,
                  ),
                  SizedBox(height: AppConstants.height20(context),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
