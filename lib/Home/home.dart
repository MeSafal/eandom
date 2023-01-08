import 'package:flutter/material.dart';
import 'package:testapp/pages/showres.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
          backgroundColor: Colors.yellow.shade900,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Material(
              color: Colors.amber.shade300,
              elevation: 90,
              shadowColor: Colors.grey,
              child: Image.asset(
                'images/Image.png',
                width: double.infinity,
                height: 250,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey.shade300,
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ApiCall();
                      }));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'British Columbia',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 110,
              margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
              color: Colors.grey.shade300,
              child: Center(
                child: Text(
                  "This 134 kilometers Highway 99 trail gives you a taste of the Canada mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.green,
                    height: 40,
                    width: 150,
                    child: Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    height: 40,
                    width: 150,
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
