class FarmerModel {
  String? fuid;
  String? farmerfirstName;
  String? farmeremail;
  String? farmerphoneno;
  String? farmerpassword;
  String? farmerPhotoURL;

  FarmerModel(
      {this.fuid,
      this.farmeremail,
      this.farmerfirstName,
      this.farmerphoneno,
      this.farmerpassword,
      this.farmerPhotoURL});

  // receiving data from server
  factory FarmerModel.fromMap(map) {
    return FarmerModel(
      fuid: map['fuid'],
      farmerfirstName: map['farmerfirstName'],
      farmeremail: map['farmeremail'],
      farmerphoneno: map['farmerphoneno'],
      farmerpassword: map['farmerpassword'],
      farmerPhotoURL: map['farmerPhotoURL'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'fuid': fuid,
      'farmerfirstName': farmerfirstName,
      'farmeremail': farmeremail,
      'farmerphoneno': farmerphoneno,
      'farmerpassword': farmerpassword,
      'farmerPhotoURL': farmerPhotoURL,
    };
  }
}
