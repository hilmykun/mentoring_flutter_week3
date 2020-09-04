part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cAlamat = TextEditingController();

  String nUsername, nEmail, nPassword, nAlamat;

  final _keyForm = GlobalKey<FormState>();

  //Cek value benar/salah
  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataRegister();
      toast("Success Register");
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _keyForm,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 40,
                    child: Text(
                      "Let's Get Started!",
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    height: 20,
                    child: Text(
                      "Create account to get all features!",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: cUsername,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input username';
                    }
                    return null;
                  },
                  onSaved: (value)=> nUsername = cUsername.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Username",
                      hintText: "Username"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: cEmail,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input email';
                    }
                    return null;
                  },
                  onSaved: (value)=> nEmail = cEmail.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Email Address",
                      hintText: "Email Address"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: cPassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input password';
                    }
                    return null;
                  },
                  onSaved: (value)=> nPassword = cPassword.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Password",
                      hintText: "Password"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: cAlamat,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input address';
                    }
                    return null;
                  },
                  maxLines: 3,
                  onSaved: (value)=> nAlamat = cAlamat.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.blur_circular),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Address",
                      hintText: "Address"),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  width: 200,
                  child: RaisedButton(
                      elevation: 0,
                      color: Colors.blue[900],
                      shape: StadiumBorder(),
                      child: Text(
                        "Create",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          checkForm();
                        });
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void submitDataRegister() async {
    final responseData = await http
        .post("http://192.168.56.1/ecommerce/register.php", body: {
      "username": nUsername,
      "password": nPassword,
      "email": nEmail,
      "alamat": nAlamat
    });

    final data = json.decode(responseData.body);

    int value = data['value'];
    String pesan = data['message'];

    //cek validate
    if(value == 1){
      setState(() {
        Navigator.pop(context);
      });
    }else if(value==2){
      print(pesan);
    }else{
      print(pesan);
    }
  }
}
