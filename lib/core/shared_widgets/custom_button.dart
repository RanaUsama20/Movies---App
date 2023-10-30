import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.yellowColor,
        foregroundColor: AppColors.blackColor,
      ),
      onPressed: onPressed,
      icon: Icon(
        Icons.restart_alt,
        size: 32.sp,
      ),
      label: Text(
        "Try again",
        style: AppStyles.textStyle18.copyWith(
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
