class CardDetailsModel {
  Data? data;
  String? status;
  String? description;

  CardDetailsModel({this.data, this.status, this.description});

  CardDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

class Data {
  List<Card>? card;
  Instruction? instruction;

  Data({this.card, this.instruction});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['card'] != null) {
      card = <Card>[];
      json['card'].forEach((v) {
        card!.add(new Card.fromJson(v));
      });
    }
    instruction = json['instruction'] != null
        ? new Instruction.fromJson(json['instruction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card!.map((v) => v.toJson()).toList();
    }
    if (this.instruction != null) {
      data['instruction'] = this.instruction!.toJson();
    }
    return data;
  }
}

class Card {
  String? orderId;
  String? brandCode;
  String? brandName;
  String? brandImage;
  String? cardNo;
  String? cardPin;
  String? purchaseOn;
  String? expiryDate;
  int? amount;

  Card(
      {this.orderId,
      this.brandCode,
      this.brandName,
      this.brandImage,
      this.cardNo,
      this.cardPin,
      this.purchaseOn,
      this.expiryDate,
      this.amount});

  Card.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    brandCode = json['brandCode'];
    brandName = json['brandName'];
    brandImage = json['brandImage'];
    cardNo = json['cardNo'];
    cardPin = json['cardPin'];
    purchaseOn = json['purchaseOn'];
    expiryDate = json['expiryDate'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['brandCode'] = this.brandCode;
    data['brandName'] = this.brandName;
    data['brandImage'] = this.brandImage;
    data['cardNo'] = this.cardNo;
    data['cardPin'] = this.cardPin;
    data['purchaseOn'] = this.purchaseOn;
    data['expiryDate'] = this.expiryDate;
    data['amount'] = this.amount;
    return data;
  }
}

class Instruction {
  Null? descriptions;
  Null? redeemSteps;
  Null? tnc;

  Instruction({this.descriptions, this.redeemSteps, this.tnc});

  Instruction.fromJson(Map<String, dynamic> json) {
    descriptions = json['descriptions'];
    redeemSteps = json['redeemSteps'];
    tnc = json['tnc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descriptions'] = this.descriptions;
    data['redeemSteps'] = this.redeemSteps;
    data['tnc'] = this.tnc;
    return data;
  }
}
