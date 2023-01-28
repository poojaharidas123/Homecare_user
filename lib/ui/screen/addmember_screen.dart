import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homecare_user/ui/screen/custom_meditation.dart';
import 'package:homecare_user/ui/widgets/custom_dateandtime.dart';

import '../widgets/custom_button.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Add Member",
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFFAAD013),
          ),
        ),
      ),
      backgroundColor: Color(0xFFE3F3DF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Name",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.7),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Gender",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.7),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Age",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.7),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: Colors.black,
                      ),
                  "Health Conditions",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Conditions",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.7),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Color.fromARGB(255, 252, 253, 251),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: Colors.black,
                      ),
                  "Meditations",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintText: "Name",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.7),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomMeditation(),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                label: "Save",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
