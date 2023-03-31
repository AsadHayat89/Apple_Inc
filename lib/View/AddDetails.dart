import 'package:apple_inc/Constants/color.dart';
import 'package:apple_inc/widgets/AnimatedToggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

class AddDetails extends StatefulWidget {
  String name;

  AddDetails({Key? key, required this.name}) : super(key: key);

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  int _toggleValue = 0;
  late DatabaseReference databaseReference;
  List<String> monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> dates = [];
  TextInputFormatter formatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));

  List<List<TextEditingController>> controllers = [];
  List<DataRow> rows = [];

  //for  down addition
  late DateTime now;
  late int yearcount;
  int currentMonthIndex = 0;

  //for up addition
  late int yearcountUp;
  int currentMonthIndexUp = 0;

  addtoDatabase() {
    for (int i = 0; i < rows.length; i++) {
      // databaseReference.child(rows[i].cells[i].)
      String date = dates[i];
      List<TextEditingController> control = controllers[i];
      String value1 = control[0].text;
      String value2 = control[1].text;
      databaseReference.child(date).set({
        'Actual': value1 == "" ? "0000" : value1,
        'Plan': value2 == "" ? "0000" : value2,
      });
    }
  }

  assignValues(List<String> datedata, Map<dynamic, dynamic> data) {
    print("legnth: " + datedata.toString());
    datedata.sort((a, b) {
      int aYear = int.parse(a.substring(a.length - 4));
      int bYear = int.parse(b.substring(b.length - 4));
      int result = aYear - bYear;
      if (result == 0) {
        Map<String, int> months = {
          "Jan": 1,
          "Feb": 2,
          "Mar": 3,
          "Apr": 4,
          "May": 5,
          "Jun": 6,
          "Jul": 7,
          "Aug": 8,
          "Sep": 9,
          "Oct": 10,
          "Nov": 11,
          "Dec": 12,
        };
        String aMonth = a.substring(0, 3);
        String bMonth = b.substring(0, 3);
        result = months[aMonth]! - months[bMonth]!;
      }
      return result;
    });

    print(datedata.toString());
    //datedata.sort();
    int index = 0;
    int year = 0;

    for (int i = 0; i < datedata.length; i++) {
      print(datedata[i]);

      Map<dynamic, dynamic> getData = data[datedata[i]];
      List<TextEditingController> rowControllers = [
        TextEditingController(),
        TextEditingController(),
      ];
      rowControllers[0].text = getData['Actual'];
      rowControllers[1].text = getData['Plan'];
      controllers.add(rowControllers);
      setState(() {
        rows.add(DataRow(
          cells: [
            DataCell(Text(
              datedata[i],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )),
            DataCell(TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  String formattedValue = '';
                  if (value.endsWith('k')) {
                    print("ends");
                    int val =
                        int.tryParse(value.substring(0, value.length - 1)) ?? 0;
                    formattedValue = (val * 1000).toString();
                  } else if (RegExp(r'[a-zA-Z]$').hasMatch(value)) {
                    int val =
                        int.tryParse(value.substring(0, value.length - 1))!;
                    formattedValue = (val).toString();
                  } else {
                    int val = int.tryParse(value.replaceAll(',', '')) ?? 0;
                    formattedValue = val.toString();
                  }
                  if (formattedValue != rowControllers[1].text) {
                    rowControllers[0].value = TextEditingValue(
                      text: formattedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: formattedValue.length),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: "0000",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
                controller: rowControllers[0])),
            DataCell(TextField(
                cursorColor: Colors.white,
                // inputFormatters: [formatter],
                //inputFormatters: [formatter],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  String formattedValue = '';
                  if (value.endsWith('k')) {
                    print("ends");
                    int val =
                        int.tryParse(value.substring(0, value.length - 1)) ?? 0;
                    formattedValue = (val * 1000).toString();
                  } else if (RegExp(r'[a-zA-Z]$').hasMatch(value)) {
                    int val =
                        int.tryParse(value.substring(0, value.length - 1))!;
                    formattedValue = (val).toString();
                  } else {
                    int val = int.tryParse(value.replaceAll(',', '')) ?? 0;
                    formattedValue = val.toString();
                  }
                  if (formattedValue != rowControllers[1].text) {
                    rowControllers[1].value = TextEditingValue(
                      text: formattedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: formattedValue.length),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: "0000",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
                controller: rowControllers[1])),
          ],
        ));
      });

      dates.add(datedata[i]);
      List<String> dat = datedata[i].toString().split(" ");

      index = monthNames.indexOf(dat[0]);
      year = int.parse(dat[1]);
      if (i == 0) {
        yearcountUp = year;
        currentMonthIndexUp = index;
      }
    }
    yearcount = year;
    currentMonthIndex = index + 2;

    print("index are: " +
        currentMonthIndex.toString() +
        "  " +
        yearcount.toString());
    print("index2 are: " +
        currentMonthIndexUp.toString() +
        "  " +
        yearcountUp.toString());
  }

  getDatabase() async {
    List<String> datedata = [];
    databaseReference.once().then((event) {
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      print("sdfsdf " + data.length.toString());

      data.forEach((key, value) {
        datedata.add(key.toString());
      });
      print("at end");
      assignValues(datedata, data);
    });
  }

  void deleteValue(String key) {
    databaseReference.child(key).remove();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference =
        FirebaseDatabase.instance.reference().child(widget.name);
    print("asdfs");
    now = DateTime.now();
    yearcount = now.year;
    yearcountUp = now.year;
    currentMonthIndex = now.month;
    currentMonthIndexUp = now.month - 1;
    getDatabase();
  }

  void addRowUp() {
    print("value of index  " + currentMonthIndexUp.toString());
    //String currentMonth = months[currentMonthIndex];
    List<TextEditingController> rowControllers = [
      TextEditingController(),
      TextEditingController(),
    ];
    controllers.insert(0, rowControllers);
    print("Current data value is: " + (currentMonthIndexUp % 12).toString());
    final nextMonth = DateTime(yearcountUp, currentMonthIndexUp % 12, 1);
    final formattedMonth = DateFormat('MMM yyyy').format(nextMonth);
    dates.insert(0, formattedMonth);
    rows.insert(
        0,
        DataRow(
          cells: [
            DataCell(Text(
              formattedMonth,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )),
            DataCell(TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  String formattedValue = '';
                  if (value.endsWith('k')) {
                    print("ends");
                    int val =
                        int.tryParse(value.substring(0, value.length - 1)) ?? 0;
                    formattedValue = (val * 1000).toString();
                  } else if (RegExp(r'[a-zA-Z]$').hasMatch(value)) {
                    int val =
                        int.tryParse(value.substring(0, value.length - 1))!;
                    formattedValue = (val).toString();
                  } else {
                    int val = int.tryParse(value.replaceAll(',', '')) ?? 0;
                    formattedValue = val.toString();
                  }
                  if (formattedValue != rowControllers[1].text) {
                    rowControllers[0].value = TextEditingValue(
                      text: formattedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: formattedValue.length),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: "0000",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
                controller: rowControllers[0])),
            DataCell(TextField(
                cursorColor: Colors.white,
                // inputFormatters: [formatter],
                //inputFormatters: [formatter],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  String formattedValue = '';
                  if (value.endsWith('k')) {
                    print("ends");
                    int val =
                        int.tryParse(value.substring(0, value.length - 1)) ?? 0;
                    formattedValue = (val * 1000).toString();
                  } else if (RegExp(r'[a-zA-Z]$').hasMatch(value)) {
                    int val =
                        int.tryParse(value.substring(0, value.length - 1))!;
                    formattedValue = (val).toString();
                  } else {
                    int val = int.tryParse(value.replaceAll(',', '')) ?? 0;
                    formattedValue = val.toString();
                  }
                  if (formattedValue != rowControllers[1].text) {
                    rowControllers[1].value = TextEditingValue(
                      text: formattedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: formattedValue.length),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: "0000",
                  hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
                controller: rowControllers[1])),
          ],
        ));

    if (currentMonthIndexUp % 12 == 0) {
      print("lenght greater hogyi");
      //currentMonthIndex = 0;

      yearcountUp--;
    }
    currentMonthIndexUp--;
    setState(() {});
  }

  void addRow() {
    print("value of index  " + currentMonthIndex.toString());
    //String currentMonth = months[currentMonthIndex];
    List<TextEditingController> rowControllers = [
      TextEditingController(),
      TextEditingController(),
    ];
    controllers.add(rowControllers);
    print("Current data value is: " + (currentMonthIndex % 12).toString());
    final nextMonth = DateTime(yearcount, currentMonthIndex % 12, 1);
    final formattedMonth = DateFormat('MMM yyyy').format(nextMonth);
    dates.add(formattedMonth);
    rows.add(DataRow(
      cells: [
        DataCell(Text(
          formattedMonth,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        )),
        DataCell(TextField(
            cursorColor: Colors.white,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              String formattedValue = '';
              if (value.endsWith('k')) {
                print("ends");
                int val =
                    int.tryParse(value.substring(0, value.length - 1)) ?? 0;
                formattedValue = (val * 1000).toString();
              } else if (RegExp(r'[a-zA-Z]$').hasMatch(value)) {
                int val = int.tryParse(value.substring(0, value.length - 1))!;
                formattedValue = (val).toString();
              } else {
                int val = int.tryParse(value.replaceAll(',', '')) ?? 0;
                formattedValue = val.toString();
              }
              if (formattedValue != rowControllers[1].text) {
                rowControllers[0].value = TextEditingValue(
                  text: formattedValue,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: formattedValue.length),
                  ),
                );
              }
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: "0000",
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.w500),
            ),
            style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w500),
            controller: rowControllers[0])),
        DataCell(TextField(
            cursorColor: Colors.white,
            // inputFormatters: [formatter],
            //inputFormatters: [formatter],
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              String formattedValue = '';
              if (value.endsWith('k')) {
                print("ends");
                int val =
                    int.tryParse(value.substring(0, value.length - 1)) ?? 0;
                formattedValue = (val * 1000).toString();
              } else if (RegExp(r'[a-zA-Z]$').hasMatch(value)) {
                int val = int.tryParse(value.substring(0, value.length - 1))!;
                formattedValue = (val).toString();
              } else {
                int val = int.tryParse(value.replaceAll(',', '')) ?? 0;
                formattedValue = val.toString();
              }
              if (formattedValue != rowControllers[1].text) {
                rowControllers[1].value = TextEditingValue(
                  text: formattedValue,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: formattedValue.length),
                  ),
                );
              }
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: "0000",
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.w500),
            ),
            style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w500),
            controller: rowControllers[1])),
      ],
    ));
    currentMonthIndex++;
    if (currentMonthIndex % 12 == 0) {
      print("lenght greater hogyi");
      //currentMonthIndex = 0;
      yearcount++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                color: AppColor.background1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "KPIs | Apple Inc",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColor.background1, // background color
                    borderRadius: BorderRadius.circular(10), // rounded corners
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Container(
                            width: width / 1.3,
                            child: Text(
                              "The Revenue KPI refers to all money earned from regular business activities in a set period.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  height: 2,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add / Delete Row",
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: AnimatedToggle(
                            values: ['Down', 'up'],
                            onToggleCallback: (value) {
                              setState(() {
                                _toggleValue = value;
                              });
                            },
                            buttonColor: AppColor.background1,
                            backgroundColor: Colors.white,
                            textColor: Color(0xFFFFFFFF),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_toggleValue == 0) {
                              addRow();
                            } else {
                              addRowUp();
                            }
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(Icons.add),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_toggleValue == 0) {
                                rows.removeLast();
                                currentMonthIndex--;
                                deleteValue(dates[dates.length - 1]);
                                //print(dates[dates.length-1]);
                                dates.removeLast();
                                controllers.removeLast();
                                if (currentMonthIndex % 12 == 0) {
                                  print("lenght greater hogyi");
                                  //currentMonthIndex = 0;
                                  yearcount--;
                                }
                                print("values after decresssed: " +
                                    currentMonthIndex.toString());
                              } else {
                                rows.removeAt(0);
                                currentMonthIndexUp++;
                                deleteValue(dates[0]);
                                dates.removeAt(0);
                                controllers.removeAt(0);
                                if (currentMonthIndexUp % 12 == 0) {
                                  print("lenght greater hogyi");
                                  //currentMonthIndex = 0;
                                  yearcountUp++;
                                }
                              }
                            });
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  color: AppColor.background1,
                  width: width,
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text('Date',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Actual',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Plan',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ],
                    rows: rows,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: width / 2,
                        child: Center(
                            child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Lenght of array is: " + rows.length.toString());
                        addtoDatabase();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.saveButton,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              "Save Settings",
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
