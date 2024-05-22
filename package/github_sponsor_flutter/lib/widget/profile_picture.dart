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
// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

// import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import 'package:general_lib_flutter/general_lib_flutter.dart';
// import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';

MaterialColor randomColors() {
  List<MaterialColor> colors = [Colors.blue, Colors.blueGrey, Colors.brown, Colors.cyan, Colors.deepOrange, Colors.deepPurple, Colors.green, Colors.grey, Colors.indigo, Colors.lightBlue, Colors.lightGreen, Colors.lime];
  colors.shuffle();
  return colors[0];
}

class ProfilePicture extends StatelessWidget {
  final String pathImage;
  final String nick_name;
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool data)? onHighlightChanged;
  const ProfilePicture({
    super.key,
    required this.pathImage,
    required this.width,
    required this.height,
    this.nick_name = "-",
    this.borderRadius,
    this.onLongPress,
    this.onHighlightChanged,
    required this.onPressed,
  });

  String get path_image {
    return pathImage;
  }

  File get file {
    return File(pathImage);
  }

  @override
  Widget build(BuildContext context) {
    DecorationImage? image;
    if (path_image.isNotEmpty) {
      image = DecorationImage(
        fit: BoxFit.cover,
        image: () {
          if (RegExp(r"^(http(s)?)").hasMatch(pathImage)) {
            return Image.network(pathImage).image;
          }
          return Image.asset(pathImage).image;
        }(),
        // image: AssetImage(pathImage),
        onError: (errDetails, error) {},
      );
    }
    Widget child = Container(
      width: width + 5,
      height: height + 5,
      decoration: BoxDecoration(
        color: context.theme.dialogBackgroundColor,
        borderRadius: () {
          return (borderRadius != null) ? borderRadius : BorderRadius.circular(15);
        }(),
        image: image,
        // boxShadow: [
        //   // BoxShadow(
        //   //   color: Colors.pink,
        //   //   offset: Offset(-2, 0),
        //   //   blurRadius: 7,
        //   // ),
        //   // BoxShadow(
        //   //   color: Colors.blue,
        //   //   offset: Offset(2, 0),
        //   //   blurRadius: 7,
        //   // ),
        //   BoxShadow(
        //     color: context.theme.shadowColor,
        //     spreadRadius: 2.5,
        //     blurRadius: 2.5,
        //     offset: const Offset(0, 0), // changes position of shadow
        //   ),
        // ],
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        clipBehavior: Clip.antiAlias,
        minWidth: 0,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHighlightChanged: onHighlightChanged,
        child: Visibility(
          visible: path_image.isEmpty,
          child: Center(
            child: Text(
              () {
                try {
                  return nick_name.characters.first;
                } catch (e) {}
                return "";
              }(),
              style: TextStyle(
                color: context.theme.indicatorColor,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    ); 
    return Container(
      decoration: BoxDecoration(
        color: context.theme.indicatorColor,
        borderRadius: () {
          return (borderRadius != null) ? borderRadius : BorderRadius.circular(15);
        }(),
        border: Border.all(
          color: context.theme.scaffoldBackgroundColor,
          width: 1.5,
        ),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.pink,
          //   offset: Offset(-2, 0),
          //   blurRadius: 7,
          // ),
          // BoxShadow(
          //   color: Colors.blue,
          //   offset: Offset(2, 0),
          //   blurRadius: 7,
          // ),
          BoxShadow(
            color: context.theme.shadowColor,
            spreadRadius: 0.5,
            blurRadius: 2.5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(1),
      child: child,
    );
    // return child;
  }
}
