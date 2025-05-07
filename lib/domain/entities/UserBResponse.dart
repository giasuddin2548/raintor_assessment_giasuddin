class UserBResponse {
  UserBResponse({
      this.lat, 
      this.lon,});

  UserBResponse.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
  }
  double? lat;
  double? lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }

}