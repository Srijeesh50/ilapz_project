
// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class ApiController{
//     bool isLoading = true;
//   void getData() async {
//     var Url = Uri.parse("https://reqres.in/api/users");
//     final response = await http.get(Url);
//     var json = jsonDecode(response.body);

//     _users = Welcome.fromJson(json);

//     setState(() {
//       isLoading = false;
//     });
//   }

  
// }