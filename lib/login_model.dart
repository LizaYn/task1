

class  ShopLoginModel {
  bool? status ;
  String? message ;
  UserData? data;

  ShopLoginModel.fromJson(Map<String,dynamic> json){
    status= json['status'];
    message=json['message'];
    // ??means if its null put null else put data
    // and we use userdata to pull off each key and put it in the right pleace
    data = json['data'] != null ? UserData.fromJson(json['data']):null;
  }

}

class UserData {
  int? id ;
  String? name;
  String? email ;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

//named contructor
  UserData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }


}