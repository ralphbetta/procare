class User{
  late String? fullName;
  late String? gender;
  late String? dob;
  late int? phone;
  late String? email;
  late String? homeAddress;
  late String? nextOfKin;
  late String? password;
  late int? NOKPhone;
  late String? Dp;

  User({this.dob, this.phone, this.email, this.homeAddress, this.nextOfKin, this.NOKPhone, this.password, this.fullName, this.gender, this.Dp});

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      fullName: json['fullName'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      phone: json['phone'] as int,
      email: json['email'] as String,
      homeAddress: json['homeAddress'] as String,
      nextOfKin: json['nextOfKin'] as String,
      NOKPhone: json['NOKPhone'] as int,
      Dp: json['Dp'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['homeAddress'] = this.homeAddress;
    data['nextOfKin'] = this.nextOfKin;
    data['NOKPhone'] = this.NOKPhone;
    data['Dp'] = this.Dp;
    return data;
  }
}