
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

import '../view_model/search_view_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

 static List <MovieModel> mainMovieList=[
   //MovieModel()
 ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            style: TextStyle(color: AppColors.whiteColor),
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.greyDarkColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                hintText: 'Search Movie Name',
                hintStyle: AppStyles.textStyle16,
                prefixIcon: Icon(Icons.search_sharp,),
              prefixIconColor: AppColors.whiteColor,

            ),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Expanded(child: ListView()),

      ],
    );
  }
  void updateList (String value){

  }
}
