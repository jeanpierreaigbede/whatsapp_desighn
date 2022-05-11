import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class ChatPage extends StatelessWidget{
  late String title ;
 ChatPage ( String titre){
   title = titre;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: ChattingSection(),
      bottomNavigationBar:const BottomSection(),
    );
  }
}

class BottomSection extends StatelessWidget
{
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      child: Container(
        padding:const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(5),
                decoration:const BoxDecoration(
                  color: dGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const[
                     SizedBox(width: 20,),
                    Icon(Icons.insert_emoticon,color: Colors.white,size: 30,),
                    Expanded(child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),),
                    Icon(Icons.download,color: Colors.white,size: 30,),
                    SizedBox(width: 7,),
                    Icon(Icons.image,size: 30,color: Colors.white,),
                    SizedBox(width: 7,)
                    
                  ],
                ),
              )
            ),
            const SizedBox(width: 20,),
            Container(
                decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green
                ),
                height: 45,
                width: 45,
                child:IconButton(onPressed: (){},
                  icon: const Icon(Icons.mic_none_sharp),
                )
            )
          ],
        ),
      ),
      color: dWhite,
    );

  }
}

class ChattingSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration:const BoxDecoration(
          borderRadius:BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(20)),
          color: Colors.white
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           const SizedBox(height: 45,),
          const  Text('Was online 56 second ago'),
           const  SizedBox(height: 40,),
            TextMessage("bonjour Comment tu vas ?","10:51","images/a1.jpg",1,0),
            TextMessage("Bonsoir Jp", "08:00", "images/a6.jpg",0, 1),
          const AudioMessage(),
           const  AudioMessage(),
            ImageMessage("images/a2.jpg", "C'est juste une image", "10:08"),
            const SizedBox(width: 10,),
            TextMessage("Je suis prêt voyons","10:51","images/a3.jpg",1,0),
            TextMessage("Come on !!", "08:00", "images/a5.jpg",0, 1),
            const AudioMessage(),
            TextMessage("I'm not at home now","00:51","images/a1.jpg",1,0),
            TextMessage("Bonsoir Jp", "07:00", "images/a6.jpg",0, 1),
          ],
        ),
      ),
    );
  }
}

class TextMessage extends StatelessWidget{
  String message="Bonjour Comment tu vas ?";
  String date="10:00";
  String senderProfile="";
  int isReceiver=1;
  int isDirect=0;
  TextMessage(String sms,String dat,String sender,int receiver,int direct){
    message = sms;
    date = dat;
    senderProfile = sender;
    isReceiver = receiver;
    isDirect = direct;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top:10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isReceiver==1 && isDirect ==0 ? Container(
            padding:const EdgeInsets.all(15),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(senderProfile),
                fit: BoxFit.cover,
              )
            ),
          ):Row(
            children: [
              const Icon(Icons.check,
              color: dGreen,
              size: 25,),
              Text(date,
                style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                  color: dGreen,
              ),
              )
            ],
          ),
          Expanded(
              child: isReceiver == 1 ? Row(
            children: [
             const  SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 50,
                width: 170,
                child: Text(message,style: GoogleFonts.inter(
                    color:dGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
             const  SizedBox(width: 20,),
              const Icon(Icons.check,
              color: Colors.green,
              size: 30,),
              Text(date ,style: GoogleFonts.inter(
                color: dGreen,
                fontSize: 15,
                fontWeight: FontWeight.normal
              ),)
            ],
          ):Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              const    SizedBox(width: 15,),
                  Container(
                    padding:const EdgeInsets.all(10),
                    height: 55,
                    width: 170,
                    decoration:const BoxDecoration(
                      color: dGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                      )
                    ),
                    child: Text(message,style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    decoration:BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(senderProfile,),
                        fit: BoxFit.cover
                      )
                    )
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}


class AudioMessage extends StatelessWidget{
  const AudioMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
     Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
       Text("14:52",style: GoogleFonts.inter(
         fontWeight: FontWeight.bold,
         fontSize: 14,
         color: dGreen,
       ),
       ),
       const Icon(Icons.check,
         color: dGreen,
         size: 30,),
       const SizedBox(width: 20,),
       Container(
         height: 70,
         width: 180,
         decoration:const BoxDecoration(
           color: dGreen,
           borderRadius: BorderRadius.only(
             bottomRight: Radius.circular(15),
             topLeft: Radius.circular(15),
             bottomLeft: Radius.circular(15),
           ),
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             const Icon(Icons.play_circle_outline,color: Colors.white,size: 20,),
             Image.asset("images/audio1.png",fit: BoxFit.fill,
             color: dWhite,),
           ],
         ),
       ),
       const SizedBox(width: 20,),
       Container(
         height: 60,
         width: 60,
         decoration:const BoxDecoration(
             shape: BoxShape.circle,
             image: DecorationImage(
                 image: AssetImage('images/a4.jpg'),
                 fit: BoxFit.cover
             )
         ),
       )
     ],
   ),
       const SizedBox(height: 10,)
     ],
   );
  }

}

class ImageMessage extends StatelessWidget{
 late String image ;
 late String message;
 late String heure;
  ImageMessage(String picture,String sms ,String date){
    image = picture;
    message = sms;
    heure = date;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 140,
              width: 180,
              decoration:BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(image,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Text(message,style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: dGreen
            ),)
          ],
        ),
        const SizedBox(width: 40,),
        Text(heure,style: GoogleFonts.inter(
            fontSize: 15,
            color: dGreen,
            fontWeight: FontWeight.bold
        ),)
      ],
    );
  }

}