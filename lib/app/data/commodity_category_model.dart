class CommodityCategoryModel {
  int? no;
  String? commodityCategory;
  String? creator;
  String? createTime;

  CommodityCategoryModel(
      {this.no, this.commodityCategory, this.creator, this.createTime});

  CommodityCategoryModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    commodityCategory = json['commodityCategory'];
    creator = json['creator'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['commodityCategory'] = commodityCategory;
    data['creator'] = creator;
    data['createTime'] = createTime;
    return data;
  }
}
