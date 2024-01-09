class Generateotp {
  String? refId;
  bool? success;
  String? message;

  Generateotp({this.refId, this.success, this.message});

  Generateotp.fromJson(Map<String, dynamic> json) {
    refId = json['ref_id'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ref_id'] = this.refId;
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
