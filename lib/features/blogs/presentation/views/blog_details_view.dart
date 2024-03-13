import 'package:fetraa/features/blogs/data/models/blog_model.dart';
import 'package:fetraa/features/blogs/presentation/views/widgets/blog_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlogDetailsView extends StatelessWidget {
  const BlogDetailsView({super.key, required this.instance});
  final Data instance;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: PreferredSize(
          
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle:  const SystemUiOverlayStyle(
            statusBarColor: Color(0xff4CAD73), // <-- SEE HERE
            statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
            systemNavigationBarColor: Colors.white,
            statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
          ),
        ),
      ),
      body:  BlogDetailsViewBody(instance: instance,),
    );
  }
}
