import 'package:flutter/material.dart';

import '../data/data.dart';

class TrackList extends StatelessWidget {
  const TrackList({Key? key, required this.tracks}) : super(key: key);
  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: const [
          DataColumn(label: Text("TITLE")),
          DataColumn(label: Text("ARTIST")),
          DataColumn(label: Text("ALBUM")),
          DataColumn(label: Icon(Icons.access_time)),
        ],
        rows: tracks.map((e) {
          return DataRow(cells: [
            DataCell(Text(e.title,
                style: TextStyle(color: Theme.of(context).iconTheme.color))),
            DataCell(Text(e.artist,
                style: TextStyle(color: Theme.of(context).iconTheme.color))),
            DataCell(Text(e.album,
                style: TextStyle(color: Theme.of(context).iconTheme.color))),
            DataCell(Text(e.duration,
                style: TextStyle(color: Theme.of(context).iconTheme.color)))
          ]);
        }).toList());
  }
}
