class UserRole {
  int? no;
  String? userRole;
  String? valid;

  UserRole({this.no, this.userRole, this.valid});

  UserRole.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    userRole = json['userRole'];
    valid = json['valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['userRole'] = userRole;
    data['valid'] = valid;
    return data;
  }
}
