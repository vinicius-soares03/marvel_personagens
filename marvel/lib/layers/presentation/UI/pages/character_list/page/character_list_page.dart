// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/inject/inject.dart';
import 'package:marvel/layers/presentation/UI/pages/character_list/widgets/list_characters_widget.dart';

import '../../../../controllers/character_list_page_controller.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);
  static const String ROUTE = "/character-list-page";

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final CharacterListPageController _controller =
      Get.put(getIt.get<CharacterListPageController>());

  @override
  void initState() {
    _controller.getAllCharacters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF16202a),
        leading: Container(
          padding: const EdgeInsets.only(left: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //     height: 40,
              //     width: 40,
              //     child: Image.asset('assets/icons/user-icon.png'))
            ],
          ),
        ),
        title: const Text('Marvel Characters'),
        actions: [
          // Container(
          //   padding: const EdgeInsets.only(right: 16),
          //   child: IconButton(
          //       onPressed: () {
          //       //  _bloc!.reloadPostList();
          //       },
          //       icon: Icon(FontAwesomeIcons.arrowRotateLeft)),
          // )
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: GetBuilder<CharacterListPageController>(
            builder: (_) {
              return Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 35,
                        // margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: _controller.nameForSearch,
                          cursorColor: Colors.transparent,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search a hero...",
                            contentPadding: EdgeInsets.only(left: 8),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                          onChanged: (_) {
                           
                            _controller.filterList();
                          },
                        ),
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      child: _controller.processing == true
                          ? Center(child: CircularProgressIndicator())
                          : ListCharactersWidget()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
