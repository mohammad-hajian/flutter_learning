class User {
  int _id;
  String _username;
  String _password;

  String get username =>_username;
  String get password =>_password;
  int get id =>_id;

  User(this._username, this._password);

  User.map(dynamic obj){
    this._username = obj['username'];
    this._password = obj['password'];
    this._id = obj['id'];
  }

  User.fromMap( Map<String, dynamic> map){   //Map<key, value>
    this._username = map['username'];
    this._password = map['password'];
    this._id = map['id'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['username'] = _username;
    map['password'] = _password;
    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }
}