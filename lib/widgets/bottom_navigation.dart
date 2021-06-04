import 'package:corpo_app/ui/operatuer/earning.dart';
import 'package:corpo_app/ui/operatuer/main_screen.dart';
import 'package:corpo_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BottomNavigation extends StatelessWidget {
  final int bottomNavigationBarIndex;
  final BuildContext context;

  const BottomNavigation(this. context, this.bottomNavigationBarIndex);

  void onTabTapped(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(builder: (BuildContext context) {
        return (index == 1) ? Earning() : MainScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: bottomNavigationBarIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      selectedLabelStyle: TextStyle(color: AppColor.bottomNavSelectedColor),
      selectedItemColor: AppColor.bottomNavSelectedColor,
      unselectedFontSize: 10,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              'assets/home.svg',
              color: (bottomNavigationBarIndex == 0)
                  ? AppColor.bottomNavSelectedColor
                  : AppColor.bottomNavUnselectedColor,
            ),
          ),
          title: Text('Accueil', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500),),
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              'assets/money.svg',
              color: (bottomNavigationBarIndex == 1)
                  ? AppColor.bottomNavSelectedColor
                  : AppColor.bottomNavUnselectedColor,
            ),
          ),
          title: Text('Caisse', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500)),
        ),
      ],
      onTap: onTabTapped,
    );
  }
}