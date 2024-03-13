import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/blogs/data/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class BlogDetailsViewBody extends StatelessWidget {
  const BlogDetailsViewBody({super.key, required this.instance});
  final Data instance;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              placeholder: (context, url) =>
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[200]!,
                    child:  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
              imageUrl:instance.img!,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.55,
            ),
            Padding(
              padding: EdgeInsets.all(AppConstants.sp20(context)),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(AppConstants.width5(context)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                    child: SvgPicture.asset(AssetData.arrowLeft,color: Colors.black,)),
              ),
            ),
          ],
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(instance.title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.02
              ),),
            ],
          ),
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text(instance.desc!,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.018
          ),),
        ),
      ],
    );
  }
}
