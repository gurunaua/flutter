import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahasiswa/widgets/notes_tab_bar_view.dart';
import 'package:mahasiswa/widgets/profile_tab_bar_view.dart';
import 'package:mahasiswa/widgets/schedule_tab_bar_view.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Tab> tabs = <Tab>[
    Tab(
      icon: new Icon(Icons.home),
      text: 'PROFILE',
    ),
    Tab(
      text: 'SCHEDULE',
    ),
    Tab(
      text: 'NOTES',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white),
            tabs: tabs,
          ),
        ),
        body: TabBarView(children: [
          ProfileTabBarView(),
          ScheduleTabBarView(),
          NotesTabBarView(),
        ]),
      ),
    );
  }
}
