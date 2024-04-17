import 'package:flutter/material.dart';
import 'package:musicplayer/elements/track_info_page.dart';

class AlbumInfoPage extends StatelessWidget {
  final album;
  final tracks;

  const AlbumInfoPage({
    super.key,
    required this.album,
    required this.tracks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF41B06E),
        title: Text(
          album.name ?? "Unknown Album Title",
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.3,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF212121),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (album.images?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                child: Column(
                  children: [
                    Image.network(
                      album.images!.first.url,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        album.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.3,
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                    ),
                    Text(
                      album.artists!.first.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        color: Color(0xFFEEEEEE),
                      ),
                    )
                  ],
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var track in tracks)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TrackInfoPage(album: album, track: track))
                        );
                      },
                      child: Text(
                          track.name ?? "Unknown Track",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.3,
                          )
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
