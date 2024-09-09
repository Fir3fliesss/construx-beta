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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['commodityCategory'] = this.commodityCategory;
    data['creator'] = this.creator;
    data['createTime'] = this.createTime;
    return data;
  }
}
