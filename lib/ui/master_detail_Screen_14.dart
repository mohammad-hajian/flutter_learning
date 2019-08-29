import 'package:flutter/material.dart';
import 'package:flutter_app/models/joke.dart';

import 'joke-datails_14.dart';
import 'joke_listing_14.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tabletBreakpoint = 600;
  Joke _selectedJoke;

  Widget _buildMobileLayout() {
    return JokeListing(jokeSelectedCallback: (jokeSelected) {
      Navigator.push(context,
       MaterialPageRoute(builder: (BuildContext context){
         return JokeDetails(isInTableLayout: false, joke: jokeSelected,);
       })
      );
    }
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(flex: 1,
          child: Material(
            elevation: 13.0,
            child: JokeListing(jokeSelectedCallback: (joke){
                      setState(() {
                        _selectedJoke = joke;
                      });
            }, jokeSelected: _selectedJoke,),
          )
         ),
        Flexible(
            flex: 3,
            child: JokeDetails(isInTableLayout: true, joke: _selectedJoke)
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait && shortestSide<tabletBreakpoint) {
      content = _buildMobileLayout();
    }else{
content = _buildTabletLayout();
    }
    return Scaffold(
      appBar: AppBar(title: Text('jokes')),
      body: content
    );
  }
}
