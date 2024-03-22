import 'package:flutter/material.dart';



class messagerie extends StatefulWidget {
  const messagerie({super.key});

  @override
  State<messagerie> createState() => _messagerieState();
}

class _messagerieState extends State<messagerie> {

  List message=[
    {
      'nom':'bonjour comment tu vas?',
      'image':'Images/avatar/a.jpg',
      'heure':'14.30',
      'icon':Icons.check
    },
    {
      'nom':'bonjour comment tu vas?',
      'image':'Images/avatar/a.jpg',
      'heure':'14.30',
      'icon':Icons.check_circle_outline
    },
    {
      'nom':'bonjour comment tu vas?',
      'image':'Images/avatar/a.jpg',
      'heure':'14.30',
      'icon':Icons.check_circle
    },
    {
      'nom':'bonjour comment tu vas?',
      'image':'Images/avatar/a.jpg',
      'heure':'14.30',
      'icon':Icons.check_box
    },
    {
      'nom':'bonjour comment tu vas?',
      'image':'Images/avatar/a.jpg',
      'heure':'14.30',
      'icon':Icons.check_box_outlined
    }
  ];
  bool value= true;

  @override
  Widget build(BuildContext context) {

    final sms= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp'),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: message.map((e) => Padding(
            padding:  EdgeInsets.all(10.0),
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
                      child: GestureDetector(
                        onTap: (){
                        setState(() {
                          message.remove(e);
                        });
                        },
                          child: Icon(e['icon'])),
                    )
                  ],
                ),
              ],
            ),
          ),).toList(),
        ),
      ),
     bottomSheet: Container(
       height: 80,
       alignment: Alignment.center,
       color: Colors.grey,
       child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: TextField(
           controller: sms,

           decoration: InputDecoration(
               border: OutlineInputBorder(),
               prefixIcon: Icon(
                   Icons.emoji_emotions_outlined),
               hintText: 'message',suffixIcon: GestureDetector(onTap: (){
                 setState(() {
                   message.add(
                     {
                       'nom':sms.text,
                       'image':'Images/avatar/a.jpg',
                       'heure':DateTime.now().hour.toString()+'.'+DateTime.now().minute.toString(),
                       'icon':Icons.check
                     }
                   );
                 });
           },
               child: Icon(Icons.send))),
         ),
       ),
     ),
    );
  }
}
