import 'package:flutter/material.dart';
import 'package:tarea_6/Screens/AboutMe.dart';
import 'package:tarea_6/Screens/AgePreditorScreen.dart';
import 'package:tarea_6/Screens/GenderizeScreen.dart';
import 'package:tarea_6/Screens/UniversitiesScreen.dart';

void main() => runApp(ToolScreen());

class ToolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Tools'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10.0),

          children: [
            ElevatedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GenderizeScreen()));
            }, icon: Icon(Icons.transgender, size: 40.0), label: Text('Genderize', style: TextStyle(fontSize: 25.0),), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(10.0))),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AgePreditorScreen()));
            }, icon: Icon(Icons.cake, size: 40.0), label: Text('Age predictor', style: TextStyle(fontSize: 25.0)), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(10.0))),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UniversitiesScreen()));
            }, icon: Icon(Icons.account_balance, size: 40.0), label: Text('Universities', style: TextStyle(fontSize: 25.0)), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(10.0))),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.sunny, size: 40.0), label: Text('Weather', style: TextStyle(fontSize: 25.0)), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(10.0))),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.newspaper, size: 40.0), label: Text('Last News', style: TextStyle(fontSize: 25.0)), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(10.0))),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMe()));
            }, icon: Icon(Icons.person, size: 40.0), label: Text('About Me', style: TextStyle(fontSize: 25.0)), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(10.0))),
          ],
        )
    );
  }
}
