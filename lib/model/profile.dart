class UserProfile {
  String id= '';
  String email= '';
  String username= '';
  String fullName= '';
  String avatar= '';
  String personId= '';
  String fcmToken= '';
  String covid19SelfIsolation= '';
  String covid19Rdt= '';
  String defaultHospitalId= '';
  String lastLoginAt= '';
  String emailActivatedAt= '';
  String createdAt= '';
  String updatedAt= '';

  UserProfile(
      {required this.id,
      required this.email,
      required this.username,
      required this.fullName,
      this.avatar ="null",
      this.personId ="null",
      this.fcmToken="null",
      this.covid19SelfIsolation="null",
      this.covid19Rdt="null",
      this.defaultHospitalId="null",
      required this.lastLoginAt,
      this.emailActivatedAt="null",
      required this.createdAt,
      required this.updatedAt});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    fullName = json['full_name'];
    avatar = json['avatar'];
    personId = json['person_id'];
    fcmToken = json['fcm_token'];
    covid19SelfIsolation = json['covid19_self_isolation'];
    covid19Rdt = json['covid19_rdt'];
    defaultHospitalId = json['default_hospital_id'];
    lastLoginAt = json['last_login_at'];
    emailActivatedAt = json['email_activated_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['avatar'] = this.avatar;
    data['person_id'] = this.personId;
    data['fcm_token'] = this.fcmToken;
    data['covid19_self_isolation'] = this.covid19SelfIsolation;
    data['covid19_rdt'] = this.covid19Rdt;
    data['default_hospital_id'] = this.defaultHospitalId;
    data['last_login_at'] = this.lastLoginAt;
    data['email_activated_at'] = this.emailActivatedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
