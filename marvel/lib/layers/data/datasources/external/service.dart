import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel/layers/data/DTOs/character/character_dto.dart';
import 'package:marvel/layers/data/DTOs/character/list_character_dto.dart';

class Service {
  static String publicKey = 'e82ce8b67a38ff134134a96b5d7cce09';
  static String privateKey = '0d56425f3aebd863237a6ee79628c2c7f580e0ea';
  static String baseUrl = "http://gateway.marvel.com/v1/public";
  static int maxCharacters = 1500;

  Future<ListCharacterDTO?> getCharacterList({required int page}) async {
    //rules to validate the request
    int limit = 10;
    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = createHash(timeStamp);
    int offset = limit * page;
    
    // remover esse trecho quando arrumarem o erro na página 1  
    if (page == 1) {
      offset = 20;
    }
    ///

    final String urlAPI =
        "${baseUrl}/characters?limit=${limit}&offset=${offset}&ts=$timeStamp&apikey=$publicKey&hash=$hash";

    try {
      final Dio dio = Dio();
      final Response response = await dio.get(urlAPI,
          options: Options(receiveTimeout: 60 * 1000 // 60 seconds
              ));

      if (response.statusCode == 200) {
        final data = (response.data['data']['results'] as List)
            .map((e) => CharacterDto.fromJson(e))
            .toList();

        return ListCharacterDTO(
            offset: response.data['data']['offset'],
            limit: response.data['data']['limit'],
            total: response.data['data']['total'],
            count: response.data['data']['count'],
            results: data);
      } else {
        print('Erro na chamada da API: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Erro na chamada da API: $e');
      return null;
    }
  }

  String createHash(String timeStamp) {
    final String toHash = timeStamp + privateKey + publicKey;
    final List<int> bytes = utf8.encode(toHash);
    return md5.convert(bytes).toString();
  }
}
