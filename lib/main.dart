import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pract2/entries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Category? List;
  bool _loading=false;
  void data() async {
    try{
      Response response= await Dio().get('http://jayanthi10.pythonanywhere.com/api/v1/list_products/');
      setState(() {
        List=categoryFromJson(jsonEncode(response.data));
                              

        _loading=true;

      });
        print('----- here the data ${response.data}');
    }
    catch(e){
      setState(() {
        _loading=true;
      });
      print(e);
    }
  }
  @override
  void initStat(){
    data();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good morning',style: TextStyle(color: Color(0xffc8cccd),fontSize: 24,fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0,),
                        Text('Doris Wilkerson',style: TextStyle(color: Color(0xff4e5c5d),fontSize: 30,fontWeight: FontWeight.bold))
                      ],
                    ),
                    Icon(Icons.notifications,color: Color(0xff284243),),
                  ],
                ),
                SizedBox(height: 16,),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 280,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xff253f40),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.menu,color: Colors.white,),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text('Cappuccino',style: TextStyle(color: Color(0xff848d8e),fontSize: 24,fontWeight: FontWeight.bold)),SizedBox(width: 14.0,),
                      
                      Text('Espresso',style: TextStyle(color: Color(0xff848d8e),fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(width: 10,),SizedBox(width: 14.0,),
                      Text('Lette',style: TextStyle(color: Color(0xff848d8e),fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(width: 10,),SizedBox(width: 14.0,),
                      Text('Flat White',style: TextStyle(color: Color(0xff848d8e),fontSize: 20,fontWeight: FontWeight.bold)),
                       Text('Espresso',style: TextStyle(color: Color(0xff848d8e),fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(width: 10,),SizedBox(width: 14.0,),
                      Text('Lette',style: TextStyle(color: Color(0xff848d8e),fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(width: 10,),SizedBox(width: 14.0,),
                      Text('Flat White',style: TextStyle(color: Color(0xff848d8e),fontSize: 20,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),SizedBox(
                  height: 18,
                ),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Near by place',style: TextStyle(color: Color(0xff576263),fontSize: 24,fontWeight: FontWeight.bold)),
                    Text('See All ',style: TextStyle(color: Color(0xff848d8e),fontSize: 18,fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  height: 192,
                  child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xfff9f9f9),
                             border: Border.all(color: Color(0xfff3f3f3)),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(
                        color: Color(0xffe4e4e4),
                        blurRadius: 10.0,spreadRadius: 1.0,offset: Offset(0.0, 0.0)
                      )]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(20),
                          //   child: Image.asset('images/img1.jpg',height: 120,width: 220,)
                          //   ),
                          Row( 
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('Tonys cofee ',style: TextStyle(color: Color(0xff505c5a),fontSize: 14,fontWeight: FontWeight.bold)),
                                 Text('1.5kmm ',style: TextStyle(color: Color(0xff848d8e),fontSize: 14,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.orangeAccent,),
                                Text('4.9 ',style: TextStyle(color: Color(0xffacb0af),fontSize: 14,fontWeight: FontWeight.bold)),
                              Text('(632 Reviews)',style: TextStyle(color: Color(0xff848d8e),fontSize: 14,fontWeight: FontWeight.bold)),
      
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
                )
                ),
                SizedBox(height: 14,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Special for you',style: TextStyle(color: Color(0xff576263),fontSize: 24,fontWeight: FontWeight.bold)),
                    Text('See All ',style: TextStyle(color: Color(0xff848d8e),fontSize: 18,fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 15,),
                 Container(
                  height: 460,
                  child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Color(0xfff9f9f9),
                             border: Border.all(color: Color(0xfff3f3f3)),
                      borderRadius: BorderRadius.circular(20),
                       boxShadow: [BoxShadow(
                        color: Color(0xffe4e4e4),
                        blurRadius: 10.0,spreadRadius: 1.0,offset: Offset(0.0, 0.0)
                      )]
                    ),
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          //child: Image.asset('images/food.jpg',height: 100,width: 100,),
                        )),
                        SizedBox( width: 16,),
                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              height: 20,
                              width: 100,
                             
                              decoration: BoxDecoration(
                                color: Color(0xff243c3b),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('20% Discount ',style: TextStyle(color: Color(0xfff5faf7),fontSize: 14,fontWeight: FontWeight.bold))),
                            ),
                            
                          ),
                          SizedBox(height: 14,),
                          Text('Get three free ice flavoured\n cappuceinos',style: TextStyle(color: Color(0xff737c7c),fontSize: 14,fontWeight: FontWeight.bold)),
                          SizedBox(height: 14,),
                          Text('offer avail on 31st nov to jan 2nd',style: TextStyle(color: Color(0xffd1d3d2),fontSize: 14,fontWeight: FontWeight.bold)),
                        ],
                      )
                    ]),
                  ),
                );
                
              }
                  ),),
                 
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
