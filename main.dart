import 'package:flutter/material.dart';
import 'package:onemoremxplayer/SplashScreen.dart';
import 'package:onemoremxplayer/Movies.dart';
import 'package:onemoremxplayer/Tabbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



// void main() {
//   runApp(const MyApp());
// }
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey:"AIzaSyCokBG8GIsLGbhm_4OSIp37h531rLNlHH8",
      appId: "1:1036504470355:android:5930245069cad87e0d87a6",
      messagingSenderId: "1036504470355	",
      projectId: "mxplayerclone",
  ));
  runApp(const MyApp());}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashScreen(title: "flutter"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 var Screen = [
  TabbarPage(),
  trendingShows_screen(),
  Text('Live', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)), 
  Text('MxTube', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
  Text('Audio', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)), ];
  

  int Selected_index= 0;
  

  

  void ontapped(int index){

    setState(() {
      Selected_index=index;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 32, 71, 129),
        leading: Padding(padding: EdgeInsets.symmetric(horizontal:8.0),
        child:Image.asset("images/pngwing.com.png", height:30 ,width:30),),
        title:const
          Row(
            children:[
              Text("MX",style: TextStyle(fontWeight:FontWeight.w500,color:Colors.white),
              ),
              Text("PLAYER",style: TextStyle(fontWeight:FontWeight.w300,color:Colors.white ),
              )],
          ),

            actions: [
                Image.asset("images/search.png", height:25,width:25,color:Colors.white,),
                SizedBox(width:15),
                Image.asset("images/notification.png", height:25,width:25,color:Colors.white),
                SizedBox(width:15),
                Image.asset("images/add.png", height:25,width:25,color:Colors.white,) 
              ],
            elevation: 0,),
      
      body:
        Center(child:Screen.elementAt(Selected_index)),
        bottomNavigationBar:BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 153, 188, 248),
          backgroundColor: Color.fromARGB(255, 32, 71, 129),
          showUnselectedLabels: true,
          currentIndex: Selected_index,
          items:const [
            BottomNavigationBarItem(icon:Icon(Icons.folder),label:"Local", backgroundColor:Color.fromARGB(255, 32, 71, 129), ),
            BottomNavigationBarItem(icon:Icon(Icons.video_file),label:"Video",backgroundColor:Color.fromARGB(255, 32, 71, 129)),
            BottomNavigationBarItem(icon:Icon(Icons.live_tv),label:"Live",backgroundColor:Color.fromARGB(255, 32, 71, 129)),
            BottomNavigationBarItem(icon:Icon(Icons.tv),label:"Mxtube",backgroundColor:Color.fromARGB(255, 32, 71, 129)),
            BottomNavigationBarItem(icon:Icon(Icons.audio_file),label:"Audio",backgroundColor:Color.fromARGB(255, 32, 71, 129)),
            // BottomNavigationBarItem(icon:Icon(Icons.search),label:"Search",backgroundColor:Color.fromARGB(255, 32, 71, 129)),
          ],
          onTap: ontapped,
      )  

    );
  }
}
