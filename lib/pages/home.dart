import 'package:flutter/material.dart';
import 'package:login_test/model/user.dart';
import 'package:login_test/utils/shared_pref_user.dart';
import 'package:rounded_button/rounded_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String nama = '';
  SharedPrefUser sharedPrefUser = SharedPrefUser();

  void checkLogin() async {
    try {
      User userLogin = User.fromJson(await sharedPrefUser.read('userlogin'));
      print(userLogin.username);
      setState(() {
        nama = userLogin.name;
      });
    } catch (e){
      print(e);
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void logout() async {
    try {
      await sharedPrefUser.remove('userlogin');
      Navigator.pushReplacementNamed(context, '/login');
    } catch(e) {
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Column(
          children: <Widget>[
            Text(
              nama,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 50),
            RoundedButton(
                text: 'Logout',
                onPressed: logout,
                primaryColor: Colors.cyanAccent),
          ],
        ),
      ),
    );
  }
}
