import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:login_test/db/get_monitoring_spm.dart';
import 'package:login_test/model/monitoring.dart';
import 'package:login_test/model/monitoring_model.dart';
import 'package:toast/toast.dart';
import 'package:fdottedline/fdottedline.dart';

class MonitoringSpm extends StatefulWidget {
  @override
  _MonitoringSpmState createState() => _MonitoringSpmState();
}

class _MonitoringSpmState extends State<MonitoringSpm> with SingleTickerProviderStateMixin {


  // Tab Variable
  int currentTab = 0;

  List<List<MonitoringModel>> lists = [[],[],[]];

  List<bool> firstLoad = [false,false,false];
  List<int> pages = [1,1,1];
  List<int> countData = [0,0,0];
  List<Map<String, String>> params = [
    {'repair_status' : 'UNFINISHED'},
    {'repair_status' : 'FINISHED'},
    {}];
  // End Tab Variable

  List<MonitoringModel> listMonitoring = [];

  void getMonitoringSpm() async {
    int now = currentTab;
    params[now]['pagenumber'] = pages[now].toString();
    GetMonitoringSpm getMonitoringSpm = GetMonitoringSpm(lists[now],
        params[now], countData[now]);
    await getMonitoringSpm.get_monitoring_spm();
    setState(() {
      lists[now] = getMonitoringSpm.list;
      countData[now] = getMonitoringSpm.countData;
      if(getMonitoringSpm.countData == 10){
        pages[now]++;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getMonitoringSpm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'Hi, Pondok Aren - Serpong',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Avenir',
                ),
              ),
              Text(
                'Selamat datang lagi di BUJT',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontFamily: 'Avenir',
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Monitoring',
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
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Monitoring',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Avenir',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                      child: Column(
                        children: [
                          Text(
                            'Belum Diperbaiki',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Avenir',
                              color: currentTab == 0 ? Colors.orange : Colors.grey[400],
                              fontWeight: currentTab == 0 ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          Divider(
                            thickness: 4,
                            color: currentTab == 0 ? Colors.orange : Colors.transparent,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          currentTab = 0;
                          if (!firstLoad[currentTab]){
                            firstLoad[currentTab] = true;
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Column(
                        children: [
                          Text(
                            'Sudah Diperbaiki',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Avenir',
                              color: currentTab == 1 ? Colors.orange : Colors.grey[400],
                              fontWeight: currentTab == 1 ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          Divider(
                            thickness: 4,
                            color: currentTab == 1 ? Colors.orange : Colors.transparent,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          currentTab = 1;
                          if (!firstLoad[currentTab]){
                            firstLoad[currentTab] = true;
                            getMonitoringSpm();
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child:  Column(
                        children: [
                          Text(
                            'Informasi',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Avenir',
                              color: currentTab == 2 ? Colors.orange : Colors.grey[400],
                              fontWeight: currentTab == 2 ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          Divider(
                            thickness: 4,
                            color: currentTab == 2 ? Colors.orange : Colors.transparent,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          currentTab = 2;
                          if (!firstLoad[currentTab]){
                            firstLoad[currentTab] = true;
                            getMonitoringSpm();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: lists[currentTab].length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    lists[currentTab][index].monitoringImages,
                                    height: 80,
                                    width: 80,
                                    errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                                      return Image.asset(
                                        'assets/imgno.jpg',
                                        height: 80,
                                        width: 80,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lists[currentTab][index].indicatorName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${lists[currentTab][index].highwayName}, KM ${lists[currentTab][index].sta}',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 13,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '${lists[currentTab][index].lane}, ${lists[currentTab][index].direction}',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 13,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '${lists[currentTab][index].monitoringPeriod}',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 13,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '2000Meters',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 13,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    if (lists[currentTab][index].repairStatus == 'FINISHED') Row(
                                      children: [
                                        Text(
                                          'Durasi Penanganan : ',
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 13,
                                            fontFamily: 'Avenir',
                                          ),
                                        ),
                                        Text(
                                          '2 Hari 2 Jam 3 Menit',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Avenir',
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FDottedLine(
                                          color: Colors.grey[200],
                                          width: 100,
                                          strokeWidth: 2.5,
                                          dottedLength: 5.0,
                                          space: 5.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[200],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

