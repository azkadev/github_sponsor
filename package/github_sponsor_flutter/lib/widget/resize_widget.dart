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
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class ResizeWidget extends StatelessWidget {
  final Size size;
  final Widget child;
  final bool is_resize_screen;
  const ResizeWidget({super.key, required this.size, required this.child, this.is_resize_screen = false});

  @override
  Widget build(BuildContext context) {
    SizeAspectRatio sizeAspectRatio = SizeAspectRatio(width: size.width.toInt(), height: size.height.toInt()).resize(context.width.toInt(), context.height.toInt());
    MediaQueryData mediaQueryData = context.mediaQueryData.copyWith(
      size: (is_resize_screen) ? Size(sizeAspectRatio.width.toDouble(), sizeAspectRatio.height.toDouble()) : size,
    );
    return SizedBox(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      child: MediaQuery(
        data: mediaQueryData,
        child: child,
      ),
    );
  }
}
