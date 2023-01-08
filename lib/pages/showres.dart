import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/Home/home.dart';
// import 'package:testapp/main.dart';
import 'package:testapp/pages/Api.dart' as api;

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  List<api.Post> samplePosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Container(
          //   child: Material(
          //     elevation: 50,
          //     shadowColor: Colors.grey,
          //     child: Image.asset(
          //       'images/Imgs.jpg',
          //       width: double.infinity,
          //       height: 250,
          //     ),
          //   ),
          //   // SizedBox(
          //   //   height: 30,
          //   // ),
          // ),
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  // itemCount: 2,
                  itemCount: samplePosts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Colors.transparent,
                          shadowColor: Colors.grey,
                          elevation: 15,
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/Image.png'),
                                  // backgroundImage: Image.network((samplePosts[index].img).toString()),
                                  radius: 45,
                                  backgroundColor: Colors.transparent,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '    ${samplePosts[index].name}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          'Rs ${samplePosts[index].price}/-',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Text(
                                    //   'Title: ${samplePosts[index].name}',
                                    //   style: const TextStyle(fontSize: 18),
                                    // ),
                                    // Text(
                                    //   'Body: ${samplePosts[index].description}',
                                    //   style: const TextStyle(fontSize: 18),
                                    // ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 75,
                                      width: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HomePage();
                                        }));
                                      },
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<api.Post>> getData() async {
    final response = await http.get(
      Uri.parse(
        'http://mark.bslmeiyu.com/api/getplaces',
      ),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(api.Post.fromJson(index));
      }

      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
