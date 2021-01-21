class AuthResponse {
  String refreshToken;
  String token;
  User user;

  AuthResponse({this.refreshToken, this.token, this.user});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['refreshToken'] = this.refreshToken;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String id;
  String email;
  bool emailConfirmed;
  int role;
  String picture;
  bool active;
  String createdAt;
  String updatedAt;

  User({
    this.id,
    this.email,
    this.emailConfirmed,
    this.role,
    this.picture,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailConfirmed = json['emailConfirmed'];
    role = json['role'];
    picture = json['picture'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['emailConfirmed'] = this.emailConfirmed;
    data['role'] = this.role;
    data['picture'] = this.picture;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Role {
  int value;
  String text;
  Role({
    this.value,
    this.text,
  });
}

List<Role> dropDownClass = [
  Role(
    text: 'Client',
    value: 0,
  ),
  Role(
    text: 'Shopper',
    value: 1,
  ),
  Role(
    text: 'Manager',
    value: 2,
  ),
  Role(
    text: 'Owner',
    value: 3,
  ),
];
