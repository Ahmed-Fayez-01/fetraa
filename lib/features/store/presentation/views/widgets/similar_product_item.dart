import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/features/store/data/models/product_details_model.dart';
import 'package:fetraa/features/store/presentation/view_models/get_product_details/get_product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({super.key, required this.instance});
  final Product instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:AppConstants.height10(context) ),
      child: InkWell(
        onTap: (){
          context.read<GetProductDetailsCubit>().getProductDetails(id: instance.id.toString());
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.circular(AppConstants.sp20(context)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 5,
                  spreadRadius: 2,
                )
              ]),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.horizontal(
                    start: Radius.circular(AppConstants.sp10(context))),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[200]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                  imageUrl:instance.img!,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width10(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      instance.name!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize:
                          MediaQuery.of(context).size.height * .016,
                          color: const Color(0xff333333)),
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price per kilo : ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:
                              MediaQuery.of(context).size.height *
                                  .015,
                              color: const Color(0xff828282)),
                        ),
                        Text(
                          instance.price!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:
                              MediaQuery.of(context).size.height *
                                  .015,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
