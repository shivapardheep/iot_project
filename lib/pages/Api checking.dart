import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
          'http://www.randomnumberapi.com/api/v1.0/random?min=30&max=40&count=5');
      setState(() {
        fetchdata = response.data;
      });
      print(response.data[2]);
    } catch (e) {
      print(e);
    }
  }

  // post data
  Future login() async {
    const api = "https://ant.datainsightia.in/api/is_user";
    final data = {"username": "aisd", "password": "12345"};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      print(response.data);
    }
  }

  var fetchdata;

  @override
  void initState() {
    super.initState();
    // getHttp();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Data"),
      ),
      body: Center(
        child: fetchdata == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++) ...{
                    Text("${fetchdata[i].toString()}"),
                  }
                ],
              ),
      ),
    );
  }
}
