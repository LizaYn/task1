class Data{
  String? name;
  String? price;
  String? info;

  Data.fromJson(Map<String,dynamic> json){
    name= json['name'];
    price=json['price'];
    info=json['info'];

    // ??means if its null put null else put data
    // and we use userdata to pull off each key and put it in the right pleace

  }
}