import 'package:flutter/material.dart';
import 'package:login_test/pages/home.dart';
import 'package:login_test/pages/monitoring_spm.dart';
import 'package:login_test/pages/operasi_pemeliharaan.dart';
import 'package:login_test/pages/self_assesment.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  int _currentIndex = 0;
  List<Widget> _children = [];
  List<String> _appBarTitle = ['Home','SPM','SA','OP'];

  @override
  void initState() {
    super.initState();
    _children.add(Home());
    _children.add(MonitoringSpm());
    _children.add(SelfAssesment());
    _children.add(OperasiPemeliharaan());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _buildBottomNavigationBar(),
          //drawer: HomeDrawer(),
        ));
  }

  Widget _body() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[

        ];
      },
      body: _children[_currentIndex],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _onTabTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.album), label: "SPM"),
        BottomNavigationBarItem(icon: Icon(Icons.videocam), label: "SA"),
        BottomNavigationBarItem(icon: Icon(Icons.ballot), label: "OP"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
    );
  }

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
