class ChairsData {
  List<Chair> chairs;

  ChairsData({this.chairs});

  ChairsData.fromJson(Map<String, dynamic> json) {
    if (json['chairs'] != null) {
      chairs = new List<Chair>();
      json['chairs'].forEach((v) {
        chairs.add(Chair.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chairs != null) {
      data['chairs'] = this.chairs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chair implements Comparable<Chair> {
  String chairId;
  String chairName;
  String chairInstitute;
  String chairGroup;
  String chairImage;
  String chairBio;

  Chair(
      {this.chairId,
      this.chairName,
      this.chairInstitute,
      this.chairGroup,
      this.chairImage,
      this.chairBio});

  factory Chair.fromMap(Map data) {
    data = data ?? {};
    return Chair(
      chairId: data['chair_id'] ?? '',
      chairName: data['chair_name'] ?? '',
      chairInstitute: data['chair_institute'] ?? '',
      chairGroup: data['chair_group'] ?? '',
      chairImage: data['chair_image'] ?? '',
      chairBio: data['chair_bio'] ?? '',
    );
  }

  Chair.fromJson(Map<String, dynamic> json) {
    chairId = json['chair_id'];
    chairName = json['chair_name'];
    chairInstitute = json['chair_institute'];
    chairGroup = json['chair_group'];
    chairImage = json['chair_image'];
    chairBio = json['chair_bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chair_id'] = this.chairId;
    data['chair_name'] = this.chairName;
    data['chair_institute'] = this.chairInstitute;
    data['chair_group'] = this.chairGroup;
    data['chair_image'] = this.chairImage;
    data['chair_bio'] = this.chairBio;
    return data;
  }

  @override
  int compareTo(Chair other) => chairGroup.compareTo(other.chairGroup);
}
