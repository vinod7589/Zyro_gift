class GetAllCategoryModel {
  List<CategoriesList>? data;
  String? status;
  String? description;

  GetAllCategoryModel({this.data, this.status, this.description});

  GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoriesList>[];
      json['data'].forEach((v) {
        data!.add(new CategoriesList.fromJson(v));
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

class CategoriesList {
  int? id;
  String? categoryName;
  String? categoryImage;

  CategoriesList({this.id, this.categoryName, this.categoryImage});

  CategoriesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['categoryImage'] = this.categoryImage;
    return data;
  }
}
