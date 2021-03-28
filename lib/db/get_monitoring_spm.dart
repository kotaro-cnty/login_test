import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:login_test/db/api.dart';
import 'package:login_test/model/monitoring.dart';
import 'package:login_test/model/monitoring_model.dart';
import 'package:login_test/model/user.dart';
import 'package:login_test/utils/shared_pref_user.dart';

class GetMonitoringSpm {

  SharedPrefUser sharedPrefUser = SharedPrefUser();
  var url = Uri.parse(Api.get_monitoring_spm);
  List<MonitoringModel> list = [];
  int countData = 0;
  int errcode = 0;
  Map<String, String> params = {};

  GetMonitoringSpm(this.list, this.params, this.countData);

  void get_monitoring_spm() async {
    try {
      // Get Token
      User user = User.fromJson(await sharedPrefUser.read('userlogin'));
      Map<String, String> loginparams = {
        'login': user.username, 'password': user.password
      };
      Response response = await post(Uri.parse(Api.get_token), body: loginparams);
      Map resultlogin = jsonDecode(response.body);
      params['token'] = resultlogin['token'];
      params['perpage'] = '10';
      // Get Monitoring SPM
      final finalUri = url.replace(queryParameters: params);
      Response responseMonitoring = await get(finalUri);
      final result = jsonDecode(responseMonitoring.body);
      for(Map<String, dynamic> i in result['monitoring']){
        list.add(MonitoringModel.fromJson(i));
      }
    } catch (e) {
      print(e);
      errcode = 3;
    }
  }

}