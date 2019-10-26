import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Joinmun {
  static const String app_name = "JOINMUN 2019";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String avenir_family = "Avenir";
  static bool isDebugMode = false;
  static const String joinmun_color_1 = "#070e25";
  static const String joinmun_color_2 = "#002174";
  static const String joinmun_color_3 = "#357b84";
  static const String joinmun_color_4 = "#69c1cd";
  static const String joinmun_color_5 = "#eb6925";
  static const String joinmun_color_6 = "#fc8549";
  static const String joinmun_color_7 = "#ffa367";
  static const String joinmun_color_8 = "#fafbf8";

  // * Url related
  static String baseUrl = "https://storage.googleapis.com/gdg-devfest";

  static checkDebug() {
    assert(() {
      isDebugMode = true;
      return true;
    }());
  }

  static bool get checkDebugBool {
    var debug = false;
    assert(debug = true);

    return debug;
  }

  //* Images

  static const String banner_joinmun = "assets/images/banner_joinmun.png";

  //*  Texts
  static const String welcomeText = "Welcome to JOINMUN 2019";
  static const String remarksText = "Welcoming Remarks";
  static const String jogjaText = "The city of Yogyakarta is known for its rich heritage and number of universities whose students make up a great deal of its population. It is not an understatement.";
  static const String sponsorText= "Sponsors";
  static const String medpartText= "Media Partners";

  static const String loading_text = "Loading...";
  static const String try_again_text = "Try Again";
  static const String some_error_text = "Some error";
  static const String signInText = "Sign In";
  static const String signInGoogleText = "Sign in with google";
  static const String signOutText = "Sign Out";
  static const String wrongText = "Something went wrong";
  static const String confirmText = "Confirm";
  static const String supportText = "Support Needed";
  static const String featureText = "Feature Request";
  static const String moreFeatureText = "More Features coming soon.";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";

  //* ActionTexts
  static const String jointimes_text = "JOINTIMES";
  static const String schedule_text = "Schedule";
  static const String events_text = "Events";
  static const String speakers_text = "Speakers";
  static const String chairs_text = "Chairs";
  static const String places_text = "Places to Visit";
  static const String handbook_text = "Handbook";
  static const String merch_text = "Merch";
  static const String contacts_text = "Contacts";
  static const String sponsors_text = "Sponsors";

  //* Preferences
  static SharedPreferences prefs;
  static const String loggedInPref = "loggedInPref1";
  static const String displayNamePref = "displayNamePref";
  static const String emailPref = "emailPref";
  static const String phonePref = "phonePref";
  static const String photoPref = "photoPref";
  static const String isAdminPref = "isAdminPref";
  static const String darkModePref = "darkModePref";

  //* Opening Remarks
  static const String remarks_ugm = "Universitas Gadjah Mada";
  static const String remarks_salu_name = "Istiqomatussalma Inayah Wardana";
  static const String remarks_salu_text =
     """     I am honoured to be trusted and appointed to organise the eight chapter of Jogja International Model United Nations on the 24th - 27th of October 2019. 
      
      This year we will have more innovations in our event to create a remarkable experience for our delegates. With the adopted theme of “The Endeavour to Traverse Dynamic Regimes: Ending Tyranny, Ushering Liberty”, which will be reflected in each council’s respective topics where delegates will be able to discuss current international affairs. As the international order is being disturbed by nations’ pursuit of power and the violence that comes with it regardless of who is in power.
      
      This violence is depriving people of their rights and we are losing lives in the thousands. Delegates will debate about the power hungry states and how to liberate those who are oppressed through international cooperation amongst states. 
	
                  """;
  static const String remarks_salu_role = "President of JOINMUN 2019";
  static const String remarks_salu_faculty = "Faculty of Law";
  static const String remarks_kayla_name = "Kayla Adisa";
  static const String remarks_kayla_text =
      """     MUN helps us understand that the realm of international issue does not exclusively belong to a certain group of people. World issue is everyone’s issue; and MUN brings together people, from various places and backgrounds, to think, reflect, and collectively solve problems.
      
      Acknowledging its importance, it is crucial for an MUN to be carefully formulated. JOINMUN have been Indonesia’s most prestigious MUN conference--hence, the most awaited one, not without reason: well crafted substance and top notch services.
      
      This year’s JOINMUN will surely be an event one would not want to miss. I believe MUN has always been an all-in-one package: an area to learn, to speak up, to debate, to compromise, while at the same time, to build friendships, and seek delightful recreational experience.
       
      Therefore, not only will you experience a conference with thought-provoking themes and gravanizing debate; JOINMUN 2019 will also deliver you the best of every single aspect an MUN can offer. 
 """;
  static const String remarks_kayla_role = "Secretary General of JOINMUN 2019";
  static const String remarks_kayla_faculty = "Faculty of Social and Political Sciences";


  //* JSON URLS
  static const String schedulesAssetJSON = "assets/json/schedules.json";
  static const String eventsAssetJSON = "assets/json/events.json";
  static const String chairsAssetJSON = "assets/json/chairs.json";
  static const String speakersAssetJSON = "assets/json/speakers.json";
  static const String merchAssetJSON = "assets/json/merch.json";
}
