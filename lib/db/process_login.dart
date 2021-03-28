import 'package:http/http.dart';
import 'dart:convert';

import 'package:login_test/db/api.dart';
import 'package:login_test/model/user.dart';
import 'package:login_test/utils/shared_pref_user.dart';

class ProcessLogin {

  var url = Uri.parse(Api.get_token);
  Map params = {};
  int errcode = 0;

  ProcessLogin(this.params);

  void process() async {
    try {
      Response response = await post(url, body: params);
      Map result = jsonDecode(response.body);
      if (result.containsKey('token')){
        Map userdata = result['user'];
        if(userdata['highway_id'] == ''){
          errcode = 2;
        } else {
          User user = User.fromJson({
            'username': params['login'],
            'name': userdata['first_name'],
            'level': userdata['last_name'],
            'email': userdata['email'],
            'highway_id': userdata['highway_id'],
            'password': params['password'],
          });
          SharedPrefUser sharedPrefUser = SharedPrefUser();
          sharedPrefUser.save('userlogin', user.toJson());
        }
      } else {
        errcode = 1;
      }
    } catch (e){
      errcode = 3;
    }
  }

}