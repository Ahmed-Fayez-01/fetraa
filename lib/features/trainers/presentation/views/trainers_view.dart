import 'package:fetraa/features/trainers/presentation/views/widgets/trainers_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrainersView extends StatelessWidget {
  const TrainersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: const TrainersViewBody(),
    );
  }
}
