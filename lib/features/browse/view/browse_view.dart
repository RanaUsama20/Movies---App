import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/browse/view/widgets/custom_genre_container.dart';
import 'package:movies_app/models/genre_model/genre_model.dart';

class BrowseView extends StatelessWidget {
  static const String routeName = "Browse-Screen";
  List genreList = GenreDM.getGenres();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 70.sp),
          Text(
            "Browse Genre",
            style:
                AppStyles.textStyle22.copyWith(fontWeight: FontWeight.normal),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 38.sp,
                  crossAxisSpacing: 47.sp,
                  childAspectRatio: 1.5),
              itemBuilder: (context, index) {
                return InkWell(
                    splashColor: AppColors.yellowColor.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    onTap: () {

                    },
                    child: CustomGenreContainer(
                        genre: genreList[index], index: index));
              },
              itemCount: genreList.length,
            ),
          )
        ],
      ),
    );
  }
}
