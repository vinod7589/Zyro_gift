class GetDashBoardBannerModel {
  List<BannerData>? data;
  String? status;
  String? description;

  GetDashBoardBannerModel({this.data, this.status, this.description});

  GetDashBoardBannerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(new BannerData.fromJson(v));
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

class BannerData {
  int? id;
  String? brandName;
  String? image;
  bool? isVisible;
  String? addedOn;

  BannerData(
      {this.id, this.brandName, this.image, this.isVisible, this.addedOn});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_Name'];
    image = json['image'];
    isVisible = json['isVisible'];
    addedOn = json['added_On'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_Name'] = this.brandName;
    data['image'] = this.image;
    data['isVisible'] = this.isVisible;
    data['added_On'] = this.addedOn;
    return data;
  }
}
