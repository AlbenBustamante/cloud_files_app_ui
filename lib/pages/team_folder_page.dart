import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({super.key});

  @override
  State<TeamFolderPage> createState() => _TeamFolderPageState();
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  double _availableScreenWidth = 0;

  @override
  Widget build(BuildContext context) {
    _availableScreenWidth = MediaQuery.sizeOf(context).width - 50.0;

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
                  ])),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: const TextSpan(
                          text: "Storage ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "9.1/10GB",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16.0))
                      ])),
                  const Text("Storage",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0))
                ]),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(children: [
              _buildFileSizeChart("SOURCES", Colors.blue, .3),
              const SizedBox(width: 2.0),
              _buildFileSizeChart("DOCS", Colors.red, .25),
              const SizedBox(width: 2.0),
              _buildFileSizeChart("IMAGES", Colors.yellow, .2),
              const SizedBox(width: 2.0),
              _buildFileSizeChart("", Colors.grey, .23)
            ]),
          ),
          const SizedBox(height: 15.0),
          const Divider(height: 20.0)
        ]));
  }

  Column _buildFileSizeChart(
      String title, Color color, double widthPercentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: _availableScreenWidth * widthPercentage,
            height: 4.0,
            color: color),
        const SizedBox(height: 8.0),
        Text(title,
            style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold))
      ],
    );
  }
}
