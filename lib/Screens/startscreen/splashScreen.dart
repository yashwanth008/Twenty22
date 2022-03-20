
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Screens/startscreen/CarouselWithDotsPage.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];



var scaffoldKey = GlobalKey<ScaffoldState>();
// ignore: camel_case_types
class splashScreen extends StatelessWidget {
  const splashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height:25.0,
            ),
            ListTile(
              title: const Text(
                'Internships',
                style:TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                ),
                ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text(
                'Online Trainings',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text(
                'Jobs',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const SizedBox(
              height: 25.0,
            ),
          
           ListTile(
              title: const Text(
                'Register - As Student',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/SignUp');
              },
            ),

            ListTile(
              title: const Text(
                'Register - As Employee',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/loginPage');
              },
            ),
          ],

        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: (){ 
            scaffoldKey.currentState?.openDrawer();
            },
          color: Colors.black,
        ),
        ),
      body: Container(
        child: Column(
          children: [
            CarouselWithDotsPage(imgList: imgList),
             const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'Internships',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Apply to 500+ internships for free ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child:  Card(
                      elevation: 0.0,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.grey[300],
                      child: SizedBox(
                        width: 110,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.transparent,
                                ),
                                child: Image.asset(
                                  'Assets/exp.png',
                                  width: 100,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Expert guidance",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                elevation: 0.0,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                color: Colors.grey[300],
                child: SizedBox(
                width: 110,
                height: 150,
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      'Assets/wh.png',
                      width: 100,
                      height: 90,),
                  ),
                  const SizedBox(
                    height: 8,
                  ), 
            
                 const Text(
                    "Work from home",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.start, 
                  ), 
                  
                ],
                        ), 
                      ), 
                    ),
                  ),
              ),            
              ]
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){Navigator.pushNamed(context,'/SignUp');},
                child: const Center(
                  child: Text(
                    'Register to Know More',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ), 
      
    );
      
  }
  

}



