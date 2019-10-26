import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joinmun_2019/model/chair.dart';
import 'package:joinmun_2019/model/event.dart';
import 'package:joinmun_2019/model/merch.dart';
import 'package:joinmun_2019/model/place.dart';
import 'package:joinmun_2019/model/schedule.dart';
import 'package:joinmun_2019/model/speaker.dart';
import 'package:joinmun_2019/network/i_client.dart';
import 'package:joinmun_2019/network/rest_client.dart';
import 'package:joinmun_2019/utils/dependency_injection.dart';
import 'package:joinmun_2019/utils/joinmun.dart';

abstract class IHomeProvider {
  Future<Stream<QuerySnapshot>> getSponsors();
  Future<Stream<QuerySnapshot>> getSpeakers();
  Future<MerchData> getMerch();
  Future<Stream<QuerySnapshot>> getEvents();
  Future<Stream<QuerySnapshot>> getSchedules();
  Future<Stream<QuerySnapshot>> getPlaces();
  Future<Stream<QuerySnapshot>> getChairs();
  Future<Stream<QuerySnapshot>> getJointimes();
  Future<Stream<QuerySnapshot>> getContacts();
}

class HomeProvider implements IHomeProvider {
  IClient _client, _restClient;

  static final String kConstGetSchedulesRef = "schedules";
  static final String kConstGetSpeakersRef = "speakers";
  static final String kConstGetPlacesRef = "places";
  static final String kConstGetChairsRef = "chairs";
  static final String kConstGetJointimesRef = "post";
  static final String kConstGetContactsRef = "contacts";
  static final String kConstGetEventsRef = "events";
  static final String kConstGetSponsorsRef = "sponsors";

  static final String kConstGetPostsUrl =
      "https://jogjainternationalmun.herokuapp.com/post/all";

  static final String kConstGetSpeakersUrl =
      "${Joinmun.baseUrl}/speaker-kol.json";

  //! Not Working
  static final String kConstGetSessionsUrl =
      "${Joinmun.baseUrl}/session-kol.json";

  //! Not Working
  static final String kConstGetTeamsUrl = "${Joinmun.baseUrl}/team-kol.json";

  static final String kConstGetScheduleURL =
      "${Joinmun.baseUrl}/schedule-kol.json";

  static final String kConstGetMerchURL = "${Joinmun.baseUrl}/merch-kol.json";

  static final String kConstGetEventsURL = "events";

  HomeProvider() {
    _client = Injector().currentClient;
    _restClient = RestClient();
  }

  @override
  Future<Stream<QuerySnapshot>> getSpeakers() async {
    var result = await _client.getAsync(kConstGetSpeakersRef);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<MerchData> getMerch() async {
    var result = await _client.getAsync(kConstGetMerchURL);
    if (result.networkServiceResponse.success) {
      MerchData res = MerchData.fromJson(result.mappedResult);
      return res;
    }

    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<Stream<QuerySnapshot>> getEvents() async {
    var result = await _client.getAsync(kConstGetEventsURL);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }

    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<Stream<QuerySnapshot>> getSchedules() async {
    var result = await _client.getAsync(kConstGetSchedulesRef);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<Stream<QuerySnapshot>> getPlaces() async {
    var result = await _client.getAsync(kConstGetPlacesRef);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<Stream<QuerySnapshot>> getChairs() async {
    var result = await _client.getAsync(kConstGetChairsRef);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<Stream<QuerySnapshot>> getJointimes() async {
    var result = await _client.getAsync(kConstGetJointimesRef);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<Stream<QuerySnapshot>> getContacts() async {
    var result = await _client.getAsync(kConstGetContactsRef);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<Stream<QuerySnapshot>> getSponsors() async {
    var result = await _client.getAsync(kConstGetSponsorsRef);
    if (result.networkServiceResponse.success) {
      var res = result.mappedResult;
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  /* @override
  Future<PostNewData> getPosts() async {
    var result = await _restClient.getAsync(kConstGetPostsUrl);
    if (result.networkServiceResponse.success) {
      PostNewData res = PostNewData.fromJson(result.mappedResult);
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }*/
}
