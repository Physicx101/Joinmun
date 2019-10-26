// *  Not needed as of now
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:joinmun_2019/home/home_provider.dart';
import 'package:joinmun_2019/model/place.dart';
import 'package:joinmun_2019/utils/dependency_injection.dart';
import 'package:joinmun_2019/utils/joinmun.dart';

import 'index.dart';

class FirebaseClient implements IClient {
   Firestore _db = Firestore.instance;

  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders}) async {
      String rawString;
      var resultClass;



    // Sponsors
    if (resourcePath == HomeProvider.kConstGetSponsorsRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    // Schedules
    if (resourcePath == HomeProvider.kConstGetSchedulesRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    // Speakers
    if (resourcePath == HomeProvider.kConstGetSpeakersRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    // Places
    if (resourcePath == HomeProvider.kConstGetPlacesRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    // Chairs
    if (resourcePath == HomeProvider.kConstGetChairsRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    // Jointimes
    if (resourcePath == HomeProvider.kConstGetJointimesRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    // Contacts
    if (resourcePath == HomeProvider.kConstGetContactsRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    // Events
    if (resourcePath == HomeProvider.kConstGetEventsRef) {
      resultClass = _db.collection(resourcePath).snapshots();
    }

    //? For Speakers Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetSpeakersUrl) {
      if (Injector().currentDataMode == DataMode.DART) {
        //rawString = jsonEncode(TeamsData(teams: teams));
      } else {
        rawString = await rootBundle.loadString(Joinmun.speakersAssetJSON);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    //? For Merch Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetMerchURL) {
      if (Injector().currentDataMode == DataMode.DART) {
        //rawString = jsonEncode(TeamsData(teams: teams));
      } else {
        rawString = await rootBundle.loadString(Joinmun.merchAssetJSON);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    return MappedNetworkServiceResponse<T>(
        mappedResult: resultClass,
        networkServiceResponse: NetworkServiceResponse<T>(success: true));
  }

  @override
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, data,
      {bool customHeaders = false}) {
    return null;
  }

  // * JSON Decoding using Isolates
  static Map<String, dynamic> jsonParserIsolate(String res) {
    return jsonDecode(res);
  }
}
