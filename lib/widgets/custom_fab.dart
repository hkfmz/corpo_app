import 'package:corpo_app/ui/operatuer/add_ticket.dart';
import 'package:corpo_app/ui/operatuer/main_screen.dart';
import 'package:corpo_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

FloatingActionButton customFab(context) {

  return FloatingActionButton(
    onPressed: () {
      Get.to(() => AddTicket());

    },

    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset('assets/add.png'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            AppColor.fabLightColor,
            AppColor.fabDarkColor,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
    ),
  );
}