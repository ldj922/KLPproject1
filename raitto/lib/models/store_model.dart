class StoreInfo {
  String name;
  String phoneNumber;
  String menu;
  String photoUrl;

  StoreInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'],
        menu = json['menu'],
        photoUrl = json['photoUrl'];
}
