class AllCategorysList {
  String? title;
  String? categoriesImage;

  AllCategorysList({this.title, this.categoriesImage});

  factory AllCategorysList.fromJson(Map<String, dynamic> json) {
    return AllCategorysList(
      title: json['title'],
      categoriesImage: json['categoriesImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'categoriesImage': categoriesImage,
    };
  }
}
