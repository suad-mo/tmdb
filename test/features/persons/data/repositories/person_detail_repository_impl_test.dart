import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:tmdb/core/zz.dart';

import 'package:tmdb/core/data/models/image_model.dart';
import 'package:tmdb/features/person/data/data_sources/remote_data_source.dart/person_detail_remote_data_source.dart';
import 'package:tmdb/features/person/data/models/person_detail_model.dart';
import 'package:tmdb/features/person/data/repositories/person_detail_repository_impl.dart';
import 'package:tmdb/features/person/domain/entities/person_detail_entyty.dart';

class MockPersonDetailDataSource extends Mock
    implements PersonDetailRemoteDataSource {}

void main() {
  late PersonDetailRepositoryImpl repo;
  late MockPersonDetailDataSource mockPersonDetailDataSource;

  setUp((() {
    mockPersonDetailDataSource = MockPersonDetailDataSource();
    repo = PersonDetailRepositoryImpl(
        personDetailRemoteDataSource: mockPersonDetailDataSource);
  }));
  group('getPersonDetail', () {
    const tId = 4068;
    final tPersonDetailModel = PersonDetailModel(
      id: 4068,
      name: 'Gary Cooper',
      profilePath: '/67svKX2KuFwwBvrijIb7bBtBgIM.jpg',
      knownForDepartment: 'Acting',
      biography:
          "Gary Cooper (May 7, 1901- May 13, 1961) was an American film actor known for his natural, authentic, and understated acting style and screen performances.  His career spanned thirty-six years, from 1925 to 1961, and included leading roles in eighty-four feature films. He was a major movie star from the end of the silent film era through to the end of the golden age of Classical Hollywood.  His screen persona appealed strongly to both men and women, and his range of performances included roles in most major movie genres. Cooper's ability to project his own personality onto the characters he played contributed to his natural and authentic appearance on screen. Throughout his career, he sustained a screen persona that represented the ideal American hero.",
      birthday: DateTime(1901, 5, 7), // DateTime.tryParse('1901-05-07'),
      deathday: DateTime(1961, 5, 13), //.tryParse('1961-05-13'),
      placeOfBirth: '',
      alsoKnownAs: const [
        "Coop",
        "Garry Cooper",
        "Frank James Cooper",
        "Frank J. Cooper",
        "Cowboy Cooper",
        "The Montana Mule",
        "Studs",
        "Гэри Купер"
      ],
      popularity: 7.537,
      adult: false,
      gender: 2,
      homepage: null,
      imdbId: 'nm0000011',
      imageProfileModels: const <ImageModel>[
        ImageModel(
            aspectRatio: 0.667,
            height: 1572,
            iso6391: null,
            filePath: '/67svKX2KuFwwBvrijIb7bBtBgIM.jpg',
            voteAverage: 5.246,
            voteCount: 2,
            width: 1048),
        ImageModel(
            aspectRatio: 0.666,
            height: 1919,
            iso6391: null,
            filePath: '/avkDcFZdU8tm6cedB1U587JRKJE.jpg',
            voteAverage: 5.106,
            voteCount: 2,
            width: 1279),
        ImageModel(
            aspectRatio: 0.667,
            height: 1707,
            iso6391: null,
            filePath: '/gwQmqyLIZRgTu04k1dddKquUowj.jpg',
            voteAverage: 0.0,
            voteCount: 0,
            width: 1138),
      ],
    );
    final PersonDetailEntity tPersonDetailEntity = tPersonDetailModel;

    test(
      'should return remote data the call to remote data source is success',
      () async {
        // arrange
        // when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
        //     .thenAnswer((_) async => tNumberTriviaModel);
        when(() => mockPersonDetailDataSource.getPersonDetailsById(tId))
            .thenAnswer((_) async => tPersonDetailModel);
        // act
        final result = await repo
            .getPersonDetail(tId); //.getConcreteNumberTrivia(tNumber);
        // assert
        verify(() => mockPersonDetailDataSource
            .getPersonDetailsById(tId)); //.getConcreteNumberTrivia(tNumber));
        expect(result, equals(Right(tPersonDetailEntity)));
      },
    );
  });
}
