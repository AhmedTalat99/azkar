import 'package:azkar/const.dart';
import 'package:azkar/models/section_model.dart';
import 'package:azkar/views/section_detail_view.dart';
import 'package:flutter/material.dart';

class CustomAzkar extends StatelessWidget {
  const CustomAzkar({super.key, required this.model});
  final SectionModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return  SectionDetailView(id: model.id!,title: model.name!);
          }));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: g,
              gradient: const LinearGradient(
                colors: [
                  Colors.lightGreenAccent,
                  Colors.green,
                  Colors.lightGreen
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
          width: MediaQuery.of(context).size.width,
          height: 100,
          // color: g,
          child: Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Text(
              model.name!,
              style: const TextStyle(color: w, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
