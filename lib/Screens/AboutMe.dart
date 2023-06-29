import 'package:flutter/material.dart';

void main() => runApp(AboutMe());

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Sobre mi'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Image.asset('assets/img/profile.jpg'),
                  Padding(padding: EdgeInsets.all(15.0),
                    child: Text('Contacta Me', style: TextStyle( fontSize: 19.0, fontWeight: FontWeight.bold),),)
                  ,Padding(padding: EdgeInsets.all(10.0),
                    child: Text('Nombre: Christopher Montero', style: TextStyle( fontSize: 19.0,),),)
                  ,Padding(padding: EdgeInsets.all(10.0),
                    child: Text('Github: https://github.com/christopherjael', style: TextStyle( fontSize: 19.0,),),)
                ],
              ),
            ),
          ),
        )
    );
  }
}
