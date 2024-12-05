import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({super.key});

  @override
  State<TeamFolderPage> createState() => _TeamFolderPageState();
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(25.0),
              alignment: Alignment.bottomCenter,
              height: 170.0,
              decoration: BoxDecoration(color: Colors.blue.shade800),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Riotters',
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text('Team Folder',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white))
                        ]),
                    Row(children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.black.withOpacity(.1)),
                          child: IconButton(
                            icon: const Icon(Icons.search,
                                size: 28.0, color: Colors.white),
                            onPressed: () {},
                          )),
                      const SizedBox(width: 15.0),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.1),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: IconButton(
                              icon: const Icon(Icons.notifications,
                                  size: 28.0, color: Colors.white),
                              onPressed: () {}))
                    ])
                  ]))
        ]));
  }
}
