import "package:flutter/material.dart";
import "package:spotify/spotify.dart";
import "album_info_box.dart";

class AlbumsPage extends StatefulWidget {
  final List<Future<Album>> albums;
  final SpotifyApi spotify;

  const AlbumsPage({
    super.key,
    required this.albums,
    required this.spotify
  });

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  Future<List<TrackSimple>> getTracks(Album album) async {
    final albumTracks = await widget.spotify.albums.getTracks(album.id!).all();
    return albumTracks.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF41B06E),
        title: const Text(
            "My Favorite Albums",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3
            )
        ),
      ),
      backgroundColor: const Color(0xFF212121),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var albumFuture in widget.albums)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<Album>(
                    future: albumFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        final album = snapshot.data!;
                        return FutureBuilder<List<TrackSimple>>(
                          future: getTracks(album),
                          builder: (context, tracksSnapshot) {
                            if (tracksSnapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (tracksSnapshot.hasError) {
                              return Text("Error: ${tracksSnapshot.error}");
                            } else {
                              final tracks = tracksSnapshot.data!;
                              return AlbumInfoBox(album: album, tracks: tracks);
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
