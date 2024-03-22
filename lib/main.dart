import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      home: MyHomePage(),
    );
  }
}

List data = [
  {
    'nom':'leonie',
    'image':'Images/avatar/a.jpg',
    'heure':'14.40',
    'icon': Icons.check,
  },
  
  {                               
    'nom':'brande',
    'image':'Images/avatar/b.jpg',
    'heure':'15.10',
    'icon': Icons.check_box,
  },  
  
  {                               
         'nom':'leoniedas',
         'image':'Images/avatar/a.jpg',
         'heure':DateTime.now().hour.toString()+'.'+DateTime.now().minute.toString(),
          'icon': Icons.check,
  },                              
  
  {                               
    'nom':'lru',
    'image':'Images/avatar/b.jpg',
    'heure':'12.30',
    'icon': Icons.check,
  },
  {
    'nom':'cours',
    'image':'Images/avatar/b.jpg',
    'heure':'12.30',
    'icon': Icons.check,
  },

];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp'),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Statuts'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: List.generate(
                        10,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [CircleAvatar(backgroundImage: AssetImage('Images/avatar/a.jpg')), Text('data')],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 500,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: data.map((e) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => messagerie()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(backgroundImage: AssetImage(e['image'])),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(e['nom']),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(e['heure']),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(e['icon']),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )).toList(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
