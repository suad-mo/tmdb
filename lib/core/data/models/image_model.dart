import '../../domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    super.height,
    super.width,
    super.aspectRatio,
    super.iso6391,
    super.filePath,
    super.voteAverage,
    super.voteCount,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      height: (json['height'] as num).toInt(),
      width: json['width'] as int?,
      aspectRatio: json['aspect_ratio'] as double?,
      iso6391: json['iso_639_1'] as String?,
      filePath: json['file_path'] as String?,
      voteAverage: (json['vote_average'] as num?) != null
          ? (json['vote_average'] as num).toDouble()
          : null,
      voteCount: json['vote_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['height'] = height;
    data['width'] = width;
    data['aspect_ratio'] = aspectRatio;
    data['iso_639_1'] = iso6391;
    data['file_path'] = filePath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;

    return data;
  }
}
