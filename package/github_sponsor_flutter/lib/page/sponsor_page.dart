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
// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:github_sponsor_flutter/github_sponsor/github_sponsor_core.dart';
import 'package:github_sponsor_flutter/widget/profile_picture.dart';
import 'package:github_sponsor_scheme/scheme/respond_scheme/respond_scheme.dart';

// import 'package:line_icons/line_icons.dart';
typedef SponsorPageRefreshFunction = FutureOr<void> Function();

class SponsorPage extends StatefulWidget {
  final String username;
  final GithubSponsor githubSponsor;
  final SponsorPageRefreshFunction onRefreshFinished;
  const SponsorPage({
    super.key,
    required this.username,
    required this.githubSponsor,
    required this.onRefreshFinished,
  });

  @override
  State<SponsorPage> createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  bool is_loading = true;
  AccountData accountData = AccountData({});
  SponsorData sponsorData = SponsorData({});
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
      unawaited(task());
    });
  }

  Future<void> task() async {
    setState(() {
      is_loading = true;
    });
    await Future(() async {
      bool is_debug = false;
      if (kDebugMode) {
        is_debug = true;
      }
      if (is_debug) {
        List<String> avatars = [
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_17ed9b19-70d4-424e-9780-2c6a6fb05cdc.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_34b74551-63bc-4ba5-98bd-0f0aaeb5684c.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_222639e0-6889-4337-8e69-9f83d3257eec.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_019bb84d-7b23-43c2-94d6-3a7dc6a28683.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_5c2f2b79-7f2f-4820-a32e-8c1882d8b52d.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_94997130-867f-47c1-835b-08d79d0eb34c.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_a4a78d5c-9b43-4d94-a52c-13c1e8d736dd.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_e7148828-7cdd-4ec1-bc84-d6dd19d896f8.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_27a43242-da9e-4756-b33e-111a4bfcc2e5.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_b19affc5-8ca8-43e0-8e82-5f2e11ebb50b.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_344f954e-809a-4e5f-a993-8a52c644875c.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_9ad755f5-c91e-4a4b-86d3-a33441de1ea8.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_bfd32b57-6186-457a-bdf8-db02ab332bb8.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_eaeadf19-7624-4d59-b88e-3016621617b3.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_f1f5166e-e444-4d09-8795-b23dd075d2d3.jpeg",
          "/home/galaxeus/Documents/galaxeus/app/github_sponsor/package/github_sponsor_flutter/logo/_9c1439b4-84db-405d-9c6b-3f4a7301221c.jpeg",
        ];

        avatars.shuffle();
        accountData = AccountData.create(
          username: widget.username,
          avatar: avatars.randomOrNull(),
        );
        setState(() {});

        sponsorData = SponsorData.create(
          current: () {
            avatars.shuffle();
            return avatars.take(Random().nextInt(avatars.length) + 1).map((e) {
              return SponsorAccountData.create(
                avatar: e,
                username: generateUuid(Random().nextInt(5) + 5),
              );
            }).toList();
          }(),
          past: () {
            avatars.shuffle();
            return avatars.take(Random().nextInt(avatars.length)).map((e) {
              return SponsorAccountData.create(
                avatar: e,
                username: generateUuid(Random().nextInt(5) + 5),
              );
            }).toList();
          }(),
        ); 
 
        setState(() {});

        accountData = await widget.githubSponsor.getMe();
  

        sponsorData = (await widget.githubSponsor.getSponsor(username: ("azkadev").trim())).sponsors;

 
        setState(() {});


      } else {
        accountData = await widget.githubSponsor.getMe();
        setState(() {});

        sponsorData = (await widget.githubSponsor.getSponsor(username: (accountData.username ?? "").trim())).sponsors;

        setState(() {});
      }
      setState(() {});
    });
    setState(() {
      is_loading = false;
    });
    setState(() {});
    unawaited(onFinished());
  }

  Future<void> onFinished() async {
    await Future.delayed(const Duration(seconds: 2));
    await widget.onRefreshFinished();
  }

  @override
  Widget build(BuildContext context) {
    if (is_loading) {
      return Center(
        child: CircularProgressIndicator(
          color: context.theme.indicatorColor,
        ),
      );
    }
    return SizedBox(
      // height: context.height,
      width: context.width,
      child: Builder(
        builder: (context) {
          Widget child = Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // const SizedBox.shrink(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ProfilePicture(
                      pathImage: accountData.avatar ?? "",

                      nick_name: "${accountData.username ?? ""}".trim().toUpperCaseFirstData(),

                      // width: (((context.height + context.width) / 2) * 1/7),
                      // height: (((context.height + context.width) / 2) * 1/7),
                      width: context.height / 5.4,
                      height: context.height / 5.4,
                      borderRadius: BorderRadius.all(Radius.circular(context.height / 21.6)),
                      onPressed: () {},
                    ),
                  ),
                  Visibility(
                    visible: "${accountData.username ?? ""}".trim().isNotEmpty,
                    child: Builder(
                      builder: (context) {
                        TextStyle textStyle = TextStyle(
                          color: context.theme.indicatorColor,
                          fontWeight: FontWeight.bold,
                          // fontSize: 40,
                          fontFamily: "ShadowsIntoLight",
                          shadows: [
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        );
                        return Stack(
                          children: List.generate(
                            2,
                            (index) {
                              return Text(
                                "${accountData.username ?? ""}".trim(),
                                style: (index == 0)
                                    ? textStyle.copyWith(
                                        color: null,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color = Colors.black,
                                      )
                                    : textStyle,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Builder(
                      builder: (context) {
                        TextStyle textStyle = TextStyle(
                          color: context.theme.indicatorColor,
                          fontWeight: FontWeight.bold,
                          fontSize: context.height / 15,
                          fontFamily: "ShadowsIntoLight",
                          shadows: [
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        );
                        return Stack(
                          children: List.generate(
                            2,
                            (index) {
                              return Text(
                                "Github Sponsor".trim().toUpperCaseFirstData(),
                                style: (index == 0)
                                    ? textStyle.copyWith(
                                        color: null,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color = Colors.black,
                                      )
                                    : textStyle,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  sponsorsWidget(
                    title: "Current",
                    sponsorAccountDatas: sponsorData.past,
                  ),
                  sponsorsWidget(
                    title: "Past",
                    sponsorAccountDatas: sponsorData.current,
                  ),
                ],
              ),
            ],
          );
          // ignore: dead_code
          return child;
        },
      ),
    );
  }

  double runSpacing = 4;
  double spacing = 4;
  int listSize = 15;
  int columns = 4;

  Widget sponsorsWidget({
    required String title,
    required List<SponsorAccountData> sponsorAccountDatas,
  }) {
    // List<SponsorAccountData> sponsor_account_data_current = widget.sponsorData.current;

    return Visibility(
      visible: sponsorAccountDatas.isNotEmpty,
      child: Column(
        children: [
          Builder(
            builder: (context) {
              TextStyle textStyle = TextStyle(
                color: context.theme.indicatorColor,
                fontWeight: FontWeight.bold,
                fontSize: context.height / 67,
                fontFamily: "ShadowsIntoLight",
                shadows: [
                  BoxShadow(
                    color: context.theme.shadowColor.withAlpha(110),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: context.theme.shadowColor.withAlpha(110),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              );
              return Stack(
                children: List.generate(
                  2,
                  (index) {
                    return Text(
                      "${title}".trim().toUpperCaseFirstData(),
                      style: (index == 0)
                          ? textStyle.copyWith(
                              color: null,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.black,
                            )
                          : textStyle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
              );
            },
          ),
          
          Padding(
            padding: const EdgeInsets.all(5),
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeLeft: true,
              removeRight: true,
              removeTop: true,
              child: Wrap(
                runSpacing: runSpacing,
                spacing: spacing,
                alignment: WrapAlignment.center,

                // mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sponsorAccountDatas.length,
                  (index) {
                    SponsorAccountData sponsorAccountData = sponsorAccountDatas[index];
                    return sponsowrWidget(
                      sponsorAccountData: sponsorAccountData,
                      onPressed: () {},
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sponsowrWidget({
    // required BuildContext context,
    IconData defaultIconData = CupertinoIcons.globe,
    required SponsorAccountData sponsorAccountData,
    required void Function()? onPressed,
  }) {
    String value_data = "${sponsorAccountData.username ?? ""}".trim();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: ProfilePicture(
              pathImage: sponsorAccountData.avatar ?? "",
              nick_name: value_data,
              height: context.height / 20,
              width: context.height / 20,
              borderRadius: BorderRadius.all(Radius.circular(context.height / 70)),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Builder(
            builder: (context) {
              TextStyle textStyle = TextStyle(
                color: context.theme.indicatorColor,
                fontFamily: "ShadowsIntoLight",
                fontSize: (context.height / 60),
                shadows: [
                  BoxShadow(
                    color: context.theme.shadowColor.withAlpha(110),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: context.theme.shadowColor.withAlpha(110),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              );
              return Stack(
                children: List.generate(
                  2,
                  (index) {
                    return Text(
                      value_data,
                      style: (index == 0)
                          ? textStyle.copyWith(
                              color: null,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black,
                            )
                          : textStyle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
