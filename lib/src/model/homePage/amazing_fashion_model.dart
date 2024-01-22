class FashionModel {
  List<FashionList>? data;
  String? status;
  String? description;

  FashionModel({this.data, this.status, this.description});

  FashionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FashionList>[];
      json['data'].forEach((v) {
        data!.add(new FashionList.fromJson(v));
      });
    }
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

class FashionList {
  int? id;
  String? brandName;
  String? brandCode;
  String? image;
  String? defaultImage;
  String? additionalImage;
  num? discount;
  String? redemptionProcess;

  FashionList(
      {this.id,
      this.brandName,
      this.brandCode,
      this.image,
      this.defaultImage,
      this.additionalImage,
      this.discount,
      this.redemptionProcess});

  FashionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandCode = json['brandCode'];
    image = json['image'];
    defaultImage = json['defaultImage'];
    additionalImage = json['additionalImage'];
    discount = json['discount'];
    redemptionProcess = json['redemption_Process'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brandName'] = this.brandName;
    data['brandCode'] = this.brandCode;
    data['image'] = this.image;
    data['defaultImage'] = this.defaultImage;
    data['additionalImage'] = this.additionalImage;
    data['discount'] = this.discount;
    data['redemption_Process'] = this.redemptionProcess;
    return data;
  }
}
