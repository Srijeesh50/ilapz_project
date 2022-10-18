import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:ilapz_project/model/post.dart';
import 'package:ilapz_project/views/employeesdetails.dart';
import 'package:ilapz_project/views/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selected = false;
  bool isLoading = true;
  List<Welcome> employeeslist = [];

  void getData() async {
    var url = Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986");
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        employeeslist.add(Welcome.fromJson(data[i]));
        print("DATA >>> $data");
      }
    } on Exception catch (e) {
      print(e.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchName(userDetails: employeeslist);
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Center(
          child: Text(
            'API INTEGRATION',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: employeeslist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EmployDetails(
                        userdetail: employeeslist.elementAt(index));
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                          employeeslist[index].profileImage.toString()),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(employeeslist[index].name.toString()),
                        Text(employeeslist[index].company.toString()),
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
