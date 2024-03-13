import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/features/blogs/presentation/views/widgets/blogs_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogsView extends StatelessWidget {
  const BlogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        systemOverlayStyle:  const SystemUiOverlayStyle(
          statusBarColor: Color(0xff4CAD73), // <-- SEE HERE
          statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        title: const Text("Blogs",style: TextStyle(
          color: Colors.white
        ),),
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: SvgPicture.asset(AssetData.arrowLeft,fit: BoxFit.scaleDown,)),
        centerTitle: true,
        backgroundColor: const Color(0xff4CAD73),
      ),
      body: const BlogsViewBody(),
    );
  }
}
