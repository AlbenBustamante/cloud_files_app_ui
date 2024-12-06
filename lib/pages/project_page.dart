import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  final String _folderName;

  const ProjectPage(this._folderName, {super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [_header(), _avatars(), const Divider()],
        ));
  }

  Container _header() {
    return Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(25.0),
        height: 170.0,
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget._folderName,
                      style: const TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold)),
                  const Text("Project",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w400))
                ]),
            Row(children: [
              _headerIcon(Icons.search),
              const SizedBox(width: 15.0),
              _headerIcon(Icons.share_outlined)
            ])
          ],
        ));
  }

  Container _headerIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15.0)),
      child: IconButton(
          icon: Icon(icon, size: 28.0, color: Colors.blue), onPressed: () {}),
    );
  }

  Container _avatars() {
    return Container(
        padding: const EdgeInsets.only(left: 25.0, top: 25.0),
        height: 130.0,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          _avatar('Mia', 'mia'),
          _avatar('Adam', 'adam'),
          _avatar('Jess', 'jess'),
          _avatar('Mike', 'mike'),
          _avatar('Brandon', 'brandon'),
          _avatar('Alie', 'alie')
        ]));
  }

  Padding _avatar(String name, String fileName) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  Image.asset('assets/images/$fileName.jpeg').image),
          const SizedBox(height: 8.0),
          Text(name,
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
