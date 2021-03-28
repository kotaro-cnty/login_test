import 'package:flutter/material.dart';
import 'package:login_test/db/process_login.dart';
import 'package:login_test/utils/shared_pref_user.dart';
import 'package:rounded_button/rounded_button.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login> {

  double topHeight = 300;

  String username = '', password = '';
  bool _secureText = true;
  SharedPrefUser sharedPrefUser = SharedPrefUser();

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    if (username.isEmpty || password.isEmpty){
      Toast.show("Username atau password harus diisi", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    } else {
      login();
    }
  }

  void login() async {
    ProcessLogin processLogin = ProcessLogin({"login": username, "password": password});
    await processLogin.process();
    if (processLogin.errcode == 0){
      Navigator.pushReplacementNamed(context, '/main_menu');
    } else if (processLogin.errcode == 1){
      Toast.show("Username atau password salah", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    } else if (processLogin.errcode == 2) {
      Toast.show("Akun ini tidak bisa digunakan di BUJT", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    } else {
      Toast.show("Ada kesalahan pada sistem", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }
  }

  void checkLogin() async {
    try {
      if (await sharedPrefUser.isLogin('userlogin') == true){
        Navigator.pushReplacementNamed(context, '/main_menu');
      }
    } catch (e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Colors.orange,
              Colors.white,
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
          children: [
            SizedBox(height: topHeight),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Silahkan Login',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Masukan email dan password anda',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Username',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              onChanged: (e) => username = e,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.grey[200], width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Password',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              obscureText: _secureText,
              onChanged: (e) => password = e,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.grey[200], width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  onPressed: showHide,
                  icon: Icon(_secureText
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
            ),
            SizedBox(height: 50),
            RoundedButton(
              text: 'Login',
              textStyle: TextStyle(
                fontSize: 17,
              ),
              padding: EdgeInsets.fromLTRB(150, 20, 150, 20),
              onPressed: () {check();},
              elevation: 0,
              borderRadius: BorderRadius.circular(30),
              borderColor: Colors.yellow[600],
              backgroundColor: Colors.yellow[600],
              textColor: Colors.black,
              primaryColor: Colors.black,
            ),
            SizedBox(height: 100,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Powered by : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                      'assets/logo.png',
                      width: 16,
                      height: 16,
                      fit:BoxFit.fill
                  ),
                  Text(
                    '  Pekerjaan Umum dan Perumahan Rakyat',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
