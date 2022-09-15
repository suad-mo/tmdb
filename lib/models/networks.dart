class Networks {
  int? id;
  String? name;
  String? logoPath;
  String? originCountry;

  Networks({this.id, this.name, this.logoPath, this.originCountry});

  Networks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo_path'] = logoPath;
    data['origin_country'] = originCountry;
    return data;
  }
}
