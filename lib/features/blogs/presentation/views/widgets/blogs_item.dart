import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/features/blogs/data/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, this.onTap, required this.instance});
final Function()? onTap;
final Data instance;
  String getInitials(bankAccountName) {
    List<String> names = bankAccountName.split(" ");
    String initials = "";
    int numWords = names.length;

    if(numWords < names.length) {
      numWords = names.length;
    }
    for(var i = 0; i < numWords; i++){
      initials += names[i][0];
    }
    return initials.toUpperCase();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(AppConstants.sp20(context)),
          decoration: BoxDecoration(
            color: const Color(0xffFAFAFB),
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: AppConstants.height20(context),
                    backgroundColor: const Color(0xffF93A00),
                    child: Text(getInitials(instance.admin!),style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height*.016,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  SizedBox(width: AppConstants.width10(context),),
                  Text(instance.admin!,style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height*.016
                  ),)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(instance.title!,style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height*.02
                    ),),
                  ),
                  SizedBox(width: AppConstants.width10(context),),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                    child: CachedNetworkImage(
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.height10(context),),
              Row(
                children: [
                  Expanded(
                    child: Text(instance.createdAt!,style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff8B8C91),
                        fontSize: MediaQuery.of(context).size.height*.016
                    ),),
                  ),
                  SvgPicture.asset(AssetData.more),

                ],
              ),
              SizedBox(height: AppConstants.height10(context),),
              Text(instance.desc!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: const Color(0xff2F315A),
                    fontSize: MediaQuery.of(context).size.height*.016,
                    fontWeight: FontWeight.w500
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
