import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/models/genre_model/genre_model.dart';

class CustomGenreContainer extends StatelessWidget {
  GenreDM genre;
  int index;
  CustomGenreContainer({required this.genre, required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 158.sw,
      height: 90.sh,
      decoration: BoxDecoration(
          image: const DecorationImage(
              alignment: Alignment.center,
              image: AssetImage("assets/images/category_image.png"),
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
              opacity: 0.63),
          borderRadius: BorderRadius.circular(4.sp)),
      child: Center(
        child: Text(
          genre.genreTitle,
          style: AppStyles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
