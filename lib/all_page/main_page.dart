import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageStatus createState() => _MenuPageStatus();
}

class _MenuPageStatus extends State<MenuPage> {
  TabController _tabController;

  var _tabs = <Widget>[
    Tab(icon: Icon(GroovinMaterialIcons.language_javascript)),
    Tab(icon: Icon(GroovinMaterialIcons.language_cpp))
  ];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Future Bass'),
              centerTitle: true,
              bottom: TabBar(
                isScrollable: true,

                controller: _tabController,
                tabs: _tabs
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                new Center(
                  child: Text('javascript'),
                ),
                new Center(
                  child: Text('cpp'),
                )
              ],
            )
        ),
    );
  }
}