import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/cubits/watchlist_cubit/watchlist_cubit.dart';
import 'package:movies_app/features/movie_details/view/movie_details_view.dart';
import 'package:movies_app/features/watchlist/view/widgets/watch_list_item.dart';

class WatchlistView extends StatefulWidget {
  const WatchlistView({
    super.key,
  });

  @override
  State<WatchlistView> createState() => _WatchlistViewState();
}

class _WatchlistViewState extends State<WatchlistView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchlistCubit>(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 75.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Text(
            "WATCHLIST",
            style: AppStyles.textStyle22,
          ),
        ),
        SizedBox(
          height: 15.w,
        ),
        if (watchListCubit.movies.isNotEmpty)
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MovieDetailsView.routeName,
                      arguments: watchListCubit.movies[index]);
                },
                child: WatchListItem(
                  movie: watchListCubit.movies[index],
                ),
              ),
              separatorBuilder: (context, index) => Container(
                color: AppColors.greyDarkColor,
                height: 2,
              ),
              itemCount: watchListCubit.movies.length,
            ),
          ),
        if (watchListCubit.movies.isEmpty)
          Expanded(
            child: Center(
              child: Text(
                "No movies in watchlist,",
                textAlign: TextAlign.center,
                style: AppStyles.textStyle22.copyWith(fontSize: 26.sp),
              ),
            ),
          )
      ],
    );
  }
}
