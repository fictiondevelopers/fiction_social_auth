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
      case AuthType.github:
        return await _getGithubSignIn();
      case AuthType.google:
        return await _getGoogleSignIn();
      case AuthType.linkedin:
        return await _getLinkedinSignIn();
    }
  }

  Future<UserData?> _getGithubSignIn() async {
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: "${AuthConstant.authUrl}${AuthTypeConst.githubSignIn}",
        callbackUrlScheme: AuthConstant.schemeUrl,
      );

      return extractUserData(result);
    } catch (e) {
      return null;
    }
  }

  _getGoogleSignIn() async {
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: "${AuthConstant.authUrl}${AuthTypeConst.googleSignIn}",
        callbackUrlScheme: AuthConstant.schemeUrl,
      );

      return extractUserData(result);
    } catch (e) {
      return null;
    }
  }

  _getLinkedinSignIn() async {
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: "${AuthConstant.authUrl}${AuthTypeConst.linkedinSignIn}",
        callbackUrlScheme: AuthConstant.schemeUrl,
      );

      return extractUserData(result);
    } catch (e) {
      return null;
    }
  }

  UserData? extractUserData(String url) {
    Uri uri = Uri.parse(url);

    if (uri.isScheme('social-auth-scheme')) {
      // Get the query parameters from the URL
      Map<String, String> queryParams = uri.queryParameters;

      return UserData.fromJson(queryParams);
    }
    return null;
  }
}
