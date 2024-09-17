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
  TextEditingController nameForSearch = TextEditingController();
  List<CharacterDto> charactersFound = [];

  List<CharacterDto> filterList() { 
    List<CharacterDto> filteredList =
        caracterList.where((hero) => hero.name!.contains(nameForSearch.text)).toList();
    return filteredList;
  }




  Future<void> getAllCharacters() async {
    final request = await _getAllCharacters(page: page);
    caracterList.addAll(request ?? []);
    update();
  }
}
