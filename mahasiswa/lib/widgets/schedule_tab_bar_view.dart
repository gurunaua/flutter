import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mahasiswa/model/schedule_model.dart';
import 'package:mahasiswa/util.dart';

class ScheduleTabBarView extends StatefulWidget {
  @override
  _ScheduleTabBarViewState createState() => _ScheduleTabBarViewState();
}

class _ScheduleTabBarViewState extends State<ScheduleTabBarView> {
  List<Schedule> _schedules = schedules;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView.builder(
          itemCount: _schedules.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: index % 2 == 0 ? Colors.black12 : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _schedules[index].subject.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Teacher: " + _schedules[index].teacher.name,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          formatTimeOfDay(_schedules[index].start),
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'to',
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formatTimeOfDay(_schedules[index].end),
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
