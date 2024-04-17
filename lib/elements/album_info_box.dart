import "package:flutter/material.dart";
import "album_info_page.dart";

class AlbumInfoBox extends StatelessWidget {
  final album;
  final tracks;
  const AlbumInfoBox({
    super.key,
    required this.album,
    required this.tracks
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          if(album.images?.isNotEmpty ?? false)
            Image.network(
            album.images!.first.url,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AlbumInfoPage(album: album, tracks: tracks))
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                    ),
                    child: Text (
                        album.name ?? "Unknown Album Title",
                        style: const TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.3
                        )
                    ),
                ),
                Text (
                  album.artists!.first.name,
                  style: const TextStyle(
                    color: Color(0xFF41B06E),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3
                  )
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

