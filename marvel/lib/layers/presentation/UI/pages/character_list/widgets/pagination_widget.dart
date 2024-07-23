import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../../../inject/inject.dart';
import '../../../../controllers/character_list_page_controller.dart';

class PaginationWidget extends StatefulWidget {

  ValueChanged<int> onPageSelected;

  PaginationWidget({ required this.onPageSelected});

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  int _selectedPage = 1;
    final CharacterListPageController _controller =
      Get.put(getIt.get<CharacterListPageController>());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 6, top: 6),
      decoration: BoxDecoration(color: Colors.transparent),
      child:GetBuilder<CharacterListPageController>(
            builder: (_) {
          return ListView.builder(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            itemCount: _controller.totalPages,
            itemBuilder: (context, index) {
              int pageNumber = index + 1;
              print( _controller.totalPages);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPage = pageNumber;
                  });
                  widget.onPageSelected(pageNumber);
                },
                child: Container(
                  width: 50,
                  margin: index == 0
                      ? EdgeInsets.only(left: 10)
                      : EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: _selectedPage == pageNumber ? Color(0xFF16202a) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 218, 216, 216), width: 1),
                  ),
                  child: Text(
                    '$pageNumber',
                    style: TextStyle(
                      color:
                          _selectedPage == pageNumber ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
