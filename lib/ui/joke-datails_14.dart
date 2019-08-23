import 'package:flutter/material.dart';
import 'package:flutter_app/models/joke.dart';

class JokeDetails extends StatelessWidget {

  JokeDetails({@required this.isInTableLayout, @required this.joke});

  final bool isInTableLayout;
  final Joke joke;

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(joke?.setup ?? 'no joke selected', style: textTheme.headline,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(joke?.punchline ?? 'please select a joke', style: textTheme.subhead,),
        )
      ],
    );

    if (isInTableLayout) {
      return Center(
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(joke?.type ?? 'no jokes'),),
      backgroundColor: Colors.purple,
      body: Center(child: content,),
    );
  }

}
