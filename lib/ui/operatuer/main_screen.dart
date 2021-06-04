import 'package:corpo_app/util/colors.dart';
import 'package:corpo_app/widgets/bottom_navigation.dart';
import 'package:corpo_app/widgets/custom_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final bottomNavigationBarIndex = 0;

 // var appColor = AppColor();

  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {

   // appColor = AppColor();

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.lightGreenColor,
      body: Column(
        children: [
          headerUI(context),        // header part
          middlePartUI(context),    // middle part
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,     // bottom navigation bar and Fab
      floatingActionButton: customFab(context),
      bottomNavigationBar: BottomNavigation(context, bottomNavigationBarIndex),
      );
  }

  Widget headerUI(BuildContext context) {

    _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: _height * 0.1, // empty space container between scaffold and column
          color: AppColor.darkPinkColor,
        ),
        Container(                  // header part UI
          width: _width,
          height: _height * 0.26,
          color: AppColor.darkPinkColor,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marhaba Adil.',
                          style: TextStyle(
                              fontSize: 13.sp, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '13 Tickets en cours',
                          style: TextStyle(
                              fontSize: 8.sp, color: AppColor.whiteColor),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: new Container(
                        height: _height * 0.056,
                        width: _width * 0.22,
                        alignment: Alignment.center,
                        child: Text('950 DH',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColor.whiteColor, fontSize: 12.sp)),
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(28.0),
                          color: Colors.white24,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                      width: 46,
                      height: 46,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:
                              new AssetImage("assets/user_avatar.png"))
                      )
                  ),
                ],
              ),
              Container(height: _height * 0.02),
              Stack(
                children: [
                  Positioned(
                      right: 30,
                      top: 10,
                      child: SvgPicture.asset('assets/close.svg'),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 4.w, right: 4.w),
                    height: _height * 0.15,
                    width: _width,
                    //  alignment: Alignment.center,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3.w, top: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Rappel de la journée',
                                style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(height: _height * 0.006,),
                              Text(
                                'Appeler Mr. Caméra pour le parking.',
                                style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 9.sp),
                              ),
                              Container(height: _height * 0.003,),
                              Text(
                                '13.00 PM',
                                style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 9.sp),
                              ),
                            ],
                          ),
                        ),
                        Container(                     // bell icon
                          margin: EdgeInsets.only(right: 8.w),
                          child: SvgPicture.asset('assets/bell.svg'),
                        )
                      ],
                    ),
                    decoration: new BoxDecoration(        // background color
                      borderRadius: new BorderRadius.circular(6.0),
                      color: Colors.white24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget middlePartUI(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
                child: Text(
                  'Aujourd’hui',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.textBlueColor),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/green_check.svg'),
                    Text(
                      '07.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Titre ticket                         ',
                        style: TextStyle(
                            color: AppColor.textGreyColor,
                            //fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg'),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.yellowColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.24,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SvgPicture.asset('assets/empty_check.svg'),
                      Text(
                        '08.00 AM',
                        style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          'Titre ticket',
                          style: TextStyle(
                              color: AppColor.textBlueColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SvgPicture.asset('assets/small_bell.svg')
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.015, 0.015],
                      colors: [AppColor.yellowColor, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.greyShadowColor,
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                ),
                secondaryActions: <Widget>[
                  SlideAction(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.trashRedBg),
                        child: Image.asset('assets/trash.png'),
                      ),
                    ),
                    onTap: () => print('Delete'),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '10.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 160,
                      child: Text(
                        'Titre ticket loren',
                        style: TextStyle(
                            color: AppColor.textRedColor,
                            fontWeight: FontWeight.w600, fontSize: 10.sp),
                      ),
                    ),
                    Text('Décliné', style: TextStyle(color: AppColor.textRedColor, fontSize: 9.sp, fontWeight: FontWeight.w400),),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.purpleColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '10.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Devis trop cher. Revoir un autre.',
                        style: TextStyle(
                            color: AppColor.textRedColor,
                            fontWeight: FontWeight.w400, fontSize: 9.sp),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg')
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.purpleColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  'Demain',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.textBlueColor),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '07.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Titre ticket loren i-sum',
                        style: TextStyle(
                            color: AppColor.textBlueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg'),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.blueColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '07.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Titre ticket loren i-sum',
                        style: TextStyle(
                            color: AppColor.textBlueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg'),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.greenColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '07.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Titre ticket',
                        style: TextStyle(
                            color: AppColor.textBlueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg'),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.blueColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '07.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Titre ticket loren i-sum',
                        style: TextStyle(
                            color: AppColor.textBlueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg'),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.yellowColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '07.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Titre ticket',
                        style: TextStyle(
                            color: AppColor.textBlueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg'),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.purpleColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SvgPicture.asset('assets/empty_check.svg'),
                    Text(
                      '07.00 AM',
                      style: TextStyle(color: AppColor.textGreyColor, fontSize: 9.sp),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        'Titre ticket loren i-sum',
                        style: TextStyle(
                            color: AppColor.textBlueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SvgPicture.asset('assets/small_bell.svg'),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.015, 0.015],
                    colors: [AppColor.purpleColor, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyShadowColor,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
