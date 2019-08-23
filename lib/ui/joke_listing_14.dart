import 'package:flutter/material.dart';
import 'package:flutter_app/models/joke.dart';

class JokeListing extends StatelessWidget {

  JokeListing({@required this.jokeSelectedCallback, @required this.jokeSelected});

  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke jokeSelected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke){
        return Container(
          child: ListTile(
            title: Text(joke.setup),
            onTap: ()=> jokeSelectedCallback(joke),
            selected: jokeSelected == joke,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0)
          ),
        );
      }).toList()
    );
  }

}
