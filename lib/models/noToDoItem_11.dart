import 'package:flutter/material.dart';

class NoToDoItem extends StatelessWidget {

  String _itemName;
  String _dateCreate;
  int _id;
  String get itemName => _itemName;
  String get dateCreate => _dateCreate;
  int get id => _id;

  NoToDoItem(this._itemName, this._dateCreate);


  NoToDoItem.update(this._itemName, this._dateCreate, this._id);

  NoToDoItem.map(dynamic obj){
    this._id = obj['id'];
    this._dateCreate = obj['dateCreate'];
    this._itemName = obj['itemName'];
  }

  NoToDoItem.fromMap(Map<String, dynamic> map){
    this._itemName = map['itemName'];
    this._dateCreate = map['dateCreate'];
    this._id = map['id'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['itemName'] = _itemName;
    map['dateCreate'] = _dateCreate;
    if (_id != null) {
      map["id"] = _id ;
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              _itemName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.white
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              _dateCreate,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontStyle: FontStyle.italic
              ),
            ),
          )
        ],
      ),
    );
  }


}
