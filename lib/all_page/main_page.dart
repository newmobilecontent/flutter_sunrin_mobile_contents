import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageStatus createState() => _MenuPageStatus();
}

class _MenuPageStatus extends State<MenuPage> {
  // 탭
  TabController _tabController;
  // 화면 이동 애니메이션
  var _currentPage = 0.0;
  final PageController _pageController = PageController();

  var _tabs = <Widget>[
    Tab(icon: Icon(GroovinMaterialIcons.language_javascript)),
    Tab(icon: Icon(GroovinMaterialIcons.language_cpp))
  ];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(                // TabBar과 TabBarView를 사용할때 꼭 사용해야하는 Widget
        length: _tabs.length,                   // Tabs 개수에 따라 해야함
        child: NotificationListener(
          onNotification: (ScrollNotification note) {
            setState(() {
              _currentPage = _pageController.page;
            });
          },
          child:  Scaffold(
              appBar: AppBar(
                title: Text('Future Bass'),
                centerTitle: true,
                bottom: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    tabs: _tabs
                ),
              ),
              body: _everyPage(_tabs)
          ),
        ),
    );
  }
}


class _everyPage extends StatelessWidget {
  _everyPage(List<Widget> getWidgetList, {Key key}) : super(key: key);

  TabController _tabController;
  final getWidgetList = <Widget>[];     // 부모의 Widget리스트 얻기

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[               // 서버에서 API가져오기
        Center(
          child: Text('asdfasdf'),
        ),
        Center(
          child: Text('1asdfcdas'),
        )
      ],
    );
  }
}