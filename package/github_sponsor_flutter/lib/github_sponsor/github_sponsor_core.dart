// ignore_for_file: empty_catches, unnecessary_brace_in_string_interps

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
// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:general_lib/general_lib.dart';
import 'package:github/github.dart';
import 'package:github_sponsor_scheme/scheme/respond_scheme/respond_scheme.dart';
import 'package:http/http.dart';
import 'package:mime/mime.dart';
// import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

class GithubSponsor {
  String token_github = "";
  GithubSponsor();

  GitHub gitHub({
    String? token,
  }) {
    token ??= token_github;
    if (token.isEmpty) {
      return GitHub(auth: const Authentication.anonymous());
    }
    return GitHub(auth: Authentication.withToken(token));
  }

  Future<AccountData> getMe({
    String? token,
    String? username,
  }) async {
    token ??= token_github;

    if (token.isEmpty) {
      var res = await gitHub(token: token).users.getUser("azkadev");
      return AccountData.create(
        username: res.login,
        avatar: res.avatarUrl,
      );
    }
    var res = await gitHub(token: token).users.getCurrentUser();
    return AccountData.create(
      username: res.login,
      avatar: res.avatarUrl,
    );
  }

  Future<Uri> releaseFile({
    required String repoName,
    String? token,
    required bool isOrg,
    required String releaseTagName,
    required File releaseFile,
  }) async {
    token ??= token_github;
    GitHub github = gitHub(token: token);
    RepositorySlug repositorySlug = RepositorySlug.full(repoName);

    // ignore: unused_local_variable
    Repository repository = await Future(() async {
      try {
        return await github.repositories.getRepository(
          repositorySlug,
        );
      } catch (e) {
        if (e is GitHubError) {
          if (RegExp(r"Repository not found", caseSensitive: false).hashData(e.message)) {
            print("Create Repo: ${repositorySlug.fullName}");
            return await github.repositories.createRepository(
              CreateRepository(
                repositorySlug.name,
                hasIssues: false,
                autoInit: true,
                gitignoreTemplate: "Dart",
                licenseTemplate: "MIT",
              ),
              org: (isOrg) ? repositorySlug.owner : null,
            );
          }
        }
        rethrow;
      }
    });

    Release release_repo = await Future(() async {
      try {
        return await github.repositories.getReleaseByTagName(
          repositorySlug,
          releaseTagName,
        );
      } catch (e) {
        if (e is GitHubError) {
          if (RegExp(r"Release for tagName .* not found", caseSensitive: false).hasMatch(e.message ?? "")) {
            // onUpdate("Create Release: ${repositorySlug.fullName} ${publishType}");
            try {
              return await github.repositories.createRelease(repositorySlug, CreateRelease(releaseTagName), getIfExists: true);
            } catch (e) {
              if (e is GitHubError) {
                if (RegExp(r"Repository is empty", caseSensitive: false).hasMatch(e.message ?? "")) {
                  // onUpdate("Create Repo: ${repositorySlug.fullName}");
                  await github.repositories.deleteRepository(
                    repositorySlug,
                  );
                  rethrow;
                }
              }
              rethrow;
            }
          }
        }

        rethrow;
      }
    });

    List<ReleaseAsset> releaseAssets = await github.repositories.listReleaseAssets(repositorySlug, release_repo).toList();
    ReleaseAsset? releaseAsset = releaseAssets.firstWhereOrNull((element) => element.name == path.basename(releaseFile.path));
    if (releaseAsset != null) {
      // onUpdate("Delete Asset: ${releaseAsset.name}");
      await github.repositories.deleteReleaseAsset(repositorySlug, releaseAsset);
    }
    await github.repositories.uploadReleaseAssets(
      Release(
        name: releaseTagName,
        htmlUrl: release_repo.htmlUrl,
        tarballUrl: release_repo.tarballUrl,
        uploadUrl: release_repo.uploadUrl,
        url: release_repo.url,
      ),
      {
        CreateReleaseAsset(
          name: path.basename(releaseFile.path),
          contentType: lookupMimeType(releaseFile.path) ?? "",
          assetData: releaseFile.readAsBytesSync(),
        ),
      },
    );
    return Uri.parse("https://github.com/${repositorySlug.owner}/${repositorySlug.name}/");
  }

  Future<Sponsor> getSponsor({
    required String username,
  }) async {
    Sponsor sponsorData = Sponsor({});
    Uri uri = Uri.parse("https://ghs.vercel.app/v2/sponsors/${username}");
    Response response = await get(uri);
    try {
      sponsorData.rawData = json.decode(response.body);
    } catch (e) {}
    if (response.statusCode == 200) {
      sponsorData["@type"] = "sponsorData";
    } else {
      sponsorData["@type"] = "error";
    }

    return sponsorData;
  }
}
