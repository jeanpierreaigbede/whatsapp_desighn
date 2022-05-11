import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chart_page.dart';

const dGreen = Color(0xFF2ac0a6);
const dWhite = Colors.white;
const dBlack = Colors.black;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Whatsapp",
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dGreen,
        title: const Text('Whatsapp'),
        leading: IconButton(onPressed: (){
          print("bonjour");
        },
          icon:const Icon(Icons.menu,
            color: dWhite,
            size: 30,),
        ),
        actions: [
          IconButton(onPressed: (){}, icon:const  Icon(Icons.search_rounded))
        ],
      ),
      body:Column(
        children: [
          MenuSection(),
          FavoriteSection(),
          Expanded(child: MessageSection(),)
        ],
      ) ,
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: dGreen,
        child:const Icon(
          Icons.edit,
          color: dWhite,
          size: 20,
        ),
      ),
    );
  }

}
class MenuSection extends StatelessWidget{
  final List menItems =["Message","Online","Groupes","Calls"];
  MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBlack,
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding:const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: menItems.map((item) {
              return Container(
                margin:const EdgeInsets.only(right: 50),
                child: Text(item,style: GoogleFonts.inter(color: Colors.white70,
                    fontSize: 28)
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class FavoriteSection extends StatelessWidget{
  FavoriteSection({Key? key}) : super(key: key);
  final List favoriteContacts =[
    {
      "name":"Alla",
      "profile":"images/a1.jpg"
    },
    {
      "name":"Alex",
      "profile":"images/a2.jpg"
    },{
      "name":"El Gabinto",
      "profile":"images/a3.jpg"
    },{
      "name":"Caca",
      "profile":"images/a4.jpg"
    },{
      "name":"Avery",
      "profile":"images/a5.jpg"
    },{
      "name":"Pedro",
      "profile":"images/a6.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 5),
        decoration:const  BoxDecoration(
            color: dGreen,
            borderRadius:BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child:Text("Favorites  contacts",
                      style:GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ))
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: favoriteContacts.map((item) {
                  return Container(
                    margin:const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                          padding:const EdgeInsets.all(5),
                          child: CircleAvatar(radius: 30,
                            backgroundImage: AssetImage(item["profile"]),),
                        ),
                        Text(item['name'],
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 25
                          ),)
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageSection extends StatelessWidget{
  MessageSection({Key? key}) : super(key: key);
  final List messages = [
    {
      'senderProfile':'images/a2.jpg',
      'sendername':"Alex",
      "sms":"Pas encore !",
      "unRead":0,
      "date":"10:48"
    },
    {
      'senderProfile':'images/a6.jpg',
      'sendername':"Lara",
      "sms":"Hello ! How are you doing ??? ",
      "unRead":2,
      "date":"10:48"
    },
    {
      'senderProfile':'images/a1.jpg',
      'sendername':"Angelo",
      "sms":"je suis deja de retour !",
      "unRead":7,
      "date":"10:48"
    },
    {
      'senderProfile':'images/a4.jpg',
      'sendername':" Jean",
      "sms":"Bonjour monsieur...",
      "unRead":0,
      "date":"08:48"
    },{
      'senderProfile':'images/a3.jpg',
      'sendername':"stive",
      "sms":"Can you borrow me ?",
      "unRead":1,
      "date":"10:58"
    },
    {
      'senderProfile':'images/a3.jpg',
      'sendername':"Clément",
      "sms":"Can you borrow me  ?",
      "unRead":5,
      "date":"10:48"
    },
    {
      'senderProfile':'images/a3.jpg',
      'sendername':"stive",
      "sms":"Ok thanks",
      "unRead":0,
      "date":"16:53"
    },{
      'senderProfile':'images/a2.jpg',
      'sendername':"Jeanne",
      "sms":"D'accord",
      "unRead":2,
      "date":"10:48"
    },
    {
      'senderProfile':'images/a6.jpg',
      'sendername':"Sévérin",
      "sms":"Can you borrow me ?",
      "unRead":1,
      "date":"10:00"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: messages.map((Messages) {
            return InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return ChatPage( Messages['sendername'] );
                }) );
              },
              splashColor: dGreen,
              child:Container(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
                child:Row(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Messages["senderProfile"])
                          )
                      ),
                      height: 60,
                      width: 60,
                    ),
                    Expanded(child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Messages['sendername'],
                                  style: GoogleFonts.inter(
                                      color: Colors.blueGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text(Messages["sms"],style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    )
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(Messages['date'],
                                style: GoogleFonts.inter(
                                  color: dBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),),
                               Messages['unRead']!=0 ? Container(
                                  padding:const EdgeInsets.all(10),
                                  decoration:const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: dGreen
                                  ),
                                  child: Text(Messages["unRead"].toString()),
                                ):Container()
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          color: dGreen,
                          height: 0.5,
                        )
                      ],
                    )
                    )
                  ],
                ) ,
              ),
            );
          }).toList(),
        )
    );
  }
}