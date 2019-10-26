class SchedulesData {
  List<Schedule> schedules;

  SchedulesData({this.schedules});

  SchedulesData.fromJson(Map<String, dynamic> json) {
    if (json['schedules'] != null) {
      schedules = new List<Schedule>();
      json['schedules'].forEach((v) {
        schedules.add(Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedules != null) {
      data['schedules'] = this.schedules.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule implements Comparable<Schedule> {
  String scheduleId;
  String scheduleStartTime;
  String scheduleEndTime;
  String scheduleTitle;
  String schedulePlace;
  String scheduleDay;

  Schedule(
      {this.scheduleId,
      this.scheduleStartTime,
      this.scheduleEndTime,
      this.scheduleTitle,
      this.schedulePlace,
      this.scheduleDay});

  factory Schedule.fromMap(Map data) {
    data = data ?? {};
    return Schedule(
      scheduleId: data['schedule_id'] ?? '',
      scheduleStartTime: data['schedule_start_time'] ?? '',
      scheduleEndTime: data['schedule_end_time'] ?? '',
      scheduleTitle: data['schedule_title'] ?? '',
      schedulePlace: data['schedule_place'] ?? '',
      scheduleDay: data['schedule_day'] ?? '',
    );
  }

  Schedule.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    scheduleStartTime = json['schedule_start_time'];
    scheduleEndTime = json['schedule_end_time'];
    scheduleTitle = json['schedule_title'];
    schedulePlace = json['schedule_place'];
    scheduleDay = json['schedule_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_id'] = this.scheduleId;
    data['schedule_start_time'] = this.scheduleStartTime;
    data['schedule_end_time'] = this.scheduleEndTime;
    data['schedule_title'] = this.scheduleTitle;
    data['schedule_place'] = this.schedulePlace;
    data['schedule_day'] = this.scheduleDay;
    return data;
  }

  @override
  int compareTo(Schedule other) => scheduleDay.compareTo(other.scheduleDay);
}
