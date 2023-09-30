// ignore_for_file: public_member_api_docs, sort_constructors_first
class SectionDetailModel {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;
  SectionDetailModel({
    this.sectionId,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  SectionDetailModel.fromJson(Map<String, dynamic> json) {
    sectionId = json['section_id'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }
}
