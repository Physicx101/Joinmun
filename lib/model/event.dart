class EventsData {
  List<Event> events;

  EventsData({this.events});

  EventsData.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = new List<Event>();
      json['events'].forEach((v) {
        events.add(Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  String eventImage;
  String eventTitle;
  String eventDate;
  String eventPlace;
  String eventDresscode;
  String eventFloorplanA;
  String eventFloorplanB;
  String eventDescription;

  Event(
      {this.eventImage,
      this.eventTitle,
      this.eventDate,
      this.eventPlace,
      this.eventDresscode,
      this.eventFloorplanA,
      this.eventFloorplanB,
      this.eventDescription});

  factory Event.fromMap(Map data) {
    data = data ?? {};
    return Event(
      eventImage: data['event_image'] ?? '',
      eventTitle: data['event_title'] ?? '',
      eventDate: data['event_date'] ?? '',
      eventPlace: data['event_place'] ?? '',
      eventDresscode: data['event_dresscode'] ?? '',
      eventFloorplanA: data['event_floorplan_a'] ?? '',
      eventFloorplanB: data['event_floorplan_b'] ?? '',
      eventDescription: data['event_description'] ?? '',
    );
  }

  Event.fromJson(Map<String, dynamic> json) {
    eventImage = json['event_image'];
    eventTitle = json['event_title'];
    eventDate = json['event_date'];
    eventPlace = json['event_place'];
    eventDresscode = json['event_dresscode'];
    eventFloorplanA = json['event_floorplan_a'];
    eventFloorplanB = json['event_floorplan_b'];
    eventDescription = json['event_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_image'] = this.eventImage;
    data['event_title'] = this.eventTitle;
    data['event_date'] = this.eventDate;
    data['event_place'] = this.eventPlace;
    data['event_dresscode'] = this.eventDresscode;
    data['event_floorplan_a'] = this.eventFloorplanA;
    data['event_floorplan_b'] = this.eventFloorplanB;
    data['event_description'] = this.eventDescription;
    return data;
  }
}
