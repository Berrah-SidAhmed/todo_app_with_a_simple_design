import 'package:flutter/material.dart';
import 'package:flutter_application_14/widget/counter.dart';
import 'package:flutter_application_14/widget/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: erox(),
    );
  }
}

class todo {
  String title;
  bool status;
  todo({required this.title, required this.status});
}

List AllTask = [
  todo(title: "hamoda", status: true),
  todo(title: "riyad", status: true),
  todo(title: "hamoda", status: true),
];

class erox extends StatefulWidget {
  const erox({super.key});

  @override
  State<erox> createState() => _eroxState();
}

final myController = TextEditingController();
int complutedtask() {
  int Compluted = 0;
  AllTask.forEach((item) {
    if (item.status) {
      Compluted++;
    }
  });

  return Compluted;
}

class _eroxState extends State<erox> {
  @override
  addnewtask() {
    setState(() {
      AllTask.add(todo(title: myController.text, status: false));
    });
  }

  changestatu(index) {
    setState(() {
      AllTask[index].status = !AllTask[index].status;
    });
  }

  deletetask(int Click) {
    setState(() {
      AllTask.remove(AllTask[Click]);
    });
  }

  deletall() {
    setState(() {
      AllTask.removeRange(0, AllTask.length);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo app ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
              onPressed: () {
                deletall();
              },
              icon: Icon(
                Icons.delete_forever_outlined,
                size: 50,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext Context) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Put your text Here",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          controller: myController,
                        ),
                        IconButton(
                            onPressed: () {
                              addnewtask();
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.add))
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add)),
      body: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Counter(
              totalTodos: AllTask.length,
              todos: complutedtask(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                  itemCount: AllTask.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todolist(
                      vartitle: AllTask[index].title,
                      varstatus: AllTask[index].status,
                      myfunc: changestatu,
                      ii: index,
                      delete: deletetask,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
