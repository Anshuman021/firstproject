class RetailerModel {
  String? ruid;
  String? retailerfirstName;
  String? retaileremail;
  String? retailerphoneno;
  String? retailerpassword;
  String? retailerPhotoURL;

  RetailerModel(
      {this.ruid,
      this.retaileremail,
      this.retailerfirstName,
      this.retailerphoneno,
      this.retailerpassword,
      this.retailerPhotoURL});

  // receiving data from server
  factory RetailerModel.fromMap(map) {
    return RetailerModel(
        ruid: map['ruid'],
        retailerfirstName: map['retailerfirstName'],
        retaileremail: map['retaileremail'],
        retailerphoneno: map['retailerphoneno'],
        retailerpassword: map['retailerpassword'],
        retailerPhotoURL: map['retailerPhotoURL']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'ruid': ruid,
      'retailerfirstName': retailerfirstName,
      'retaileremail': retaileremail,
      'retailerphoneno': retailerphoneno,
      'retailerpassword': retailerpassword,
      'retailerPhotoURL': retailerPhotoURL
    };
  }
}
