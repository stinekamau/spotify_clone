import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';
import 'package:spotify_clone/widgets/playlist_header.dart';
import 'package:spotify_clone/widgets/track_list.dart';

// import '../widgets/widgets.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;

  const PlayListScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 28.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 28.0,
                    ),
                  ),
                ),
              ]),
        ),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              label: const Text("Kamau")),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 28,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0,
                0.3,
              ],
              colors: [
                const Color(0xFFAF1018),
                Theme.of(context).backgroundColor,
              ]),
        ),
        child: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            child: ListView(
              controller: _scrollController,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
              children: [
                PlaylistHeader(playlist: widget.playlist),
                TrackList(tracks: widget.playlist.songs),
              ],
            )),
      ),
    );
  }
}
