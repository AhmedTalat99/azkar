import 'dart:convert';

import 'package:azkar/const.dart';
import 'package:azkar/models/section_detail_model.dart';
import 'package:flutter/material.dart';

class SectionDetailView extends StatefulWidget {
  const SectionDetailView({super.key, required this.id, required this.title});
  final int id;
  final String title;
  @override
  State<SectionDetailView> createState() => _SectionDetailViewState();
}

class _SectionDetailViewState extends State<SectionDetailView> {
  List<SectionDetailModel> sectionDetails = [];
  @override
  void initState() {
    super.initState();
    loadingSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: g,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
            child: ListTile(
              title: Text("${sectionDetails[index].content}",
                  textDirection: TextDirection.rtl),
              subtitle: Text(
                "${sectionDetails[index].reference}",
                textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Colors.grey.withOpacity(0.8),
        ),
        itemCount: sectionDetails.length,
      ),
    );
  }

  loadingSections() {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString('assets/database/section_details_db.json')
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel _sectionDetail =
            SectionDetailModel.fromJson(section);
        if (_sectionDetail.sectionId == widget.id)
          sectionDetails.add(_sectionDetail);
      });
      setState(() {});
    }).catchError(
      (e) {
        print(e);
      },
    );
  }
}
