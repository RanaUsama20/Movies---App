import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

BottomNavigationBar buildCustomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    currentIndex: selectedIndex,
    onTap: onTapFunction,
    unselectedFontSize: 12.sp,
    selectedFontSize: 12.sp,
    selectedItemColor: AppColors.yellowColor,
    items: const [
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/home.png"),
          ),
          label: "HOME"),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/search.png"),
          ),
          label: "SEARCH"),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/icons/browse.png"),
          ),
          label: "BROWSE"),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/icons/watchlist.png"),
        ),
        label: "WATCHLIST",
      ),
    ],
  );
}
