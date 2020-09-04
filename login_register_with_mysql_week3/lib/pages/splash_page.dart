part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 300,
                        child: LottieBuilder.asset("assets/aquarium.json"),
                      ),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 16),
                        child: Text(
                          "Fish Market",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Text(
                        "Place Where if u buy fish cupang with \n best quality!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: 250,
                        height: 46,
                        margin: EdgeInsets.only(top: 60, bottom: 20),
                        child: RaisedButton(
                            color: Colors.blue,
                            shape: StadiumBorder(),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              Get.off(LoginPage());
                            }),
                      ),
                    ],
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
