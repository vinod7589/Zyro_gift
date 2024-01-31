class VoucherDataResponseModel {
  List<VoucherEntity>? data;
  String? status;
  String? description;

  VoucherDataResponseModel({this.data, this.status, this.description});

  VoucherDataResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VoucherEntity>[];
      json['data'].forEach((v) {
        data!.add(new VoucherEntity.fromJson(v));
      });
    }
    status = json['status'];
    description = json['description'];
  }
}

class VoucherEntity {
  num? id;
  num? categoryId;
  String? brand;
  String? brandCode;
  String? image;
  String? popularBrandImage;
  String? additionalImage;
  String? defaultImage;
  String? newBrandImage;
  String? redemptionProcess;
  num? discount;
  String? descriptions;
  String? denominationList;
  num? stockAvailable;
  String? tnc;
  String? importantInstruction;
  String? redeemSteps;
  num? brandPosition;
  bool? isPopularBrand;
  bool? isNewBrand;
  String? category;
  String? brandType;

  VoucherEntity(
      {this.id,
      this.categoryId,
      this.brand,
      this.brandCode,
      this.image,
      this.popularBrandImage,
      this.additionalImage,
      this.defaultImage,
      this.newBrandImage,
      this.redemptionProcess,
      this.discount,
      this.descriptions,
      this.denominationList,
      this.stockAvailable,
      this.tnc,
      this.importantInstruction,
      this.redeemSteps,
      this.isPopularBrand,
      this.isNewBrand,
      this.brandPosition,
      this.category,
      this.brandType});

  VoucherEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    brand = json['brand'];
    brandCode = json['brandCode'];
    image = json['image'];
    popularBrandImage = json['popularBrandImage'];
    additionalImage = json['additionalImage'];
    defaultImage = json['defaultImage'];
    newBrandImage = json['newBrandImage'];
    redemptionProcess = json['redemption_Process'];
    discount = json['discount'];
    descriptions = json['descriptions'];
    denominationList = json['denominationList'];
    stockAvailable = json['stockAvailable'];
    tnc = json['tnc'];
    importantInstruction = json['importantInstruction'];
    redeemSteps = json['redeemSteps'];
    isPopularBrand = json['isPopularBrand'];
    isNewBrand = json['isNewBrand'];
    category = json['category'];
    brandPosition = json['brandPosition'];
    brandType = json['brandType'];
  }
}
