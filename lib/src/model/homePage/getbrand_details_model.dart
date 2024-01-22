class GetBrandDetailsModel {
  GetBrandDetailsList? data;
  String? status;
  String? description;

  GetBrandDetailsModel({this.data, this.status, this.description});

  GetBrandDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new GetBrandDetailsList.fromJson(json['data'])
        : null;
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

class GetBrandDetailsList {
  int? id;
  String? brandName;
  String? brandCode;
  String? descriptions;
  String? image;
  String? redemptionProcess;
  int? discount;
  String? brandtype;
  String? denominationList;
  int? stockAvailable;
  String? tnc;
  String? importantInstruction;
  String? redeemSteps;

  GetBrandDetailsList(
      {this.id,
      this.brandName,
      this.brandCode,
      this.descriptions,
      this.image,
      this.redemptionProcess,
      this.discount,
      this.brandtype,
      this.denominationList,
      this.stockAvailable,
      this.tnc,
      this.importantInstruction,
      this.redeemSteps});

  GetBrandDetailsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandCode = json['brandCode'];
    descriptions = json['descriptions'];
    image = json['image'];
    redemptionProcess = json['redemption_Process'];
    discount = json['discount'];
    brandtype = json['brandtype'];
    denominationList = json['denominationList'];
    stockAvailable = json['stockAvailable'];
    tnc = json['tnc'];
    importantInstruction = json['importantInstruction'];
    redeemSteps = json['redeemSteps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brandName'] = this.brandName;
    data['brandCode'] = this.brandCode;
    data['descriptions'] = this.descriptions;
    data['image'] = this.image;
    data['redemption_Process'] = this.redemptionProcess;
    data['discount'] = this.discount;
    data['brandtype'] = this.brandtype;
    data['denominationList'] = this.denominationList;
    data['stockAvailable'] = this.stockAvailable;
    data['tnc'] = this.tnc;
    data['importantInstruction'] = this.importantInstruction;
    data['redeemSteps'] = this.redeemSteps;
    return data;
  }
}
