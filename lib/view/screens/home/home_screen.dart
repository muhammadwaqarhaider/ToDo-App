import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/utils/colors.dart';
import 'package:todo_app/widget/todo_item.dart';

import '../../../model/todo.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todosList = ToDo.todoList();
  List <ToDo> _foundToDo = [];
  final _todosController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu,color: tdBlack,size: 30,),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/man.png"),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,bottom: 20),
                        child: Text("ALL ToDos",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      ),

                      for( ToDo todo in _foundToDo.reversed)
                        TodoItem(toDo: todo,
                          onToDoChanged: _handletodochange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                      

                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0,0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todosController,
                    decoration: InputDecoration(
                      hintText: "Add a new todo item",
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(
                    child: Text("+",style: TextStyle(fontSize: 40),),
                    onPressed: (){
                      _addToDoItem();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handletodochange(ToDo toDo) {
    setState(() {
    });

    toDo.isDone = !toDo.isDone;
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id==id);

    });
  }

  void _addToDoItem(){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: _todosController.text));
    });

    _todosController.clear();

  }

  void _runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todosList;
    }else{
      results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Widget SearchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search,color: tdBlack,size: 20,),
            prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
            border: InputBorder.none,
            hintText: "Search",
            helperStyle: TextStyle(color: tdGrey)
        ),
      ),
    );

  }
}

