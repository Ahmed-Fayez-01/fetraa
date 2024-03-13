import 'package:fetraa/features/store/data/models/store_model.dart';
import 'package:fetraa/features/store/presentation/view_models/change_tabs_image_cubit/change_tabs_image_cubit.dart';
import 'package:fetraa/features/store/presentation/view_models/change_tabs_image_cubit/change_tabs_image_states.dart';
import 'package:fetraa/features/store/presentation/view_models/get_all_categories_store/get_all_categories_store_cubit.dart';
import 'package:fetraa/features/store/presentation/views/widgets/store_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared_widgets/custom_tabs_categories_with_image.dart';
import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../view_models/get_store_by_id/get_store_by_id_cubit.dart';

class StoreViewBody extends StatefulWidget {
  const StoreViewBody({super.key});

  @override
  State<StoreViewBody> createState() => _StoreViewBodyState();
}

class _StoreViewBodyState extends State<StoreViewBody> {
  var searchController = TextEditingController();
  @override
  void initState(){
    AppConstants.foundedProducts = AppConstants.storeModel;
    super.initState();
  }
  void runFilter(String enteredKeyword) {
    List<Data> result = [];
    if (enteredKeyword.isEmpty) {
      result = AppConstants.storeModel;
    } else {
      result = AppConstants.storeModel
          .where((product) => product.name!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      AppConstants.foundedProducts = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Expanded(
                child: DefaultTextFormField(
                  textInputType: TextInputType.name,
                  controller: searchController,
                  onChange: (value) {
                    runFilter(value);
                  },
                  hasBorder: false,
                  contentPaddingVertical:
                  MediaQuery.of(context).size.height * .015,
                  borderSideColor: AppColors.primaryColor,
                  borderSideEnabledColor: AppColors.primaryColor,
                  prefixIcon: SvgPicture.asset(
                    AssetData.search,
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: "Search",
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
        BlocConsumer<GetAllCategoriesStoreCubit,GetAllCategoriesStoreState>(
          builder: (context,state) {
            if(state is UserGetAllCategoriesStoreSuccessState)
            {
              return  CustomTabsCategoriesWithImage(categories: state.model,);
            }else{
              return SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.sp20(context)),
                  child: ListView.separated(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .045,
                        width: MediaQuery.of(context).size.width * .25,
                        decoration: BoxDecoration(
                          color: const Color(0xffA5a5a5),
                          borderRadius: BorderRadius.circular(
                              AppConstants.sp10(context)),
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: AppConstants.width10(context),
                      );
                    },
                  ),
                ),
              );
            }
          },
          listener: (BuildContext context, state) {
            if (state is UserGetAllCategoriesStoreSuccessState) {
              context.read<GetStoreByIdCubit>().getStoreById(id: state.model.data![0].id.toString());
            }
          },

        ),
        SizedBox(height: AppConstants.height20(context),),
        BlocBuilder<ChangeTabsImageCubit,ChangeTabsImageStates>(
            builder: (context,state) {
              return BlocConsumer<GetStoreByIdCubit,GetStoreByIdState>(
                  builder: (context,state) {
                    if(state is UserGetStoreByIdSuccessState)
                    {
                      return Expanded(
                        child: GridView.builder(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                AppConstants.height10(context),
                                horizontal:
                                AppConstants.width20(context)),
                            itemCount: AppConstants.foundedProducts.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing:
                                AppConstants.width20(
                                    context),
                                mainAxisSpacing:
                                AppConstants.height20(
                                    context),
                                childAspectRatio: 0.65),
                            itemBuilder: (context, index) {
                              return  StoreItem(instance: AppConstants.foundedProducts[index],);
                            }),
                      );
                    }else{
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.sp20(context)),
                          child: GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing:
                                AppConstants.width10(context),
                                mainAxisSpacing:
                                AppConstants.height10(context),
                                childAspectRatio: 0.65),
                            itemCount: 6,
                            itemBuilder: (context, index) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[200]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        .16,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffA5a5a5),
                                      borderRadius: BorderRadius.circular(
                                          AppConstants.sp10(context)),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      );
                    }
                  }, listener: (BuildContext context, GetStoreByIdState state) {
                    if(state is UserGetStoreByIdSuccessState)
                      {
                        runFilter(searchController.text);
                      }
              },
              );
            }
        )
      ],
    );
  }
}
