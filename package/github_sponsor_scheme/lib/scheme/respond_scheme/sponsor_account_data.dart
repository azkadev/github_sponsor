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


 
class SponsorAccountData extends JsonScheme {

  
  SponsorAccountData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"sponsorAccountData","username":"","avatar":""};
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


  
  String? get username {
    try {
      if (rawData["username"] is String == false){
        return null;
      }
      return rawData["username"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set username(String? value) {
    rawData["username"] = value;
  }


  
  String? get avatar {
    try {
      if (rawData["avatar"] is String == false){
        return null;
      }
      return rawData["avatar"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set avatar(String? value) {
    rawData["avatar"] = value;
  }


  
  static SponsorAccountData create({

    String special_type = "sponsorAccountData",
    String? username,
    String? avatar,
})  {
    // SponsorAccountData sponsorAccountData = SponsorAccountData({
Map sponsorAccountData_data_create_json = {
  
      "@type": special_type,
      "username": username,
      "avatar": avatar,


};


          sponsorAccountData_data_create_json.removeWhere((key, value) => value == null);
SponsorAccountData sponsorAccountData_data_create = SponsorAccountData(sponsorAccountData_data_create_json);

return sponsorAccountData_data_create;



      }
}