import 'package:fetraa/features/trainers/presentation/views/widgets/coach_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoachProfileView extends StatelessWidget {
  const CoachProfileView({super.key, required this.id});
final String id;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor:Colors.white,
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark,
              //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor:Colors.white,
              statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          )),
      body: CoachProfileViewBody(id: id,),
    );
  }
}
