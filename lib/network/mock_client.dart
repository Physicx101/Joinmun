// *  Not needed as of now
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:joinmun_2019/home/home_provider.dart';
import 'package:joinmun_2019/utils/dependency_injection.dart';
import 'package:joinmun_2019/utils/joinmun.dart';

import 'index.dart';

class MockClient implements IClient {
  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders}) async {
    var resultClass;
    String rawString;

    //? For Chairs Hardcoded Data
    if (resourcePath == HomeProvider.kConstGetSpeakersUrl) {
      if (Injector().currentDataMode == DataMode.DART) {
        //rawString = jsonEncode(ChairsData(chairs: chairs));
      } else {
        rawString = await rootBundle.loadString(Joinmun.chairsAssetJSON);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    //? For Schedules Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetSessionsUrl) {
      if (Injector().currentDataMode == DataMode.DART) {
        //rawString = jsonEncode(SessionsData(sessions: sessions));
      } else {
        rawString = await rootBundle.loadString(Joinmun.schedulesAssetJSON);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    //? For Events Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetTeamsUrl) {
      if (Injector().currentDataMode == DataMode.DART) {
        //rawString = jsonEncode(TeamsData(teams: teams));
      } else {
        rawString = await rootBundle.loadString(Joinmun.eventsAssetJSON);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

     //? For Speakers Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetScheduleURL) {
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
