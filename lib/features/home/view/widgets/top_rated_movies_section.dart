import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/home/view/widgets/top_rated_movies_item.dart';
import 'package:movies_app/features/home/view_model/top_rated_movies/Cubit/top_rated_movies_states.dart';
import 'package:movies_app/features/home/view_model/top_rated_movies/Cubit/top_rated_movies_view_model.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class TopRatedMoviesSection extends StatefulWidget {
  const TopRatedMoviesSection({
    super.key,
  });

  @override
  State<TopRatedMoviesSection> createState() => _TopRatedMoviesSectionState();
}

class _TopRatedMoviesSectionState extends State<TopRatedMoviesSection> {

  TopRatedMoviesViewModel viewModel = TopRatedMoviesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getRecommendedMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      height: 350.h,
      color: AppColors.darkColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Top rated",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<TopRatedMoviesViewModel,TopRatedMoviesStates>(
            bloc: viewModel,
              builder: (context,state){
             if(state is TopRatedMoviesLoading){
                return Expanded(
                       child: SpinKitFoldingCube(
                         color: AppColors.yellowColor,
                         size: 35.sp,
                       ),
                     );
             }
             else if(state is TopRatedMoviesFailure){
                return SizedBox(
                       child: Center(
                         child: Text(
                           state.errorMessage!,
                           style: AppStyles.textStyle20,
                         ),
                       ),
                     );

             }
             else if(state is TopRatedMoviesSuccess){
                return Expanded(
                       child: ListView.builder(
                         itemCount: state.topRatedMoviesList.length,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) {
                           return TopRatedMovieItem(
                             movie: state.topRatedMoviesList[index],
                           );
                         },
                       ),
                     );
             }
             return Container();

              })


          // دا في حالة الساكسيس

          //دا الكود في حالة ايرور

          // ده برضه الزرار اللي هنعمل به فيتش للداتا لو في ايرور
          // getPopularMovies => بدلها هتحط الميثود اللي هتكونها
          // CustomButton(
          //   onPressed: () {
          //     popularMoviesViewModel.getPopularMovies();
          //   },
          // )
          // دا الكود في حالة اللوديمج

        ],
      ),
    );
  }
}
