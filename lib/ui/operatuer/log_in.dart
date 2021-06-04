import 'package:corpo_app/util/colors.dart';
import 'package:corpo_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'main_screen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  double _height;
  double _width;

  var _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    // final Controller c = Get.put(Controller());

    Widget _iconBtn() {
      return IconButton(
          icon: Icon(
            Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              print('hello');
              _passwordVisible = !_passwordVisible;
            });
          });
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.lightGreenColor,
        body: Container(
          child: Column(
            children: [
              appBarWidget(), // custom widget
              Container(
                height: _height * 0.12, // space between app bar and Text Fields
              ),
              userNameWidget(),
              Container(height: _height * 0.025), // padding between Text Fields
              passWidget(),
              Container(
                height: _height * 0.08, // space
              ),
              loginButton(), // custom widget
              bottomText() // custom widget
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarWidget() {
    return ClipPath(
        clipper: CurvedBottomClipper(
        ),
        child: Container(
            // color: appColor.whiteColor,
            height: _height * 0.30,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
            ),
            child: Center(
              child: SvgPicture.asset('assets/corpo_logo.svg'),
            )),
      );
  }

  Widget userNameWidget() {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: AppColor.greyShadowColor,
            blurRadius: 6.0,
           // spreadRadius: 5.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: TextField(
        controller: userNameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          icon: SvgPicture.asset(
            'assets/prefix_user.svg',
          ),
          hintText: 'Username',
          hintStyle: TextStyle(color: AppColor.blackColor, fontSize: 11.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget passWidget() {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: AppColor.greyShadowColor,
            blurRadius: 6.0,
           // spreadRadius: 5.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: TextField(
        controller: passController,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          icon: SvgPicture.asset(
              'assets/prefix_lock.svg'
          ),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              print('toggle');
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          hintText: 'Password',
          hintStyle: TextStyle(color: AppColor.blackColor, fontSize: 11.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      width: _width * 0.40,
      child: ElevatedButton(
        child: Text(
          "Login",
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        ),
        onPressed: () {
          Get.to(() => MainScreen()); // GetX Navigation
          print('Login Tapped');
        },
        style: ElevatedButton.styleFrom(
          elevation: 6,
          padding: EdgeInsets.all(18),
          primary: AppColor.pinkColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget bottomText() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '©copro.app 2021',
            style: TextStyle(color: AppColor.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }
}
