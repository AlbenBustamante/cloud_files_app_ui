import 'package:cloud_files/pages/project_page.dart';
import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({super.key});

  @override
  State<TeamFolderPage> createState() => _TeamFolderPageState();
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  double _availableScreenWidth = 0;
  int _selectedIndex = 0;

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
          const Divider(height: 20.0),
          Expanded(
              child: ListView(padding: const EdgeInsets.all(25.0), children: [
            const Text("Recently updated",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15.0),
            Row(children: [
              _buildFileColumn('sketch', 'desktop', '.sketch'),
              SizedBox(width: _availableScreenWidth * .03),
              _buildFileColumn('sketch', 'mobile', '.sketch'),
              SizedBox(width: _availableScreenWidth * .03),
              _buildFileColumn('prd', 'interaction', '.prd'),
            ]),
            const Divider(height: 60.0),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Projects',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text('Create new',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold))
                ]),
            const SizedBox(height: 20.0),
            _buildProjectFolderRow('Chatbox'),
            _buildProjectFolderRow('TimeNote'),
            _buildProjectFolderRow('Something'),
            _buildProjectFolderRow('Other')
          ]))
        ]),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (selectedIndex) {
              setState(() {
                _selectedIndex = selectedIndex;
              });
            },
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time), label: 'Time'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_box), label: 'Folder')
            ]),
        floatingActionButton: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 7.0, blurRadius: 1.0)
          ]),
          child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.blue,
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white)),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  GestureDetector _buildProjectFolderRow(String folderName) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProjectPage(folderName)));
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 65.0,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(Icons.folder, color: Colors.blue[200]),
                const SizedBox(width: 12.0),
                Text(folderName, style: const TextStyle(fontSize: 16.0))
              ]),
              IconButton(
                icon: const Icon(Icons.more_vert_rounded, color: Colors.grey),
                onPressed: () {},
              )
            ],
          )),
    );
  }

  Column _buildFileColumn(String image, String filename, String ext) {
    return Column(
      children: [
        Container(
            width: _availableScreenWidth * .31,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.all(38.0),
            height: 110.0,
            child: Image.asset("assets/images/$image.png")),
        const SizedBox(height: 15.0),
        RichText(
            text: TextSpan(
                text: filename,
                style: const TextStyle(color: Colors.black, fontSize: 14.0),
                children: [
              TextSpan(
                  text: ext,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0))
            ])),
      ],
    );
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
