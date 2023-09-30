import 'dart:convert';

import 'package:azkar/const.dart';
import 'package:azkar/models/section_model.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_azkar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<SectionModel> sections = [];
  @override
  void initState() {
    super.initState();
    loadingSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: g,
        title: const Text(
          'أذكار المسلم',
          style: TextStyle(color: w, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return CustomAzkar(model: sections[index]);
          },
        ),
      ),
    );
  }

   loadingSections() {
    DefaultAssetBundle.of(context)
        .loadString('assets/database/sections_db.json')
        .then((data) {
      var response = json.decode(data);
      response.forEach((section){
        SectionModel sectionModel = SectionModel.fromJson(section);
        sections.add(sectionModel);
      });
             setState(() {
          
        });
    }).catchError(
      (e) {
        print(e);
      },
    );
  }
}
