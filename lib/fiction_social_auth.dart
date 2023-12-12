library fiction_social_auth;

import 'dart:async';
export 'models/auth_type.dart';
export 'models/user_data.dart';

import 'package:fiction_social_auth/constant/auth_constant.dart';
import 'package:fiction_social_auth/models/auth_type.dart';
import 'package:fiction_social_auth/models/user_data.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class FictionSocialAuth {
  Future<UserData?> socialAuth(AuthType type) async {
    switch (type) {
      case AuthType.GITHUB:
        return await _getGithubSignIn();

      case AuthType.GOOGLE:
        return await _getGoogleSignIn();
      case AuthType.LINKEDIN:
        return await _getGoogleSignIn();
    }
  }

  Future<UserData?> _getGithubSignIn() async {
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: "${AuthConstant.authUrl}${AuthTypeConst.GITHUB_SIGNIN}",
        callbackUrlScheme: AuthConstant.schemeUrl,
      );

      return await extractUserData(result);
    } catch (e) {
      return null;
    }
  }

  _getGoogleSignIn() async {
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: "${AuthConstant.authUrl}${AuthTypeConst.GOOGLE_SIGNIN}",
        callbackUrlScheme: AuthConstant.schemeUrl,
      );

      return await extractUserData(result);
    } catch (e) {
      return null;
    }
  }

  _getLinkedinSignIn() async {
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: "${AuthConstant.authUrl}${AuthTypeConst.LINKEDiN_SIGNIN}",
        callbackUrlScheme: AuthConstant.schemeUrl,
      );

      return await extractUserData(result);
    } catch (e) {
      return null;
    }
  }

  UserData? extractUserData(String url) {
    Uri uri = Uri.parse(url);
    Map<String, String> userData = {};

    if (uri.isScheme('social-auth-scheme')) {
      // Get the query parameters from the URL
      Map<String, String> queryParams = uri.queryParameters;

      return UserData.fromJson(queryParams);
    }
    return null;
  }
}
