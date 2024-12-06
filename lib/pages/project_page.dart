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
          children: [_header(), _avatars(), const Divider(), _files()],
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

  Widget _files() {
    return Expanded(
        child: ListView(padding: const EdgeInsets.all(25.0), children: [
      _filesHeader(),
      const SizedBox(height: 15.0),
      _file("Assets", true),
      _file('Brandbook', false),
      _file('Design', false),
      _file('Moodboards', true),
      _file('Wireframes', false)
    ]));
  }

  Row _filesHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Files',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        Text(
          'Create new',
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.blue),
        )
      ],
    );
  }

  Widget _file(String name, bool showAlert) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        height: 65.0,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15.0)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Stack(children: [
              Icon(Icons.folder, color: Colors.blue[200]),
              Visibility(
                  visible: showAlert,
                  child: Positioned(
                    top: 2.0,
                    right: -1.0,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const CircleAvatar(
                        radius: 3.5,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ))
            ]),
            const SizedBox(width: 12.0),
            Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 16.0))
          ]),
          IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              color: Colors.grey,
              onPressed: () {})
        ]));
  }
}
