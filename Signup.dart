import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onemoremxplayer/main.dart';
import 'package:page_transition/page_transition.dart';



class SignInScreen extends StatefulWidget{

  const SignInScreen({super.key});



  @override
  State<SignInScreen> createState()=>_SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>{
  
  TextEditingController Random_Email= TextEditingController();
  TextEditingController Random_Password= TextEditingController();


  Future <void> CreateUserwithemailpassword(
    String useremail,String userpassword)async{
      try{
      UserCredential UserDetails= await FirebaseAuth.instance.createUserWithEmailAndPassword(email:useremail , password:userpassword );
      User? users=UserDetails.user;
      print(users!.uid);
      print("USer Registered");
      
      }

      catch(error){
          print("Error: $error");
      }
    }
  

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),

      ),
      backgroundColor:Color.fromARGB(255, 32, 71, 129),
      body:Padding(
        padding: const EdgeInsets.only(top:150.0),
        child:
          Center(
          child: Column(
            children: [
              Container(
                  height:60,
                  width:400,
                  decoration: BoxDecoration(border:Border.all(color: Colors.blueGrey),borderRadius: BorderRadius.circular(20),color:Color.fromARGB(255, 235, 219, 172)),
                  child:
                    TextField(
                      controller:Random_Email,
                      cursorHeight:10,
                      
                      style: const TextStyle(fontSize:15,color:Color.fromARGB(255, 21, 23, 26)),
                      scrollPadding: const EdgeInsets.all(15),
                      cursorColor:const  Color.fromARGB(255, 237, 228, 202),
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(
                      borderSide: BorderSide.none),
                      labelText:("Email_id"),
                      labelStyle:TextStyle(fontSize:20,color:Colors.black) ,
                      hintText:"Enter your email_id",
                      hintStyle: TextStyle(fontSize:20,color:Colors.black)),

                    )
        
                  ),
                  SizedBox(height:10 ,),
        
                  Container(
                  height:60,
                  width:400,
                  decoration: BoxDecoration(border:Border.all(color: Colors.blueGrey),borderRadius: BorderRadius.circular(20),color:Color.fromARGB(255, 227, 212, 167)),
                  child:
                    TextField(
                      
                      controller:Random_Password,
                      cursorHeight:10,
                      
                      style: const TextStyle(fontSize:15,color:Color.fromARGB(255, 12, 13, 14)),
                      scrollPadding: const EdgeInsets.all(15),
                      cursorColor:const  Color.fromARGB(255, 237, 228, 202),
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(
                      borderSide: BorderSide.none,),
                      label: Text("Password"),
                      labelStyle:TextStyle(fontSize:20,color:Colors.black),
                      hintText:"Enter your password" ,
                      hintStyle: TextStyle(fontSize:20,color:Colors.black))
                    )
        
                  ),
        
                  SizedBox(height:10),
                  InkWell(
                    child: Container(
                    height:60,
                    width:280,
                    decoration: BoxDecoration(border:Border.all(color: Colors.amberAccent),color: Colors.amber,borderRadius:BorderRadius.circular(20)),
                    child:Center(child: Text("Sign in",style: TextStyle(color: Colors.black) ,))
                    ),
        
                    onTap: (){
                      CreateUserwithemailpassword(Random_Email.text,Random_Password.text);{
                        Navigator.push(context ,PageTransition(
                          curve:Curves.bounceOut,
                          type:PageTransitionType.leftToRight,
                          alignment:Alignment.topCenter,
                          child:MyHomePage(title: "mxplayer"),

                        ));
                      }
        
                    },
                  ),
        
                ],
          
            
          ),
        )
      )
    );
  }

}