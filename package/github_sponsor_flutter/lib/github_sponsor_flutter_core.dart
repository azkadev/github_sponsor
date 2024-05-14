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
// ignore_for_file: non_constant_identifier_names, empty_catches, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:github_sponsor_flutter/github_sponsor/github_sponsor_core.dart';
import 'package:github_sponsor_flutter/page/sponsor_page.dart';
import "package:path/path.dart" as path;

class GithubSponsorFlutter extends StatefulWidget {
  const GithubSponsorFlutter({super.key});

  @override
  State<GithubSponsorFlutter> createState() => _GithubSponsorFlutterState();
}

class _GithubSponsorFlutterState extends State<GithubSponsorFlutter> {
  GithubSponsor githubSponsor = GithubSponsor();
  GlobalKey globalKey = GlobalKey();
  bool is_loading = true;
  String github_username = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
      unawaited(taskInit());
    });
  }

  Future<void> taskInit() async {
    setState(() {
      is_loading = true;
    });
    await Future(() async {
      try {
        githubSponsor.token_github = Platform.environment["token_github"] ?? "";
      } catch (e) {}

      try {
        github_username = (Platform.environment["username_github"] ?? "").trim();
      } catch (e) {}
    });
    setState(() {
      is_loading = false;
    });
  }

  Widget builds({
    required List<Widget> childrens,
  }) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        primary: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: context.height,
              minWidth: context.width,
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              // constraints: BoxConstraints(
              // maxHeight: context.height * 100,
              // maxWidth: context.width * 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: childrens,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Uint8List? data = await globalKey.toImagePng();
          if (data == null) {
            if (kDebugMode) {
              print("FAILED");
            }
            return;
          }
          Directory directory = Directory(path.join(Directory.current.path, "temp"));
          if (directory.existsSync() == false) {
            await directory.create(recursive: true);
          }
          // Direct
          DateTime dateTime = DateTime.now();
          File file = File(path.join(directory.path, "${dateTime.hour}:${dateTime.minute}:${dateTime.second}.png"));
          await file.writeAsBytes(data);
          if (kDebugMode) {
            print("FINISHED");
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.screenshot_monitor_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  Widget build(BuildContext context) {
    if (is_loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: context.theme.indicatorColor,
          ),
        ),
      );
    }
    return builds(
      childrens: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: RepaintBoundary(
            key: globalKey,
            child: SizedBox(
              width: 720,
              child: SponsorPage(
                username: github_username,
                githubSponsor: githubSponsor,
                onRefreshFinished: () async {
                  print("finished");
                  Uint8List? data = await globalKey.toImagePng();
                  if (data == null) {
                    if (kDebugMode) {
                      print("FAILED");
                    }
                    return;
                  }
                  Directory directory = Directory(path.join(Directory.current.path, "temp"));
                  if (directory.existsSync() == false) {
                    await directory.create(recursive: true);
                  }
                  File file = File(path.join(directory.path, "sponsor.png"));
                  if (file.existsSync()) {
                    file.deleteSync(recursive: true);
                  }
                  await file.writeAsBytes(data);
                  if (kDebugMode) {
                    print("FINISHED");
                  }
                  // await githubSponsor.releaseFile(
                  //   repoName: repoName,
                  //   isOrg: isOrg,
                  //   releaseTagName: releaseTagName,
                  //   releaseFile: releaseFile,
                  // );
                  //
                  if (kDebugMode == false) {
                    // exit(0);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
