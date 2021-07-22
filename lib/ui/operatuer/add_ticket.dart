import 'package:corpo_app/ui/resident/add_ticket.dart';
import 'package:corpo_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class AddTicket extends StatefulWidget
{
  @override
  _AddTicketState createState() => _AddTicketState();
  
}

class _AddTicketState extends State<AddTicket> {

  final addTicketCtrl = Get.put<AddTicketCtrl>(AddTicketCtrl());

  List<Asset>  images = <Asset>[];
  double _width;

  List<Asset> resultList = <Asset>[];

  double _height;

  String _error = 'No Error Dectected';

  TextEditingController ticketTitreCtrl = TextEditingController();
  TextEditingController ticketCategorieCtrl = TextEditingController();
  TextEditingController ticketDescriptionCtrl = TextEditingController();
  TextEditingController ticketImageCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<bool> checkAndRequestCameraPermissions() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([PermissionGroup.camera]);
      return permissions[PermissionGroup.camera] == PermissionStatus.granted;
    } else {
      return true;
    }
  }

  Future<void> loadAssets() async {        // Image picker package to load images
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Pick Image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

      setState(() {
        images = resultList;
        _error = error;
     //   print('setState $images');
      });
  }

  int _value = 0;

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            loadAssets();
          },
          child: SvgPicture.asset('assets/camera.svg'),
        ),
      body: Column(
        children: <Widget>[
          _titleTextField(),         // Title Text Field Widget
          _horizontalListBtns(),    // horizontal listView Widget
          _descTextField(),        // Desc Text Field Widget
          Expanded(
            child: buildGridView(),       // gridView images Widget
          ),
          envoyerButton(),
        ],
      ),
    );
  }

  Widget _appBar(){
    return AppBar(
      backgroundColor: Color(0xFFE8F8F5),
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.blackColor,),
          onPressed: () {
            Get.back();
            print('backBtn');
          }),
      toolbarHeight: 100,
      centerTitle: true,
      title: const Text('Nouveau Ticket', style: TextStyle(color: AppColor.blackColor),),
    );
  }

  Widget _titleTextField(){
    final addTicketCtrl = Get.find<AddTicketCtrl>();

    return Container(

      child: TextField(
        controller: addTicketCtrl.ticketTitreCtrl,

        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(fontSize: 14.sp, color: AppColor.lightBlackColor, fontWeight: FontWeight.w500),
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          // icon: SvgPicture.asset(
          //   'assets/prefix_user.svg',
          // ),
          hintText: 'VITRE ASSENCEUR CASSEE',
          hintStyle: TextStyle(color: AppColor.lightBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _horizontalListBtns(){
    // final addTicketCtrl = Get.find<AddTicketCtrl>();
    return Container(
      height: _height * 0.1,
      // color: Colors.green,
      // margin: EdgeInsets.only(left: 12, right: 12),
      padding: EdgeInsets.all(16.0),
      child: ListView(             // horizontal list for buttons
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: InkWell(
              onTap: () => setState(() => _value = 0),
              child: new Container(
                width: 120.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: _value == 0 ? AppColor.btnBlueColor : Colors.white,
                  borderRadius: new BorderRadius.circular(32.0),
                  border: new Border.all(color: AppColor.textGreyColor, width: 1.0),
                ),
                child: new Center(
                  child: Text('Plomberie',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: _value == 0 ? Colors.white : AppColor.blackColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: InkWell(
              onTap: () => setState(() => _value = 1),
              child: new Container(
                width: 120.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: _value == 1 ? AppColor.btnBlueColor : Colors.white,
                  borderRadius: new BorderRadius.circular(32.0),
                  border: new Border.all(color: AppColor.textGreyColor, width: 1.0),
                ),
                child: new Center(
                  child: Text('Assenceur',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: _value == 1 ? Colors.white : AppColor.blackColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8),
            child: InkWell(
              onTap: () => setState(() => _value = 2),
              child: new Container(
                width: 120.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: _value == 2 ? AppColor.btnBlueColor : Colors.white,
                  borderRadius: new BorderRadius.circular(32.0),
                  border: new Border.all(color: AppColor.textGreyColor, width: 1.0),
                ),
                child: new Center(
                  child: Text('Jardinage',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: _value == 2 ? Colors.white : AppColor.blackColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8),
            child: InkWell(
              onTap: () => setState(() => _value = 3),
              child: new Container(
                width: 120.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: _value == 3 ? AppColor.btnBlueColor : Colors.white,
                  borderRadius: new BorderRadius.circular(32.0),
                  border: new Border.all(color: AppColor.textGreyColor, width: 1.0),
                ),
                child: new Center(
                  child: Text('Electricité',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: _value == 3 ? Colors.white : AppColor.blackColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descTextField(){
    final addTicketCtrl = Get.find<AddTicketCtrl>();

    return Container(
      //  height: _height * 0.16,
      // color: Colors.blue,
      child: TextField(
        controller: addTicketCtrl.ticketDescriptionCtrl,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(fontSize: 11.sp, color: AppColor.lightBlackColor),
        maxLines: 5,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          // icon: SvgPicture.asset(
          //   'assets/prefix_user.svg',
          // ),
          hintText: 'Si stante, hoc natura videlicet vult, salvam'
              '\nesse se, quod concedimus; Nunc haec \n'
              'primum fortasse audientis servire debemus.',
          hintStyle: TextStyle(color: AppColor.lightBlackColor, fontSize: 11.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildGridView() {             // display images in Grid
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Container(
          padding: EdgeInsets.all(16.0),
          child:
          AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          ),

        );
      }),
    );
  }

    Widget envoyerButton() {
    return Container(
      width: _width * 0.40,
      child: ElevatedButton(
        child: Text(
          "Envoyer",
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        ),
        onPressed: ()
        {
          addTicketCtrl.postTicketToMongoDB();
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

}
