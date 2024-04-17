import "package:flutter/material.dart";

class TrackInfoPage extends StatefulWidget {
  final album;
  final track;

  const TrackInfoPage({
    super.key,
    required this.album,
    required this.track,
  });

  @override
  _TrackInfoPageState createState() => _TrackInfoPageState();
}

class _TrackInfoPageState extends State<TrackInfoPage> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.album.name} : ${widget.track.name}",
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.3,
          ),
        ),
        backgroundColor: const Color(0xFF41B06E),
      ),
      backgroundColor: const Color(0xFF212121),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Image.network(
                widget.album.images!.first.url,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.track.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF41B06E),
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              widget.album.artists!
                  .map((artist) => artist.name)
                  .join(", "),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                color: Color(0xB3EEEEEE),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.skip_previous_rounded,
                      color: Color(0xFFEEEEEE),
                      size: 50,
                    ),
                  ),
                  Icon(
                    Icons.pause_circle,
                    color: Color(0xFFEEEEEE),
                    size: 70,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.skip_next_rounded,
                      color: Color(0xFFEEEEEE),
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              activeColor: const Color(0xFF41B06E),
            ),
          ],
        ),
      ),
    );
  }
}
