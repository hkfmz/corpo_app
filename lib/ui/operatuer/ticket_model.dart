import 'dart:convert';

class TicketModel {

  String ticketTitre;
  String ticketCategorie;
  String ticketDescription;
  String ticketImage;

  TicketModel({
    this.ticketTitre,
    this.ticketCategorie,
    this.ticketDescription,
    this.ticketImage,
  });

  factory TicketModel.fromRawJson(String str) => TicketModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        ticketTitre: json["ticketTitre"],
        ticketCategorie: json["ticketCategorie"],
        ticketDescription: json["ticketDescription"],
        ticketImage: json["ticketImage"],
      );

  Map<String, dynamic> toJson() => {
        "ticketTitre": ticketTitre,
        "ticketCategorie": ticketCategorie,
        "ticketDescription": ticketDescription,
        "ticketImage": ticketImage,
      };
}

// To parse this JSON data, do
//
// final TicketModel = TicketModelFromJson(jsonString);