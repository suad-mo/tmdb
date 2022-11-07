import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final int? height;
  final int? width;
  final double? aspectRatio;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;

  const ImageEntity({
    this.height,
    this.width,
    this.aspectRatio,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object?> get props => [
        height,
        width,
        aspectRatio,
        iso6391,
        filePath,
        voteAverage,
        voteCount,
      ];
}
