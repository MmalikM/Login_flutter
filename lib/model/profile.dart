class UserProfile {
  String id= '';
  String email= '';
  String username= '';
  String fullName= '';
  Null avatar;
  Null personId;
  Null fcmToken;
  Null covid19SelfIsolation;
  Null covid19Rdt;
  Null defaultHospitalId;
  String lastLoginAt='';
  Null emailActivatedAt;
  String createdAt= '';
  String updatedAt= '';

  UserProfile(
      {required this.id,
      required this.email,
      required this.username,
      required this.fullName,
      this.avatar ,
      this.personId ,
      this.fcmToken,
      this.covid19SelfIsolation,
      this.covid19Rdt,
      this.defaultHospitalId,
      required this.lastLoginAt,
      this.emailActivatedAt,
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
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['full_name'] = fullName;
    data['avatar'] = avatar;
    data['person_id'] = personId;
    data['fcm_token'] = fcmToken;
    data['covid19_self_isolation'] = covid19SelfIsolation;
    data['covid19_rdt'] = covid19Rdt;
    data['default_hospital_id'] = defaultHospitalId;
    data['last_login_at'] = lastLoginAt;
    data['email_activated_at'] = emailActivatedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
