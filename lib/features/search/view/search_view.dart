import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/search/view/widgets/custom_text_field.dart';
import 'package:movies_app/features/search/view/widgets/movie_search_list_view.dart';
import 'package:movies_app/features/search/view_model/movie_search_listview_cubit.dart/movie_search_listview_cubit.dart';
import 'package:movies_app/features/search/view_model/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    String searchQuery = "";
    SearchCubit searchCubit = SearchCubit();
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: CustomTextField(onSubmittedFunction: (searchQueryTextField) {
              searchQuery = searchQueryTextField;
              searchCubit.getMoviesBySearchQuery(searchQueryTextField);
            }),
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocBuilder<SearchCubit, SearchState>(
            bloc: searchCubit,
            builder: (context, state) {
              if (state is SearchSuccess) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: BlocProvider(
                      create: (context) => MovieSearchListviewCubit(),
                      child: MovieSearchListView(
                        movies: state.movies,
                        searchQuery: searchQuery,
                      ),
                    ),
                  ),
                );
              } else if (state is SearchFailure) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/no_movies.png",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              } else if (state is SearchEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/no_movies.png",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Text(
                        "No movies found",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              } else if (state is SearchLoading) {
                return Expanded(
                  child: Center(
                    child: SpinKitFoldingCube(
                      color: AppColors.yellowColor,
                      size: 32.sp,
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/no_movies.png",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Text(
                        "Please enter the name of the movie",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
