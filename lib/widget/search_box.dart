import 'package:flutter/material.dart';

import '../model/utils/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
       // onChanged: (value) => _runFilter(value),
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
