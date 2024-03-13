import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:fetraa/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:fetraa/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:fetraa/features/blogs/data/repos/blog_repo_impl.dart';
import 'package:fetraa/features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_cubit.dart';
import 'package:fetraa/features/blogs/presentation/view_models/get_all_categories_blog/get_all_categories_blog_cubit.dart';
import 'package:fetraa/features/blogs/presentation/view_models/get_blogs_by_id/get_blogs_by_id_cubit.dart';
import 'package:fetraa/features/fat_calculator/presentation/view_models/calculate_female_fats/calculate_female_fats_cubit.dart';
import 'package:fetraa/features/helth_food/presentation/view_models/change_meal/change_meal_cubit.dart';
import 'package:fetraa/features/helth_food/presentation/view_models/get_food/get_food_cubit.dart';
import 'package:fetraa/features/home/data/repos/home_repo_impl.dart';
import 'package:fetraa/features/home/presentation/view_models/slider_cubit/get_slider_cubit.dart';
import 'package:fetraa/features/meals/presentation/view_models/get_all_meals/get_all_meals_cubit.dart';
import 'package:fetraa/features/meals/presentation/view_models/get_meal_by_id/get_meal_by_id_cubit.dart';
import 'package:fetraa/features/profile/data/repos/profile_repo_impl.dart';
import 'package:fetraa/features/profile/presentation/view_models/change_subscription_cubit/change_subscription_cubit.dart';
import 'package:fetraa/features/profile/presentation/view_models/get_walking_info/get_walking_info_cubit.dart';
import 'package:fetraa/features/profile/presentation/view_models/test_sleeping/test_sleeping_cubit.dart';
import 'package:fetraa/features/profile/presentation/view_models/test_walking/test_walking_cubit.dart';
import 'package:fetraa/features/profile/presentation/view_models/update_image/update_image_cubit.dart';
import 'package:fetraa/features/profile/presentation/view_models/upload_image_profile/upload_image_profile_cubit.dart';
import 'package:fetraa/features/store/data/repos/store_repo_impl.dart';
import 'package:fetraa/features/store/presentation/view_models/get_product_details/get_product_details_cubit.dart';
import 'package:fetraa/features/store/presentation/view_models/get_store_by_id/get_store_by_id_cubit.dart';
import 'package:fetraa/features/trainers/data/repos/trainer_repo_impl.dart';
import 'package:fetraa/features/trainers/presentation/view_models/change_trainer_tabs_cubit/change_trainer_tabs_cubit.dart';
import 'package:fetraa/features/trainers/presentation/view_models/get_all_trainers_blog/get_all_trainers_blog_cubit.dart';
import 'package:fetraa/features/trainers/presentation/view_models/get_trainer_details/get_product_details_cubit.dart';
import 'package:fetraa/features/trainers/presentation/view_models/subscribe_trainer/subscribe_trainer_cubit.dart';
import 'package:fetraa/features/videos/data/repos/video_repo_impl.dart';
import 'package:fetraa/features/videos/presentation/view_models/change_video_tabs_cubit/change_video_tabs_cubit.dart';
import 'package:fetraa/features/videos/presentation/view_models/get_all_categories_video/get_all_categories_video_cubit.dart';
import 'package:fetraa/features/videos/presentation/view_models/get_video_details/get_video_details_cubit.dart';
import 'package:fetraa/features/videos/presentation/view_models/get_videos_by_id/get_videos_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/roots/app_router.dart';
import 'core/utils/services/local_services/cache_helper.dart';
import 'core/utils/services/local_services/cache_keys.dart';
import 'core/utils/services/remote_services/service_locator.dart';
import 'core/utils/theme/app_theme.dart';

import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/fat_calculator/data/repos/fat_repo_impl.dart';
import 'features/fat_calculator/presentation/view_models/calculate_male_fats/calculate_male_fats_cubit.dart';
import 'features/helth_food/data/repos/health_food_repo_impl.dart';
import 'features/main_layout/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'features/meals/data/data/repos/meals_repo/meals_repo_impl.dart';
import 'features/store/presentation/view_models/change_tabs_image_cubit/change_tabs_image_cubit.dart';
import 'features/store/presentation/view_models/get_all_categories_store/get_all_categories_store_cubit.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterError.onError = (details) {
  //   if (details.exception is! NetworkImageLoadException) throw details.exception;
  // };
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  setup();
  print("token : ${CacheKeysManger.tokenStatus()}");
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale("ar"), Locale("en")],
        saveLocale: true,
        path: "lib/core/language", // <-- change the path of the translation files
        child: const Fetra()),
  );
}

class Fetra extends StatelessWidget {
  const Fetra({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeNavBarStatusCubit()),
        BlocProvider(create: (context) => ChangeTabsCubit()),
        BlocProvider(create: (context) => ChangeTabsImageCubit()),
        BlocProvider(create: (context) => ChangeSubscriptionCubit()),
        BlocProvider(create: (context) => ChangeTrainerTabsCubit()),
        BlocProvider(create: (context) => ChangeVideosTabsCubit()),
        BlocProvider(create: (context) => ChangeMealStatusCubit()),
        BlocProvider(create: (context) => UploadImageProfileCubit()),
        BlocProvider(
            create: (context) => LoginCubit(
              getIt.get<AuthRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetAllCategoriesBlogCubit(
              getIt.get<BlogRepoImpl>(),
            )..getAllCategoriesBlogs()),
        BlocProvider(
            create: (context) => GetBlogsByIdCubit(
              getIt.get<BlogRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => TestSleepingCubit(
              getIt.get<ProfileRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => UpdateImageCubit(
              getIt.get<ProfileRepoImpl>(),
            )), BlocProvider(
            create: (context) => TestWalkingCubit(
              getIt.get<ProfileRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetWalkingInfoCubit(
              getIt.get<ProfileRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetAllCategoriesStoreCubit(
              getIt.get<StoreRepoImpl>(),
            )..getAllCategoriesStores()),
        BlocProvider(
            create: (context) => GetStoreByIdCubit(
              getIt.get<StoreRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetProductDetailsCubit(
              getIt.get<StoreRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetAllCategoriesVideoCubit(
              getIt.get<VideoRepoImpl>(),
            )..getAllCategoriesVideos()),
        BlocProvider(
            create: (context) => GetVideosByIdCubit(
              getIt.get<VideoRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetSliderCubit(
              getIt.get<HomeRepoImpl>(),
            )..getSlider()),
        BlocProvider(
            create: (context) => GetVideoDetailsCubit(
              getIt.get<VideoRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => CalculateFemaleFatsCubit(
              getIt.get<FatRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => CalculateMaleFatsCubit(
              getIt.get<FatRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetAllTrainersCubit(
              getIt.get<TrainerRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetFoodCubit(
              getIt.get<HealthFoodRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => GetTrainerDetailsCubit(
              getIt.get<TrainerRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => SubscribeTrainerCubit(
              getIt.get<TrainerRepoImpl>(),
            )),
        BlocProvider(
            create: (context) => RegisterCubit(
              getIt.get<AuthRepoImpl>(),
            )),  BlocProvider(
            create: (context) => GetAllMealsCubit(
              getIt.get<MealsRepoImpl>(),
            )..getAllMeals()),  BlocProvider(
            create: (context) => GetMealByIdCubit(
              getIt.get<MealsRepoImpl>(),
            )),
      ],
      child: MaterialApp.router(
        title: "FETRA",
        theme: themeDataLight,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
