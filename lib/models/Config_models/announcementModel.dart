class AnnouncementModel {
  String? announcement;
  String? color;
  String? status;
  String? text_color;

  AnnouncementModel(
      {this.announcement, this.color, this.status, this.text_color});

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
        status: json['status'],
        text_color: json['text_color'],
        color: json['color'],
        announcement: json['announcement']);
  }
}
