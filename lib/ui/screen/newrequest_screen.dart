import 'package:flutter/material.dart';

import '../widgets/custom_dateandtime.dart';

class NewRequestScreen extends StatelessWidget {
  const NewRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "New Request",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFFAAD013),
            ),
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
              Text(
                "Select Member",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black54),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Color.fromARGB(255, 252, 253, 251),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
              Text(
                "Time Range",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Switch(value: false, onChanged: (value) {}),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomDateAndTime(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Time Range",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Switch(value: false, onChanged: (value) {}),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomDateAndTime(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Material(
                  color: Color(0xFFAAD013),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(child: Text("Continue")),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
