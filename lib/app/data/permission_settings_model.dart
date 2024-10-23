class permission_settings_model {
  String? roleModel;
  String? menuName;

  permission_settings_model({this.roleModel, this.menuName});

  permission_settings_model.fromJson(Map<String, dynamic> json) {
    roleModel = json['roleModel'];
    menuName = json['menuName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleModel'] = this.roleModel;
    data['menuName'] = this.menuName;
    return data;
  }
}
