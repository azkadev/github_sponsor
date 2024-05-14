/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "sponsor_account_data.dart";

 
class SponsorData extends JsonScheme {

  
  SponsorData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"sponsorData","current":[{"@type":"sponsorAccountData","username":"","avatar":""}],"past":[{"@type":"sponsorAccountData","username":"","avatar":""}]};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  
  List<SponsorAccountData> get current {
    try {
      if (rawData["current"] is List == false){
        return [];
      }
      return (rawData["current"] as List).map((e) => SponsorAccountData(e as Map)).toList().cast<SponsorAccountData>();
    } catch (e) {
      return [];
    }
  }


  
  set current(List<SponsorAccountData> values) {
    rawData["current"] = values.map((value) => value.toJson()).toList();
  }


  
  List<SponsorAccountData> get past {
    try {
      if (rawData["past"] is List == false){
        return [];
      }
      return (rawData["past"] as List).map((e) => SponsorAccountData(e as Map)).toList().cast<SponsorAccountData>();
    } catch (e) {
      return [];
    }
  }


  
  set past(List<SponsorAccountData> values) {
    rawData["past"] = values.map((value) => value.toJson()).toList();
  }



  
  static SponsorData create({

    String special_type = "sponsorData",
      List<SponsorAccountData>? current,
      List<SponsorAccountData>? past,
})  {
    // SponsorData sponsorData = SponsorData({
Map sponsorData_data_create_json = {
  
      "@type": special_type,
      "current": (current != null)? current.toJson(): null,
      "past": (past != null)? past.toJson(): null,


};


          sponsorData_data_create_json.removeWhere((key, value) => value == null);
SponsorData sponsorData_data_create = SponsorData(sponsorData_data_create_json);

return sponsorData_data_create;



      }
}