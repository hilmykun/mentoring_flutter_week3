part of 'pages.dart';

class MainPage extends StatefulWidget {
  final VoidCallback signOut;
  MainPage(this.signOut);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var loading = false;

  signOut() async {
    setState(() {
      widget.signOut();
    });
  }

  String username = "";
  String email = "";
  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString("username");
      email = sharedPreferences.getString("email");
    });
  }

  @override
  void initState() {
    getDataPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: ListView(
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/ic_profile6.png"),
                        height: 100,
                      ),
                      Text(
                        ('Hi,' + username),
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        (email),
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(right: 100, left: 100),
            child: Container(
              child: RaisedButton(
                elevation: 0,
                color: Colors.blue[900],
                shape: StadiumBorder(),
                onPressed: () {
                  signOut();
                  toast("Log Out Success");
                },
                child: Text(
                  "Log Out!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  toast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue[200],
        textColor: Colors.white,
        fontSize: 15);
  }
}
