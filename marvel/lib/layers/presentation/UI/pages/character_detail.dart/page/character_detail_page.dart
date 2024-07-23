import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marvel/layers/domain/entities/character_entity.dart';

import '../../../../../data/DTOs/character/character_dto.dart';
import '../widgets/list_comics_character_widget.dart';
import '../widgets/list_related_characters_widget.dart';

class CharacterDetailPage extends StatefulWidget {
  CharacterDto? character;
  static const String ROUTE = "/character-detail-page";
  CharacterDetailPage({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: [
                //image
                //name
                //related characters

                Column(
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
                              "${widget.character?.thumbnail?.path}.${widget.character?.thumbnail?.extension}",
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
                              child: Text("${widget.character?.name}",
                                  style: const TextStyle(color: Colors.white))),
                        ),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${widget.character?.description == "" ? "Description not found" : widget.character?.description}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ListComicsCharacterWidget(character: widget.character!)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
