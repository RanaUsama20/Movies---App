import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "SEARCH",
        style: AppStyles.textStyle22,
      ),
    );
  }
}
