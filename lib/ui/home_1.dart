import 'package:flutter/material.dart';

//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text("Testing"),
//        backgroundColor: Colors.blue,
//      ),
//    );
//  }
//}


//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Material(
//      color: Colors.blue,
//      child: new Center(
//        child: new Text(
//          "Welcom to Home",
//          style: new TextStyle(
//              color: Colors.amberAccent,
//              fontSize: 34.5
//          ),
//        ),
//      ),
//    );
//  }
//}



//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//        color: Colors.blue,
//
////      alignment: Alignment.center,
////      child: new Text(
////        "Hello Container",
////        style: new TextStyle(
////            color: Colors.amberAccent,
////            fontSize: 34.5
////        ),
////      ),
//
////      child: new Column(
////        mainAxisAlignment: MainAxisAlignment.center,
////        children: <Widget>[
////          new Text("first Text", style: TextStyle(color: Colors.deepOrange),),
////          new Text("twice Text", style: TextStyle(color: Colors.pink)),
////          new Container(
////            color: Colors.amber,
////            alignment: Alignment.center,
////            child: Text(
////              "Container",style: TextStyle(color: Colors.black),
////            ),
////          )
////        ],
////      ),
//
////        alignment: Alignment.center,
////        child: new Row(
////            mainAxisAlignment: MainAxisAlignment.center,
////            children: <Widget>[
////        new Text("Item 1",style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20)),
////        new Text("Item 2",style: TextStyle(color: Colors.amberAccent, fontSize: 30)),
////        new Text("Item 3",style: TextStyle(color: Colors.lightGreen, fontSize: 20)),
////        const Expanded(child: const Text("Item 4",style: TextStyle(fontSize: 30),))
////        ],
////    )
//
//    child: new Stack(
//      alignment: Alignment.center,
//      children: <Widget>[
//        const Text("Hello 1"),
//        const Text("Hello 2"),
//        const Text("Hello 3"),
//
//      ],
//    ),
//    );
//  }
//}
// TODO چند قسمتی
//class Home extends StatelessWidget {
//
//  void _OnPerss(){
//  print("search tapped!");
//}
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      backgroundColor: Colors.grey.shade200,
//
//      //یک قسمت
//      appBar: AppBar(
//        backgroundColor: Colors.blue,
//        title: new Text(
//          "AppBar"
//        ),
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.send),
//              onPressed: ()=> debugPrint("Icon Tapped!")
//          ),
//          new IconButton(
//              icon: new Icon(Icons.search),
//              onPressed:()=> _OnPerss()
//          )
//        ],
//      ),
//
//      //یک قسمت
//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              "Mohammad",style: TextStyle(fontSize: 25,color: Colors.pink),
//            ),
//            new InkWell(
//              child: new Text("Button!",style: TextStyle(fontSize: 30),),
//              onTap: ()=> debugPrint("Button Tapped!") ,
//            )
//          ],
//        ),
//      ),
//
//      //یک قسمت
//      bottomNavigationBar: new BottomNavigationBar(items: [
//        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Add")),
//        new BottomNavigationBarItem(icon: new Icon(Icons.print), title: new Text("Print")),
//        new BottomNavigationBarItem(icon: new Icon(Icons.call_missed), title: new Text("PissesCall")),
//      ], onTap: (int i)=> debugPrint("touch $i"),),
//
//      //یک قسمت
//      floatingActionButton: new FloatingActionButton(
//          onPressed: ()=> debugPrint("floatingActionButton Pressed"),
//          backgroundColor: Colors.pink,
//        tooltip: "going Up",
//        child: new Icon(Icons.call),
//      ),
//    );
//  }
//}





class Home extends StatelessWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Center(
        child: new customButton(),
      ),
    );
  }
}
//متصل
class customButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(
          content: new Text("Hello Gestures!"),
          backgroundColor: Theme.of(context).backgroundColor,
          duration: new Duration(seconds: 1),//غیر از ثانیه چیزای دیگه هم داره
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      //The Actual button
      child: new Container(
        padding: EdgeInsets.all(20),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(10)
        ),
        child: new Text("First Button"),
      ),
    );
  }
}
