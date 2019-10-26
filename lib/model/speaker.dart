class SpeakersData {
  List<Speaker> speakers;

  SpeakersData({this.speakers});

  SpeakersData.fromJson(Map<String, dynamic> json) {
    if (json['speakers'] != null) {
      speakers = new List<Speaker>();
      json['speakers'].forEach((v) {
        speakers.add(Speaker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.speakers != null) {
      data['speakers'] = this.speakers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Speaker {
  String speakerName;
  String speakerDesc;
  String speakerTitle;
  String speakerImage;

  Speaker(
      {this.speakerName,
      this.speakerDesc,
      this.speakerTitle,
      this.speakerImage});

  factory Speaker.fromMap(Map data) {
    data = data ?? {};
    return Speaker(
      speakerName: data['speaker_name'] ?? '',
      speakerDesc: data['speaker_desc'] ?? '',
      speakerTitle: data['speaker_title'] ?? '',
      speakerImage: data['speaker_image'] ?? '',
    );
  }

  Speaker.fromJson(Map<String, dynamic> json) {
    speakerName = json['speaker_name'];
    speakerDesc = json['speaker_desc'];
    speakerTitle = json['speaker_title'];
    speakerImage = json['speaker_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speaker_name'] = this.speakerName;
    data['speaker_desc'] = this.speakerDesc;
    data['speaker_title'] = this.speakerTitle;
    data['speaker_image'] = this.speakerImage;
    return data;
  }
}
