class ContactModel {
  String message;
  String name;
  String image;
  String uid;
  String status;
  String statusColors, statusFonts, statusTexts;
  String type;
  var statusTime;
  ContactModel({
    this.image,
    this.message,
    this.name,
    this.uid,
    this.status,
    this.statusTime,
    this.type,
    this.statusColors,
    this.statusFonts,
    this.statusTexts,
  });

  // ContactModel();
  static Map<String, dynamic> toMap(ContactModel contactModel) => {
        'name': contactModel.name,
        'image': contactModel.image,
        'uid': contactModel.uid,
        'message': contactModel.message,
        'status': contactModel.status,
        'statusTime': contactModel.statusTime,
        'type': contactModel.type,
        'statusColors': contactModel.statusColors,
        'statusFonts': contactModel.statusFonts,
        'statusTexts': contactModel.statusTexts,
      };

  factory ContactModel.fromJson(Map<String, dynamic> jsonData) {
    return ContactModel(
      name: jsonData['name'],
      image: jsonData['image'],
      uid: jsonData['uid'],
      message: jsonData['message'],
      status: jsonData['status'],
      statusTime: jsonData['statusTime'],
      type: jsonData['type'],
      statusColors: jsonData['statusColors'],
      statusFonts: jsonData['statusFonts'],
      statusTexts: jsonData['statusTexts'],
    );
  }
  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'image': image,
  //       'uid': uid,
  //       'message': message,
  //       'status': status,
  //       'statusTime': statusTime,
  //       'type': type,
  //       'statusColors': statusColors,
  //       'statusFonts': statusFonts,
  //       'statusTexts': statusTexts,
  //       'statusTime':statusTime
  //     };
}
