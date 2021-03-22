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

  // ContactModel.fromJson(Map<String, dynamic> json)
  //     : name = json['name'],
  //       image = json['image'],
  //       status = json['status'],
  //       message = json['message'],
  //       uid = json['uid'],
  //       statusColors = json['statusColors'],
  //       statusFonts = json['statusFonts'],
  //       statusTime = json['statusTime'],
  //       statusTexts = json['statusTexts'],
  //       type = json['type'];

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
