import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  bool isMale = false;
  bool isFemale = false;
  bool onemonth = false;
  bool threemonth = false;

  TimeOfDay _time = TimeOfDay(hour: 5, minute: 15);
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _feescontroller = TextEditingController();
  TextEditingController _batchcontroller = TextEditingController();

  var namevalidate;
  bool isValidate = true;
  var phonevalidate;
  var feevalidate;
  var batchvalidate;
  var male = "male";

  final _headstyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16);
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Personal Information",
                    style: _headstyle,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: TextField(
                  controller: _namecontroller,
                  keyboardType: TextInputType.name,
                  maxLines: 3,
                  minLines: 1,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      errorText: namevalidate, hintText: "Name"),
                )),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: TextField(
                  controller: phonevalidate,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  maxLines: 3,
                  minLines: 1,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      errorText: phonevalidate,
                      suffixIcon: Icon(
                        Icons.contact_phone,
                        color: Colors.green,
                      ),
                      hintText: "Enter Phone number"),
                )),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InputChip(
                      isEnabled: true,
                      labelStyle: TextStyle(color: Colors.white),
                      showCheckmark: false,
                      selected: isMale,
                      onSelected: (value) {
                        if (isMale == false) {
                          setState(() {
                            isMale = true;
                            isFemale = false;
                            male = "male";
                          });
                        } else if (isMale == true) {
                          setState(() {
                            isMale = false;
                            isFemale = true;
                            male = '';
                          });
                        }
                      },
                      selectedColor: Colors.blue,
                      label: Text("Male"),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputChip(
                        isEnabled: true,
                        selected: isFemale,
                        showCheckmark: false,
                        labelStyle: TextStyle(color: Colors.white),
                        selectedColor: Colors.blue,
                        label: Text("Female"),
                        onSelected: (value) {
                          if (isFemale == false) {
                            setState(() {
                              isMale = false;
                              isFemale = true;
                              male = "female";
                            });
                          } else if (isFemale == true) {
                            setState(() {
                              isMale = true;
                              isFemale = false;
                              male = "";
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Payment Info",
                    style: _headstyle,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Text(
                      "Payment Type",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  InputChip(
                    isEnabled: true,
                    labelStyle: TextStyle(color: Colors.white),
                    showCheckmark: false,
                    selected: onemonth,
                    onSelected: (value) {
                      if (onemonth == false) {
                        setState(() {
                          onemonth = true;
                          threemonth = false;
                        });
                      } else if (onemonth == true) {
                        setState(() {
                          onemonth = false;
                          threemonth = true;
                        });
                      }
                    },
                    selectedColor: Colors.blue,
                    label: Text("1 Month"),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChip(
                      isEnabled: true,
                      selected: threemonth,
                      showCheckmark: false,
                      labelStyle: TextStyle(color: Colors.white),
                      selectedColor: Colors.blue,
                      label: Text("3 Months"),
                      onSelected: (value) {
                        if (threemonth == false) {
                          setState(() {
                            onemonth = false;
                            threemonth = true;
                            // ignore: unnecessary_statements
                            male;
                          });
                        } else if (threemonth == true) {
                          setState(() {
                            onemonth = true;
                            threemonth = false;
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _phonecontroller,
                  maxLines: 3,
                  minLines: 1,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      errorText: feevalidate, hintText: "Enter the Fees"),
                )),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Time Slot",
                    style: _headstyle,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: TextField(
                  controller: _batchcontroller,
                  keyboardType: TextInputType.name,
                  maxLines: 3,
                  minLines: 1,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      errorText: batchvalidate,
                      suffix: MaterialButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text("Select Time"),
                        onPressed: () {
                          _selectTime();
                        },
                      ),
                      hintText: "eg.Morning"),
                )),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$_time"),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                passdata();
              },
              child: Text("Save"),
              color: Colors.green,
              textColor: Colors.white,
              minWidth: size.width * 0.01,
              height: 50,
            ),
          )
        ],
      ),
    );
  }

  Future passdata() async {
    // name Validation
    if (_namecontroller.text.isEmpty) {
      setState(() {
        namevalidate = "Please fill the name";
        isValidate = false;
      });
    } else {
      setState(() {
        namevalidate = null;
        isValidate = true;
      });
    }
// Phone validation
    if (_phonecontroller.text.isEmpty) {
      setState(() {
        phonevalidate = "Please fill the name";
        isValidate = false;
      });
    } else {
      setState(() {
        phonevalidate = null;
        isValidate = true;
      });
    }

// Fees Valdation
    if (feevalidate.text.isEmpty) {
      setState(() {
        feevalidate = "Please fill the name";
        isValidate = false;
      });
    } else {
      setState(() {
        feevalidate = null;
        isValidate = true;
      });
    }

// Time validation
    if (_batchcontroller.text.isEmpty) {
      setState(() {
        batchvalidate = "Please fill the name";
        isValidate = false;
      });
    } else {
      setState(() {
        batchvalidate = null;
        isValidate = true;
      });
    }
    if (isValidate) {}
  }
}
