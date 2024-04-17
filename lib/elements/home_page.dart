import "package:flutter/material.dart";
import "package:spotify/spotify.dart";
import "albums_page.dart";

const String clientId = "eabfea3e6ae24444961bf09efa489ba5";
const String clientSecret = "102a808909bf42f29d9f4840fefc4ed0";
const String redirectUrl = "com.example.musicplayer://login-callback";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SpotifyApiCredentials credentials;
  late SpotifyApi spotify;

  late List<Future<Album>> albums = [];
  @override
  void initState() {
    super.initState();
    credentials = SpotifyApiCredentials(clientId, clientSecret);
    spotify = SpotifyApi(credentials);
  }

  void getAlbums() async {
    albums = [
      spotify.albums.get("4PWBTB6NYSKQwfo79I3prg"),
      spotify.albums.get("7txGsnDSqVMoRl6RQ9XyZP"),
      spotify.albums.get("2z9lM6LDS58F70IGyQ1XMK"),
      spotify.albums.get("18NOKLkZETa4sWwLMIm0UZ"),
      spotify.albums.get("46xdC4Qcvscfs3Ai2RIHcv"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                "Press the button to connect to Spotify",
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontSize: 16,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getAlbums();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlbumsPage(albums: albums, spotify: spotify,))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF41B06E),
                foregroundColor: const Color(0xFF212121),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                  "Connect",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
