# Music Player

Stack: Flutter, Dart

## Getting Started

This application was created using Flutter, Dart & Dart Spotify SDK.

A few resources to get you started if this is your first Flutter project:

- [Link to Dart Spotify SDK] - https://pub.dev/packages/spotify 
- [Spotify Android API] - https://developer.spotify.com/documentation/android

**Note that in order to use Spotify API you'll need to have a Spotify Premium Account**

### Key Moments:
#### Spotify Dart Installation
1) Add the dependency in pubscpec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.6
  spotify: ^0.13.5
```

2) Install the dependency (You can press get "Pub get" if you're using Android Studio)

3) It will import the dependency:
```dart
import "package:spotify/spotify.dart";
```

4) Go to Spotify For Developers -> Dashboard; and create application <br>
That will allow you to use ClientID and ClientSecret keys of your account to make API calls

5) Store them in your variable:
```dart
late SpotifyApiCredentials credentials;
late SpotifyApi spotify;

@override
  void initState() {
    super.initState();
    credentials = SpotifyApiCredentials(clientId, clientSecret);
    spotify = SpotifyApi(credentials);
  }
```

6) Now you can use API calls!
```dart
spotify.albums.get("4PWBTB6NYSKQwfo79I3prg")
```
