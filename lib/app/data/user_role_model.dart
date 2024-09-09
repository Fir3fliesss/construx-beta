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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['userRole'] = this.userRole;
    data['valid'] = this.valid;
    return data;
  }
}
