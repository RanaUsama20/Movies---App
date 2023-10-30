import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class MovieGenres extends StatelessWidget {
  final String genreName;
  const MovieGenres({super.key, required this.genreName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        genreName,
        style: AppStyles.textStyle14,
      ),
    );
  }
}
