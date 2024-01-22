class GetAllNewBrandListModel {
  List<NewBrandList>? data;
  String? status;
  String? description;

  GetAllNewBrandListModel({this.data, this.status, this.description});

  GetAllNewBrandListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NewBrandList>[];
      json['data'].forEach((v) {
        data!.add(new NewBrandList.fromJson(v));
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

class NewBrandList {
  int? id;
  String? brandName;
  String? brandCode;
  String? image;
  String? additionalImage;
  int? discount;

  NewBrandList(
      {this.id,
      this.brandName,
      this.brandCode,
      this.image,
      this.additionalImage,
      this.discount});

  NewBrandList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandCode = json['brandCode'];
    image = json['image'];
    additionalImage = json['additionalImage'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brandName'] = this.brandName;
    data['brandCode'] = this.brandCode;
    data['image'] = this.image;
    data['additionalImage'] = this.additionalImage;
    data['discount'] = this.discount;
    return data;
  }
}
