import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Environbment News",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.green[100],
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/u.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "US rules out compromise with China on intellectual property theft, South China sea for climate change",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.green[100],
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/q.webp"),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Britons To Plant Trees To Mark Queen Elizabeth's 70 Years On Throne",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.green[100],
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/gfl.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "GFL Environmental (NYSE:GFL) Coverage Initiated at Barclays",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Colors.green[100],
                height: 300,
                width: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/la.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Los Angeles lifts air-quality limits for cremations amid a backlog of bodies caused by COVID-19",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
