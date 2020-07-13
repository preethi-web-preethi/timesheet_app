import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timesheetapp/Model/Employee.dart';
import 'package:timesheetapp/View/timesheet_entries.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  final username;
  final password;
  MyHomePage({this.username, this.password});
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(username: username, password: password);
}

class _MyHomePageState extends State<MyHomePage> {
  final username;
  final password;
  _MyHomePageState({this.username, this.password});
  String formatDate(DateTime date) {
    return new DateFormat.yMMMMd().format(date);
  }

  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: <Widget>[
            SizedBox(width: 50.0),
            Text('Timesheet Approval'),
          ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 25.0,
              ),
              tooltip: username,
            ),
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: getRefresh,
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: Employee().empdata.length,
              itemBuilder: (BuildContext context, int i) {
                var data = Employee().empdata[i];
                return Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 10.0,
                    margin: EdgeInsets.all(7.0),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(data['id']),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.person,
                                  color: Colors.pinkAccent, size: 13.0),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(data['ResourceName']),
                            ],
                          ),
                          Row(children: <Widget>[
                            Icon(Icons.work,
                                color: Colors.pinkAccent, size: 12.0),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(data['ProjectName']),
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                color: Colors.pinkAccent,
                                size: 12.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(formatDate(data['dates'][0]['date'])),
                              Text(" - "),
                            ],
                          ),
                          Row(children: <Widget>[
                            SizedBox(width: 16.0),
                            Text(formatDate(data['dates'][4]['date'])),
                          ]),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Timesheet(
                                      empdata: Employee().empdata[i],
                                    )));
                      },
                    ),
                  ),
                );
              }),
        ));
  }
}
