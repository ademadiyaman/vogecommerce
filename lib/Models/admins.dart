class Admins {
  final String adminID;
  String adminEmail;
  String? adminPhoto;
  Admins({required this.adminEmail, required this.adminID});
  Map<String, dynamic> toMap() {
    return {
      'adminID': adminID,
      'adminEmail': adminEmail,
      'adminPhoto': adminPhoto,
    };
  }

  Admins.fromMap(Map<String, dynamic> map)
      : adminID = map['adminID'],
        adminEmail = map['adminEmail'],
        adminPhoto = map['adminPhoto'];
  Admins.idveResim({
    required this.adminID,
    required this.adminEmail,
  });

  @override
  String toString() {
    // TODO: implement toString
    return 'Admins{adminID: $adminID, adminEmail: $adminEmail, adminPhoto: $adminPhoto}';
  }
}
