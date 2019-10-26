class Sponsor implements Comparable<Sponsor> {
  String sponsorId;
  String sponsorImage;
  String sponsorGrade;
  String sponsorType;

  Sponsor({
    this.sponsorId,
    this.sponsorImage,
    this.sponsorGrade,
    this.sponsorType,
  });


  factory Sponsor.fromMap(Map data) {
    data = data ?? {};
    return Sponsor(
      sponsorId: data['sponsor_id'] ?? '',
      sponsorImage: data['sponsor_image'] ?? '',
      sponsorGrade: data['sponsor_grade'] ?? '',
      sponsorType: data['sponsor_type'] ?? '',
    );
  }

   @override
  int compareTo(Sponsor other) => sponsorId.compareTo(other.sponsorId);
  }



