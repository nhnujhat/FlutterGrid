import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> applied = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  String dropdownvalue = 'Delete';
  var items = [
    'Delete',
    'Color',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            //margin: EdgeInsets.all(5),
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(5),
            child: applied[index]
                ? Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                ((MediaQuery.of(context).size.width / 4) - 20) /
                                    3,
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Title",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  DropdownButton(
                                    iconSize: MediaQuery.of(context).size.width*0.02,
                                    icon: const Icon(Icons.more_vert),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                        if (dropdownvalue == 'Delete') {
                                          applied[index] = false;
                                        } else {
                                          ThemeData(
                                            primaryColor: Colors.red,
                                          );
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                ((MediaQuery.of(context).size.width / 4) - 20) /
                                    3,
                            child: Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Icon(
                                    Icons.play_circle_outline,
                                    size:
                                        ((MediaQuery.of(context).size.width / 4) -
                                                20) /
                                            3,
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                ((MediaQuery.of(context).size.width / 4) - 20) /
                                    3,
                            child: Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "${DateTime.now().day}" +
                                                  "/"
                                                      "${DateTime.now().month}" +
                                                  "/"
                                                      "${DateTime.now().year}",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Theme.of(context)
                                                  .primaryColorDark,
                                              // background
                                              onPrimary:
                                                  Colors.white, // foreground
                                            ),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.fast_forward,
                                              size: MediaQuery.of(context).size.width*0.02,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Theme.of(context)
                                                  .primaryColorDark,
                                              // background
                                              onPrimary:
                                                  Colors.white, // foreground
                                            ),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.add,
                                              size: MediaQuery.of(context).size.width*0.02,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Theme.of(context)
                                                  .primaryColorDark,
                                              // background
                                              onPrimary:
                                                  Colors.white, // foreground
                                            ),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.bug_report_outlined,
                                              size: MediaQuery.of(context).size.width*0.02,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    color: Colors.grey,
                    child: Expanded(
                      child: IconButton(
                        //iconSize: MediaQuery.of(context).size.width/8,
                        color: Colors.black,
                        icon: Expanded(
                            child: Icon(
                          Icons.add,
                          size: ((MediaQuery.of(context).size.width / 4) - 20) /
                              3,
                          color: Theme.of(context).primaryColorDark,
                        )),
                        onPressed: () {
                          setState(() {
                            applied[index] = true;
                          });
                        },
                      ),
                    ),
                  ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).primaryColor,
            ),
          ),
          itemCount: 16,
        )),
      ),
    );
  }
}
