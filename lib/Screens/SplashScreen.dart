import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarea_6/Screens/HomeScreen.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen())
      );
    });
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.business_center_outlined, color: Colors.white, size: 70.0,)
            ,Text("ToolBox App", style: TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}
