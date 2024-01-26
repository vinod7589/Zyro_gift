class CheckMaxLimitReachedModel {
  String? status;
  String? description;
  int? availableLimit;

  CheckMaxLimitReachedModel(
      {this.status, this.description, this.availableLimit});

  CheckMaxLimitReachedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    availableLimit = json['available_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['description'] = this.description;
    data['available_limit'] = this.availableLimit;
    return data;
  }
}
