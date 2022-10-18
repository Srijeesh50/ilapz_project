import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ilapz_project/model/post.dart';

class SearchName extends StatefulWidget {
  const SearchName({super.key, required this.userDetails});
  final List<Welcome> userDetails;

  @override
  State<SearchName> createState() => _SearchNameState();
}

class _SearchNameState extends State<SearchName> {
  List<Welcome> foundUsers = [];
  @override
  void initState() {
    foundUsers = widget.userDetails;
    // TODO: implement initState
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Welcome> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.userDetails;
    } else {
      results = widget.userDetails
          .where((user) =>
              user.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  _runFilter(value);
                },
                decoration: InputDecoration(
                    labelText: 'search', suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: foundUsers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // key: ValueKey(userDetails[index].name),
                      color: Colors.blue,
                      child: ListTile(
                          leading: Text(foundUsers[index].name.toString())),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
