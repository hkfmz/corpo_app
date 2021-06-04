import 'package:corpo_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_timetable_view/flutter_timetable_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Earning extends StatefulWidget {
  @override
  _EarningState createState() => _EarningState();
}

class _EarningState extends State<Earning> {

  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),        // appBar widget
      body: Column(
        children: [
          Container(
            color: AppColor.lightGreenColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text('685 dh',
                    style: TextStyle(fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.lightBlackColor),
                  ),
                ),
                SizedBox(width: 2.w),
                Text('Etat de la caisse', style: TextStyle(color: AppColor.greyColor),),
              ],
            ),
          ),
          Expanded(
            child: TimetableView(
              laneEventsList: _buildLaneEvents(),
              timetableStyle: TimetableStyle(
                  laneColor: AppColor.lightGreenColor,
                  timelineItemColor: AppColor.lightGreenColor,
                  timeItemTextColor: Colors.black54,
                  mainBackgroundColor: AppColor.lightGreenColor),
            ),
          ),
          bottomUI(),     // bottom UI widget
        ],
      ),
    );
  }

  Widget appBar(){
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.blackColor,),
          onPressed: () {
            Get.back();
            print('backBtn');
          }),
      toolbarHeight: 100,
      centerTitle: true,
      title: const Text('Caisse', style: TextStyle(color: AppColor.blackColor),),
    );
  }

  List<LaneEvents> _buildLaneEvents() {
    return [
      LaneEvents(
        lane: Lane(name: 'Février 2021', backgroundColor: AppColor.lightGreenColor,textStyle: TextStyle(fontSize: 12.sp)),
        events: [
          TableEvent(
            backgroundColor: AppColor.darkPinkColor,
            onTap: () {},
            title: '',
            start: TableEventTime(hour: 1, minute: 0),
            end: TableEventTime(hour: 2, minute: 0),
          ),
          TableEvent(
            backgroundColor: AppColor.darkPinkColor,
            onTap: () {},
            title: '',
            start: TableEventTime(hour: 8, minute: 0),
            end: TableEventTime(hour: 9, minute: 0),
          ),
          TableEvent(
            title: 'An event 2',
            backgroundColor: AppColor.darkPinkColor,
            start: TableEventTime(hour: 12, minute: 0),
            end: TableEventTime(hour: 13, minute: 0),
          ),
          TableEvent(
            backgroundColor: AppColor.darkPinkColor,
            onTap: () {},
            title: '',
            start: TableEventTime(hour: 16, minute: 0),
            end: TableEventTime(hour: 17, minute: 0),
          ),
          TableEvent(
            backgroundColor: AppColor.darkPinkColor,
            onTap: () {},
            title: '',
            start: TableEventTime(hour: 20, minute: 0),
            end: TableEventTime(hour: 21, minute: 0),
          ),
        ],
      ),
      // LaneEvents(
      //   lane: Lane(name: 'Février 2021', backgroundColor: AppColor.lightGreenColor, textStyle: TextStyle(fontSize: 12.sp)),
      //   events: [
      //     TableEvent(
      //       title: 'An event 3',
      //       backgroundColor: AppColor.darkPinkColor,
      //       start: TableEventTime(hour: 10, minute: 0),
      //       end: TableEventTime(hour: 11, minute: 0),
      //     ),
      //   ],
      // ),
    ];
  }

  Widget bottomUI(){
    return Container(
      height: _height* 0.1,
      width: _width,
      color: Colors.white,
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('07/13', style: TextStyle(fontSize: 12.sp, color: AppColor.blackColor),
              ),
              Container(
                  height: _height * 0.005),
              Text('Tickers traités', style: TextStyle(color: AppColor.greyColor, fontSize: 10.sp),
              ),
            ],
          ),
          SvgPicture.asset('assets/small_check.svg'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('658DH', style: TextStyle(fontSize: 12.sp, color: AppColor.blackColor),
              ),
              Container(
                  height: _height * 0.005),
              Text('au 10/02/2021', style: TextStyle(color: AppColor.greyColor, fontSize: 10.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
