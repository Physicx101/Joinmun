class MerchData {
  List<Merch> merch;

  MerchData({this.merch});

  MerchData.fromJson(Map<String, dynamic> json) {
    if (json['merch'] != null) {
      merch = new List<Merch>();
      json['merch'].forEach((v) {
        merch.add(Merch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.merch != null) {
      data['merch'] = this.merch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Merch {
  String merchId;
  String merchName;
  String merchImage;
  String merchPrice;

  Merch({this.merchId, this.merchName, this.merchImage, this.merchPrice});

  Merch.fromJson(Map<String, dynamic> json) {
    merchId = json['merch_id'];
    merchName = json['merch_name'];
    merchImage = json['merch_image'];
    merchPrice = json['merch_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merch_id'] = this.merchId;
    data['merch_name'] = this.merchName;
    data['merch_image'] = this.merchImage;
    data['merch_price'] = this.merchPrice;
    return data;
  }
}


