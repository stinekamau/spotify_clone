import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGuSD5mJLqHjg2xRIrmH--H8NQ61NAMqMMaA&usqp=CAU",
                width: 200,
              ),
            ),
          ]),

          _SideMenuIconTab(
            iconData: Icons.home,
            title: "Home",
            onTap: () {},
          ),

          _SideMenuIconTab(
            iconData: Icons.search,
            title: "Search",
            onTap: () {},
          ),

          _SideMenuIconTab(
            iconData: Icons.music_note,
            title: "Radio",
            onTap: () {},
          ),

          const SizedBox(
            height: 10,
          ),
          _LibraryPlayLists()

          // The home tile
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  const _LibraryPlayLists({Key? key}) : super(key: key);

  @override
  State<_LibraryPlayLists> createState() => __LibraryPlayListsState();
}

class __LibraryPlayListsState extends State<_LibraryPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(12.0),
        // physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  "YOUR LIBRARY",
                  style: Theme.of(context).textTheme.headline4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...yourLibrary
                  .map(
                    (e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    ),
                  )
                  .toList(),
            ],
          )
        ],
      ),
    );
  }
}
