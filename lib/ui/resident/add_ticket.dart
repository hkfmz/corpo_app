import 'package:corpo_app/ui/operatuer/ticket_model.dart';
import 'package:dio/dio.dart' as prefix;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AddTicketCtrl extends GetxController {

  TextEditingController ticketTitreCtrl = TextEditingController();
  TextEditingController ticketCategorieCtrl = TextEditingController();
  TextEditingController ticketDescriptionCtrl = TextEditingController();
  TextEditingController ticketImageCtrl = TextEditingController();

  // ignore: deprecated_member_use
  List<TicketModel> ticketList = List();
  prefix.Dio dio = new prefix.Dio();
  String baseUrl = "http://192.168.191.4:3000/upload";
  final logger = Logger();
  TicketModel ticketModel = TicketModel();
  final isTicketUploading = false.obs;

  void addTicketInList() {
    TicketModel ticketModel = TicketModel(
      ticketTitre: ticketTitreCtrl?.text,
    );

    ticketList.add(ticketModel);
    ticketList.forEach((ticket) {
      print('${ticket.ticketTitre}');
    });

    update();
  }

  bool isUploading = false;

  void postTaskToDb() {
    print('inside postTicketToDb()');
    isUploading = true;
    update();
    print('isUploading: $isUploading');
    postingTicketToDb();
  }

  void postingTicketToDb() {

    print('inside postingTicketToDb');
    TicketModel ticketModel = TicketModel(
      ticketTitre: ticketTitreCtrl?.text,
    );

    Future.delayed(Duration(seconds: 2)).then((_) {
      ticketList.add(ticketModel);
      ticketList.forEach((ticket) {
        print('${ticket.ticketTitre}');
      });

      isUploading = false;
      showSnackBar();
      update();
      print('isUploading: $isUploading');
      resetUi();
    });

  }


  void showSnackBar() {
    Get.snackbar(
      'Ticket ajouté!',
      '',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

//test envoie vers api
  resetUi() {
    ticketTitreCtrl.text = 'Teste';
    ticketCategorieCtrl.text = 'Catégorire';
    ticketDescriptionCtrl.text = 'description';
    ticketImageCtrl.text = 'image';
  }

  postTicketToMongoDB() async {
    isTicketUploading(true);
    String apiUrl = "http://192.168.191.4:3000/upload";
    logger.d("apiUrl is: $apiUrl");
    ticketModel.ticketTitre = ticketTitreCtrl.text;
    ticketModel.ticketCategorie = ticketCategorieCtrl.text;
    ticketModel.ticketDescription = ticketDescriptionCtrl.text;
    ticketModel.ticketImage = ticketImageCtrl.text;

  try
    {
      prefix.Response response = await dio.post(
        apiUrl,
        data: ticketModel.toJson(),
      );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.d("response is : ${response.data.toString()}");
        resetUi();
        showSnackBar();
        return response;
      }
    }
    catch (e) {
      logger.e("catch error : ${e.message}");
    } finally {
      isTicketUploading(false);
    }
  }
}
