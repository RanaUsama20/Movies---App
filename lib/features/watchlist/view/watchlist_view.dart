import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
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
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            itemBuilder: (context, index) => WatchListItem(),
            separatorBuilder: (context, index) => Container(
              color: AppColors.greyDarkColor,
              height: 2,
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
