import 'package:flutter/material.dart';
import 'package:flutter_app/models/noToDoItem_11.dart';
import 'package:flutter_app/utility/datadaseClient_11.dart';

class NoToDoScreen extends StatefulWidget {
  @override
  _NoToDoScreenState createState() => _NoToDoScreenState();
}

class _NoToDoScreenState extends State<NoToDoScreen> {
  final _textEditingController = TextEditingController();
  var db = new DatabaseClient();
  final List<NoToDoItem> _itemList = <NoToDoItem>[];

  @override
  void initState() {
    super.initState();
    _readNoToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                  itemCount: _itemList.length,
//                  reverse: true, // default is false
                  itemBuilder: (_, int index) {
                    return Card(
                      color: Colors.grey[400],
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${_itemList[index].id}'),),
                        title: _itemList[index],
                        onLongPress: () =>
                            _updateNoToDoDialog(_itemList[index].id, index),
                        trailing: new Listener(
                          key: Key(_itemList[index].itemName),
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.redAccent,
                          ),
                          onPointerDown: (pointerEvent) =>
                              _deleteNoDoTo(_itemList[index].id, index),
//                          onPointerUp: (pointerEvent)=>null,
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveNoToDoDialog(),
        backgroundColor: Colors.blueAccent,
        tooltip: 'add item',
        child: ListTile(
          title: Icon(Icons.add),
        ),
      ),
    );
  }

  _handleSubmitSave(String text) async {
    NoToDoItem noToDoItem = new NoToDoItem(
        _textEditingController.text, DateTime.now().toIso8601String());
    int saveItemId = await db.saveNoToDoItem(noToDoItem);
    _textEditingController.clear();
    Navigator.pop(context);
    NoToDoItem addedItem = await db.getItem(saveItemId);
    setState(() {
      _itemList.insert(0, addedItem);
    });
  }

  _readNoToDoList() async {
    List items = await db.getAllItems();
    items.forEach((item) {
      setState(() {
        _itemList.insert(0, NoToDoItem.map(item));
      });
    });
  }

  _deleteNoDoTo(int id, int index) async {
    debugPrint('deleted Item : $index');
    await db.deleteItem(id);
    setState(() {
      _itemList.removeAt(index);
    });
  }

  void _handleSubmitUpdate(NoToDoItem updateToDo, int index) async {
    await db.updateItem(updateToDo);
      print(_itemList.length);
      _itemList.removeRange(0, _itemList.length );
      _readNoToDoList();
    _textEditingController.clear();
    Navigator.pop(context);
  }

  _saveNoToDoDialog() {
    var alert = new AlertDialog(
      title: Text('add item'),
      content: Row(
        //اینجا فقط row , column قرار میگیرند چون میخواهیم این فضا اندازه غیر ثابت داشته باشد
        children: <Widget>[
          new Expanded(
            child: TextField(
              // چون تکست فیلد باید کل فضای غیر ثابت را پر کند باید داخل اکسپند قرار گیرد
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Item',
                  hintText: 'hello how are you?',
                  icon: Icon(Icons.note_add)),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            _handleSubmitSave(_textEditingController.text);
          },
          child: Text('Save'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _updateNoToDoDialog(int id, int index) {
    var alert = new AlertDialog(
      title: Text('update item'),
      content: Row(
        //اینجا فقط row , column قرار میگیرند چون میخواهیم این فضا اندازه غیر ثابت داشته باشد
        children: <Widget>[
          new Expanded(
            child: TextField(
              // چون تکست فیلد باید کل فضای غیر ثابت را پر کند باید داخل اکسپند قرار گیرد
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Item',
                  hintText: 'hello how are you?',
                  icon: Icon(Icons.update)),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            NoToDoItem updateToDo = NoToDoItem.update(
                _textEditingController.text,
                DateTime.now().toIso8601String(),
                id);
            _handleSubmitUpdate(updateToDo, index);
          },
          child: Text('Update'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}
