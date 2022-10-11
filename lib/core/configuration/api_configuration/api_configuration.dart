class ApiConfiguration {
  ApiConfiguration({
    required this.imagesProps,
    required this.changeKeys,
  });

  late final ImagesProps imagesProps;
  late final List<String> changeKeys;

  ApiConfiguration.fromJson(Map<String, dynamic> json) {
    imagesProps = ImagesProps.fromJson(json['images']);
    changeKeys = List.castFrom<dynamic, String>(json['change_keys']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['images'] = imagesProps.toJson();
    data['change_keys'] = changeKeys;
    return data;
  }
}

class ImagesProps {
  ImagesProps({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });

  late final String baseUrl;
  late final String secureBaseUrl;
  late final List<String> backdropSizes;
  late final List<String> logoSizes;
  late final List<String> posterSizes;
  late final List<String> profileSizes;
  late final List<String> stillSizes;

  ImagesProps.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    secureBaseUrl = json['secure_base_url'];
    backdropSizes = List.castFrom<dynamic, String>(json['backdrop_sizes']);
    logoSizes = List.castFrom<dynamic, String>(json['logo_sizes']);
    posterSizes = List.castFrom<dynamic, String>(json['poster_sizes']);
    profileSizes = List.castFrom<dynamic, String>(json['profile_sizes']);
    stillSizes = List.castFrom<dynamic, String>(json['still_sizes']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['base_url'] = baseUrl;
    data['secure_base_url'] = secureBaseUrl;
    data['backdrop_sizes'] = backdropSizes;
    data['logo_sizes'] = logoSizes;
    data['poster_sizes'] = posterSizes;
    data['profile_sizes'] = profileSizes;
    data['still_sizes'] = stillSizes;
    return data;
  }
}
