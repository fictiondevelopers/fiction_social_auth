import 'package:flutter/material.dart';
import 'package:fiction_social_auth/fiction_social_auth.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Fiction Social Auth")),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    FictionSocialAuth socialAuth = FictionSocialAuth();
                    UserData? user =
                        await socialAuth.socialAuth(AuthType.GOOGLE);
                    print("UserData: ${user?.toJson()}");
                  },
                  child: Text("Google"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    FictionSocialAuth socialAuth = FictionSocialAuth();
                    UserData? user =
                        await socialAuth.socialAuth(AuthType.GITHUB);
                    print("UserData: ${user?.toJson()}");
                  },
                  child: Text("Github"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    FictionSocialAuth socialAuth = FictionSocialAuth();
                    UserData? user =
                        await socialAuth.socialAuth(AuthType.LINKEDIN);
                    print("UserData: ${user?.toJson()}");
                  },
                  child: Text("LinkedIn"),
                ),
              ]),
        ),
      ),
    );
  }
}
