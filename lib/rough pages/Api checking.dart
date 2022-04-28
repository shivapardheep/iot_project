import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:iot_project/rough%20pages/api%20function.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  // get data
  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://bae4-2409-4072-618b-fcf8-9530-a1f8-eb3a-6ed0.ngrok.io/api/devices/?format=json');
      setState(() {
        fetchGetData = response.data;
      });
      print(response.data[2]);
    } catch (e) {
      print(e);
    }
  }

  //post to get
  void postHttp() async {
    try {
      var response = await Dio().post(
          "https://bae4-2409-4072-618b-fcf8-9530-a1f8-eb3a-6ed0.ngrok.io/api/chart",
          data: {"device_id": "002"});
      setState(() {
        fetchPostData = response.data;
        print(fetchPostData["temperature"]);
      });
    } catch (e) {
      print(e);
    }
  }

  // post data
  late Future<Autogenerated> _futureBuilder;
  // Future<Autogenerated> fetchAlbum() async {
  //   final response =
  //       await http.get(Uri.parse('https://ant.datainsightia.in/api/log'));
  //   _finddata = response.body;
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Autogenerated.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  // Future login() async {
  //   const api = "https://ant.datainsightia.in/api/is_user";
  //   final data = {"username": "aisd", "password": "12345"};
  //   final dio = Dio();
  //   Response response;
  //   response = await dio.post(api, data: data);
  //   if (response.statusCode == 200) {
  //     print(response.data);
  //   }
  // }

  var fetchGetData;
  var fetchPostData;

  @override
  void initState() {
    super.initState();
    // getHttp();
    postHttp();
    // login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Data"),
      ),
      body: Center(
        child: Text(fetchGetData == null
            ? "loading..."
            : "${fetchGetData[4]['device']}"),
      ),
    );
  }
}