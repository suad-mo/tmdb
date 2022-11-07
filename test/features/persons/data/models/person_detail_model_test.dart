import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb/core/data/models/image_model.dart';
import 'package:tmdb/features/person/data/models/person_detail_model.dart';
import 'package:tmdb/features/person/domain/entities/person_detail_entyty.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tPersonDetailModel = PersonDetailModel(
    id: 18918,
    name: 'Dwayne Johnson',
    profilePath: '/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg',
    imageProfileModels: const <ImageModel>[
      ImageModel(
        height: 1000,
        width: 667,
        aspectRatio: 0.667,
        iso6391: null,
        filePath: '/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg',
        voteAverage: 5.594,
        voteCount: 40,
      ),
    ],
    knownForDepartment: 'Acting',
    biography: 'An American and Canadian actor, producer',
    birthday: DateTime.tryParse('1972-05-02'),
    deathday: null,
    placeOfBirth: 'Hayward, California, USA',
    alsoKnownAs: const <String>[
      "The Rock",
      "Rocky Maivia",
      "The Brahma Bull",
      "The Corporate Champion",
    ],
    popularity: 54.015,
    adult: false,
    gender: 2,
    homepage: 'https://www.wwe.com/superstars/the-rock',
    imdbId: 'nm0425005',
  );

  test(
    'shud be a subclass of PersonDetailEntity',
    () async {
      //assert
      expect(tPersonDetailModel, isA<PersonDetailEntity>());
    },
  );

  group('fromJson', () {
    test(
      'shud return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('person_details.json'));
        // act
        final result = PersonDetailModel.fromJson(jsonMap);
        // assert
        expect(result, equals(tPersonDetailModel));
      },
    );

    test(
      'shud return a valid model when the JSON number is an double',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('person_details_double.json'));
        // act
        final result = PersonDetailModel.fromJson(jsonMap);
        // assert
        expect(result, equals(tPersonDetailModel));
      },
    );
  });

  group('toJson', () {
    test('shuld return a JSON map contaning the proper data', () async {
      //act
      final result = tPersonDetailModel.toJson();
      // assert
      final expectedJson = {
        "adult": false,
        "also_known_as": [
          "The Rock",
          "Rocky Maivia",
          "The Brahma Bull",
          "The Corporate Champion"
        ],
        "biography": "An American and Canadian actor, producer",
        "birthday": "1972-05-02",
        "deathday": null,
        "gender": 2,
        "homepage": "https://www.wwe.com/superstars/the-rock",
        "id": 18918,
        "imdb_id": "nm0425005",
        "known_for_department": "Acting",
        "name": "Dwayne Johnson",
        "place_of_birth": "Hayward, California, USA",
        "popularity": 54.015,
        "profile_path": "/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg",
        "images": {
          "profiles": [
            {
              "aspect_ratio": 0.667,
              "height": 1000,
              "iso_639_1": null,
              "file_path": "/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg",
              "vote_average": 5.594,
              "vote_count": 40,
              "width": 667
            }
          ]
        }
      };
      expect(result, expectedJson);
    });
  });
}
