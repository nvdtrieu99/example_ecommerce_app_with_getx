class User {
  dynamic _id;
  String mobileNo;
  String? password;
  String? fullname;
  String? email;
  String? gender;
  String? alternateMoNumber;
  String? hint;
  dynamic __v;

  User(
      {dynamic id,
      required this.mobileNo,
      this.password,
      this.fullname,
      this.email,
      this.gender,
      this.alternateMoNumber,
      this.hint,
      dynamic v})
      : _id = id,
        __v = v;

  set id(dynamic id) => _id = id;
  set v(dynamic v) => __v = v;

  get id => _id;
  get v => __v;

  factory User.fromJon(dynamic json) {
    return User(
      mobileNo: json["mobileNo"],
      password: json["password"],
      fullname: json["fullname"] ?? "",
      email: json["email"] ?? "",
      gender: json["gender"] ?? "",
      alternateMoNumber: json["alternateMoNumber"] ?? "",
      hint: json["hint"] ?? "",
      id: json["_id"],
      v: json["__v"],
    );
  }
}
