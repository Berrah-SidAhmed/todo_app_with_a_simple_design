import 'package:flutter/material.dart';

class Todolist extends StatelessWidget {
  String vartitle;
  bool varstatus;
  Function myfunc;
  int ii;
  Function delete;
  Todolist(
      {required this.vartitle,
      required this.varstatus,
      required this.myfunc,
      required this.ii,
      required this.delete});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(ii);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        height: 80,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(fontSize: 20,
                color: varstatus ? Colors.white : Colors.black,
                decoration: varstatus ? TextDecoration.lineThrough : TextDecoration.none),
              ),
              Row(
                children: [
                  Icon(
                    varstatus ? Icons.check : Icons.remove_circle,
                    color: varstatus ? Colors.green : Colors.red,
                  ),
                  IconButton(
                      onPressed: () {
                        delete(ii);
                      },
                      icon: Icon(Icons.delete))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
