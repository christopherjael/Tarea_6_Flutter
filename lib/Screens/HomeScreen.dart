import 'package:flutter/material.dart';
import 'package:tarea_6/Screens/ToolsScreen.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Press me!'),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ToolScreen()));
                },
                child: Icon(Icons.business_center, size: 100.0, color: Colors.black,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
              ),
              )
            ],
          )
        ),
    );
  }
}
