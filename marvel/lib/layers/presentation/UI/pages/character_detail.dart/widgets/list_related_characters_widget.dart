import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marvel/layers/data/DTOs/character/character_dto.dart';
import 'package:marvel/layers/domain/entities/character_entity.dart';

class ListRelatedCharactersWidget extends StatefulWidget {
  CharacterDto? character;
  ListRelatedCharactersWidget({Key? key, required this.character})
      : super(key: key);

  @override
  State<ListRelatedCharactersWidget> createState() =>
      _ListRelatedCharactersWidgetState();
}

class _ListRelatedCharactersWidgetState
    extends State<ListRelatedCharactersWidget> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.character?.comics?.items?.length,
          itemBuilder: (context, index) {
          ComicsItem item = widget.character!.comics!.items![index];
            return Container(
              child: InkWell(
                onTap: () {
                 // _contro
                },
                child: Text('${ item.name}')),
            );
          }),
    );
  }
}
