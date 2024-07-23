import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../data/DTOs/character/character_dto.dart';

class ListComicsCharacterWidget extends StatefulWidget {
  CharacterDto? character;
  ListComicsCharacterWidget({Key? key, required this.character})
      : super(key: key);

  @override
  State<ListComicsCharacterWidget> createState() =>
      _ListComicsCharacterWidgetState();
}

class _ListComicsCharacterWidgetState extends State<ListComicsCharacterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Comics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
              height: 450,
              child: ListView.builder(
                itemCount: widget.character?.comics?.items?.length,
                itemBuilder: ((context, index) {
                  ComicsItem item = widget.character!.comics!.items![index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text('${item.name}')),
                    ),
                  );
                }),
              )),
        ],
      ),
    );
  }
}
