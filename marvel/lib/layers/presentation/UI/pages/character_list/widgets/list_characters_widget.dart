// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:marvel/layers/data/DTOs/character/character_dto.dart';
import 'package:marvel/layers/domain/entities/character_entity.dart';
import 'package:marvel/layers/presentation/UI/pages/character_detail.dart/page/character_detail_page.dart';

import '../../../../../../inject/inject.dart';
import '../../../../controllers/character_list_page_controller.dart';

class ListCharactersWidget extends StatefulWidget {
  const ListCharactersWidget({Key? key}) : super(key: key);

  @override
  State<ListCharactersWidget> createState() => _ListCharactersWidgetState();
}

class _ListCharactersWidgetState extends State<ListCharactersWidget> {
  final CharacterListPageController _controller =
      Get.find<CharacterListPageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          controller: ScrollController(),
          itemCount: _controller.filterList().length,
          itemBuilder: (context, index) {
            CharacterDto item = _controller.filterList()[index];
            //String iconPath = _bloc!.getRandomUserIcon();
            return Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetailPage(character: item),
                    ),
                  );

                },
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 0),
                      padding: EdgeInsets.zero,
                      child: Stack(children: [
                        Card(
                          //semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,

                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Image.network(
                              "${item.thumbnail?.path}.${item.thumbnail?.extension}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 32, top: 32),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Text("${item.name}",
                                  style: const TextStyle(color: Colors.white))),
                        ),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${item.description == "" ? "Description not found" : item.description}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
