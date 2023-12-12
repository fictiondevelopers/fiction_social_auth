# Not tested in production yet, will be tested today IA.
# Fiction Social Auth

Fiction Social Auth is a social media authentication helper developed by Fiction Developers. For more information, visit [fictiondevelopers.com/auth-system](https://fictiondevelopers.com/auth-system).

We know the hurdle you have to go through to just manage the social media logins for your Flutter apps. You have to setup so many so many credentials on your developer account, later it's almost impossible to move it to client's accounts or to remember which project/account you used for configuration, and I know google doesn't allow that many projects to create. So just use this package get your job done under 5 minutes!


** Note: we don't keep user's data at all, everything is sent to your app and erased from our sessions instantly, so you don't have to worry about your privacy **

## Check our Roadmap

- [✅] Google (Achieved)
- [ ] Facebook (Under Development)
- [ ] Apple (Planned)
- [✅] GitHub (Acheived) - almost, sometimes displayName & email will be made out of user's username
- [✅] LinkedIn (Acheived) - watchout for "id" please, I'm returning it, but not positive if that's the id
- [ ] Twitter (Planned)
- [ ] Others (Planned)

## Installation
 - Add the latest version of package to your pubspec.yaml (and run ```dart pub get```):
```
dependencies:
  fiction_social_auth: ^0.0.1
```
 - Import the package
```
import 'package:fiction_social_auth/fiction_social_auth.dart';
```

## Android
- Add this in AndroidManifest.xml
```
    <application>
        <--->
        <activity
            android:name="com.linusu.flutter_web_auth_2.CallbackActivity"
            android:exported="true">
            <intent-filter android:label="flutter_web_auth_2">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="social-auth-scheme" />
            </intent-filter>
        </activity>
    </application>
```

## Example
```
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
                        await socialAuth.socialAuth(AuthType.google);
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
                        await socialAuth.socialAuth(AuthType.github);
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
                        await socialAuth.socialAuth(AuthType.linkedin);
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
```


For more information and usage examples, refer to the [documentation](https://fictiondevelopers.com/auth-system).



Ping me if you have any problems at:
whatsapp: +923009550284
email: csgenius786@gmail.com

Buy me coffee?

BuyMeCoffee Wallet
```
https://www.buymeacoffee.com/mahevstark
```