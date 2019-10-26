class Place implements Comparable<Place> {
  String placeName;
  String placeDesc;
  String placeImage;
  String placeType;

  Place({
    this.placeName,
    this.placeDesc,
    this.placeImage,
    this.placeType,
  });


  factory Place.fromMap(Map data) {
    data = data ?? {};
    return Place(
      placeName: data['place_name'] ?? '',
      placeDesc: data['place_desc'] ?? '',
      placeImage: data['place_image'] ?? '',
      placeType: data['place_type'] ?? '',
    );
  }

   @override
  int compareTo(Place other) => placeType.compareTo(other.placeType);
  }



