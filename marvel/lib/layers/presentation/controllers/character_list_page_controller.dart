import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marvel/inject/inject.dart';
import 'package:marvel/layers/data/DTOs/character/character_dto.dart';
import 'package:marvel/layers/data/character_repository_impl.dart';
import 'package:marvel/layers/data/datasources/external/service.dart';
import 'package:marvel/layers/data/datasources/local/local_storage.dart';
import 'package:marvel/layers/domain/repositories/character_repository.dart';
import 'package:marvel/layers/domain/usecases/get_all_characters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/character_entity.dart';

class CharacterListPageController extends GetxController {
  CharacterListPageController({
    required GetAllCharacters getAllCharacters,
  }) : _getAllCharacters = getAllCharacters;

  final GetAllCharacters _getAllCharacters;

  List<CharacterDto> caracterList = [];
  bool processing = false;
  int page = 1;
  int? totalCharacters = 0;
  int limitPage = 10;
  int? totalPages = 10;

  TextEditingController nameForSearch = TextEditingController();
  List<CharacterDto> charactersFound = [];

  List<CharacterDto> filterList() {
    List<CharacterDto> filteredList = caracterList
        .where((hero) => hero.name!.toLowerCase().contains(nameForSearch.text.toLowerCase()))
        .toList();
    return filteredList;
  }

  Future<void> getAllCharacters() async {
    processing = true;
    caracterList.clear();
    update();
    final request = await _getAllCharacters(page: page);
    if (request != null && request.results!.isNotEmpty) {
      totalCharacters = request.total ?? 0;
      totalPages = (totalCharacters! / limitPage).ceil();
    }
    processing = false;
    caracterList.addAll(request?.results ?? []);
    update();
  }
}
