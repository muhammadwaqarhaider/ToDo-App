import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/utils/colors.dart';

import '../model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;
   TodoItem({Key? key, required this.toDo, this.onToDoChanged, this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          print("Clicked on ToDo Item.");
          onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(vertical:5,horizontal: 20 ),
        tileColor: Colors.white,
        leading: Icon(
         toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,),
        title: Text(toDo.todoText!,
          style: TextStyle(color: tdBlack,fontSize: 16,
              decoration:toDo.isDone? TextDecoration.lineThrough:null),),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),

          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              //print("Clickd on delete icon");
              onDeleteItem(toDo.id);
            },
          ),
        ),
      ),
    );
  }
}
