import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movie_details/view/movie_details_view.dart';
import 'package:movies_app/features/search/view_model/movie_search_listview_cubit.dart/movie_search_listview_cubit.dart';
import 'package:movies_app/features/watchlist/view/widgets/watch_list_item.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class MovieSearchListView extends StatefulWidget {
  final List<MovieDetails> movies;
  final String searchQuery;
  const MovieSearchListView({
    super.key,
    required this.movies,
    required this.searchQuery,
  });

  @override
  State<MovieSearchListView> createState() => _MovieSearchListViewState();
}

class _MovieSearchListViewState extends State<MovieSearchListView> {
  // void fetchMoreData() async {
  late ScrollController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset == controller.position.maxScrollExtent) {
        BlocProvider.of<MovieSearchListviewCubit>(context)
            .fetchMoreData(widget.searchQuery);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchListViewCubit =
        BlocProvider.of<MovieSearchListviewCubit>(context, listen: true);
    if (searchListViewCubit.movies.isEmpty) {
      searchListViewCubit.populateDataFirstTimeList(widget.movies);
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: controller,
            itemCount: searchListViewCubit.movies.length,
            separatorBuilder: (context, index) => Container(
              color: AppColors.greyDarkColor,
              height: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MovieDetailsView.routeName,
                      arguments: widget.movies[index]);
                },
                child: WatchListItem(
                  movie: widget.movies[index],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        if (searchListViewCubit.isLoadingMoreData == true)
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: SpinKitFadingCircle(
              color: AppColors.yellowColor,
              size: 36.sp,
            ),
          ),
        if (searchListViewCubit.state is MovieSearchListviewCubitNoMoreData)
          const NoMoreMoviesPaggination(
            message: "No more movies matching your search.",
          )
      ],
    );
  }
}

class NoMoreMoviesPaggination extends StatelessWidget {
  final String message;
  const NoMoreMoviesPaggination({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.yellowColor,
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }
}
