import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:timesheetapp/Model/Employee.dart';

class Timesheet extends StatefulWidget {
  final empdata;
  Timesheet({this.empdata});
  @override
  _TimesheetState createState() => _TimesheetState(empdata: empdata);
}

class _TimesheetState extends State<Timesheet> {
  final empdata;

  _TimesheetState({this.empdata});

  String FormatDate(DateTime dateTime) {
    return new DateFormat.d().format(dateTime);
  }

  String formatDate(DateTime date) {
    return new DateFormat.yMMMMd().format(date);
  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }

  void initState() {
    super.initState();
  }

  int hr = 2 + 4;

  String parseDuration(String s) {
    int hours = 00;
    int minutes = 00;
    List<String> parts = s.split(':');
    if (parts.length > 1) {
      hours = int.parse(parts[parts.length - 2]);
    }
    minutes = (double.parse(parts[parts.length - 1])).round();
    if (minutes == 00) {
      return "$hours:00";
    }
    return "$hours:$minutes";
  }

  bool approve_check = true;
  bool deny_check = true;
  Duration duration(var s) {
    int hours = 0;
    int minutes = 00;
    List<String> parts = s.split(':');
    if (parts.length > 1) {
      hours = int.parse(parts[parts.length - 2]);
    }
    minutes = (double.parse(parts[parts.length - 1])).round();
    return Duration(
      hours: hours,
      minutes: minutes,
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }

  List hval = [true, true, true, true, true];
  List bg = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List h = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
//        automaticallyImplyLeading: false
        title: Row(children: <Widget>[
          Text(empdata['ResourceName']),
          SizedBox(
            width: 10.0,
          ),
          Card(
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  empdata['id'],
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ]),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: height * 1.5,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Project Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              empdata['ProjectName'],
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            formatDate(empdata['dates'][0]['date']) +
                                ' - ' +
                                formatDate(empdata['dates'][4]['date']),
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
//                    width: 270.0,
                      height: 50.0,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: 20.0,
                                    height: 20.0,
                                    color: Colors.blue),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Total Submitted Hours',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(':',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.circular(13.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '40:00',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Container(
//                    width: 270.0,
                      height: 50.0,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: 20.0,
                                    height: 20.0,
                                    color: Colors.green),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Total Approved Hours',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  width: 14.0,
                                ),
                                Text(':',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                                SizedBox(
                                  width: 13.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.circular(13.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _printDuration(approve_value)
                                              .toString() ??
                                          '00:00',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Container(
//                    width: 270.0,
                      height: 50.0,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: 20.0,
                                    height: 20.0,
                                    color: Colors.red),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  'Total Denied Hours',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(':',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                                SizedBox(
                                  width: 14.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.circular(13.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _printDuration(deny_value).toString() ??
                                          '00:00',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: width * 1.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: empdata['dates'] == null
                              ? 0
                              : empdata['dates'].length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Card(
                                child: Container(
                                  color: Colors.grey.withOpacity(.5),
                                  padding: EdgeInsets.only(
                                      top: 10.0, right: 10.0, left: 10.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("Task",
                                            style: TextStyle(
                                                fontSize: 21.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      taskmethod("Requirement\nAnalysis"),
                                      taskmethod("Form Design"),
                                      taskmethod("Construction\n(Dev/Fix)"),
                                      taskmethod("Project\nCoordination"),
                                      taskmethod("Testing\n(UT/DIT/SIT)"),
                                      taskmethod("Impl. &\nSupport"),
                                      taskmethod("Meeting"),
                                      taskmethod("Learning\n& Sharing"),
                                      Expanded(
                                        child: Text("Total Hrs",
                                            style: TextStyle(
                                              fontSize: 15.2,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Expanded(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            index -= 1;
                            var user = empdata['dates'][index];
                            return Container(
                              width: 49.0,
                              child: Card(
                                  child: Container(
                                padding: EdgeInsets.only(
                                  top: 10.0,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        FormatDate(user['date']),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 21.0,
                                        ),
                                      ),
                                    ),
                                    methoddata(
                                        empdata, 'dates', index, 'h1', h, bg),
                                    methoddata(
                                        empdata, 'dates', index, 'h2', h, bg),
                                    methoddata(
                                        empdata, 'dates', index, 'h3', h, bg),
                                    methoddata(
                                        empdata, 'dates', index, 'h4', h, bg),
                                    methoddata(
                                        empdata, 'dates', index, 'h5', h, bg),
                                    methoddata(
                                        empdata, 'dates', index, 'h6', h, bg),
                                    methoddata(
                                        empdata, 'dates', index, 'h7', h, bg),
                                    methoddata(
                                        empdata, 'dates', index, 'h8', h, bg),
                                    Expanded(
                                      child: new Text(
                                        parseDuration(user['total'])
                                                .toString() ??
                                            '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                    Checkbox(
                                        value: user['is_active'],
                                        onChanged: (bool value) {
                                          user['is_active'] = value;
                                          setState(() {});
                                        }),
                                  ],
                                ),
                              )),
                            );
                            return Container();
                          }),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton.extended(
                        label: Text(
                          'Approve',
                        ),
                        icon: Icon(Icons.thumb_up),
                        backgroundColor: Colors.green,
                        heroTag: 1,
                        onPressed: () async {
                          if (await _confirmApprove(context) == true) {
                            color_approve(0, Colors.green);
                            color_approve(1, Colors.green);
                            color_approve(2, Colors.green);
                            color_approve(3, Colors.green);
                            color_approve(4, Colors.green);
//                            print(_printDuration(approve_value));
                            setState(() {
                              approve_check = true;
                              if (approve_check == true) {
                                if (approve_value != null) {
                                  approve_value = Duration(minutes: 0);
                                  for (index = 0; index < 5; index++) {
                                    if (empdata['dates'][index]['is_active'] ==
                                        true) {
                                      approved_data.add(parseDuration(
                                          empdata['dates'][index]['total']));
                                      approve_value = Duration(
                                              minutes:
                                                  duration(approved_data[index])
                                                      .abs()
                                                      .inMinutes) +
                                          approve_value;
                                    }
                                  }
                                }
                                print(_printDuration(approve_value));
                                setState(() {});
                              }
                            });
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton.extended(
                        label: Text(
                          'Deny',
                        ),
                        heroTag: 2,
                        icon: Icon(Icons.thumb_down),
                        backgroundColor: Colors.red,
                        onPressed: () async {
                          await _confirmDeny(context);
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List denied_data = [];
  List approved_data = [];
  var den, app;
  int index;
  Duration approve_value = Duration(minutes: 0);
  Duration deny_value = Duration(minutes: 0);

  void color_approve(index, color) {
    if (empdata['dates'][index]['is_active'] == true) {
      h[index] = Colors.white;
      bg[index] = color;
    }
  }

  void color_deny(index, color) {
    if (empdata['dates'][index]['is_active'] == true) {
      h[index] = Colors.white;
      bg[index] = color;
    }
  }

  Expanded taskmethod(title) {
    return Expanded(
      child: Text(title,
          style: TextStyle(
            fontSize: 15.2,
          )),
    );
  }

  Expanded methoddata(empdata, dates, index, i, h, bg) {
    if (empdata[dates][index][i] != null) {
      return Expanded(
          child: Text(parseDuration(empdata[dates][index][i]).toString(),
              style: TextStyle(
                  color: h[index],
                  backgroundColor: bg[index],
                  fontSize:
                      15.0 //                                      color: Colors.green,
                  )));
    } else {
      return Expanded(
          child: Text(
        '0',
        style: TextStyle(
            color: Colors.black,
            fontSize:
                15.0 //                                      color: Colors.green,
            ),
      ));
    }
  }

  TextEditingController _controller = TextEditingController();
  _confirmDeny(BuildContext context) async {
    return showDialog(
        context: (context),
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text("Confirmation"),
              content: Container(
                height: 100,
                child: Column(
                  children: <Widget>[
                    Text(
                        "Are you sure you want to deny? and if 'Yes' give reason"),
                    TextField(
                      autofocus: true,
                      decoration:
                          new InputDecoration(hintText: 'Give Reason...'),
                      controller: _controller,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("No",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black)),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text("Yes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  onPressed: () => {
                    color_deny(0, Colors.red),
                    color_deny(1, Colors.red),
                    color_deny(2, Colors.red),
                    color_deny(3, Colors.red),
                    color_deny(4, Colors.red),
                    setState(() {
                      deny_check = true;
                      if (deny_check == true) {
                        if (deny_value != null) {
                          deny_value = Duration(minutes: 0);
                          for (index = 0; index < 5; index++) {
                            if (empdata['dates'][index]['is_active'] == true) {
                              denied_data.add(parseDuration(
                                  empdata['dates'][index]['total']));
                              deny_value = Duration(
                                      minutes: duration(denied_data[index])
                                          .abs()
                                          .inMinutes) +
                                  deny_value;
                            }
                          }
                        }
                        print(_printDuration(deny_value));
                        setState(() {});
                      }
                    }),
                    setState(() {}),
                    Navigator.of(context).pop(_controller.text.toString())
                  },
                )
              ],
              elevation: 24.0,
            ));
  }

  Future<bool> _confirmApprove(BuildContext context) async {
    return await showDialog(
        context: (context),
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text("Confirmation"),
              content: Text("Are you sure you want to Approve? "),
              actions: <Widget>[
                FlatButton(
                  child: Text("No", style: TextStyle(color: Colors.black)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Yes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
              elevation: 24.0,
            ));
  }
}
