import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(GenderizeScreen());

class GenderizeScreen extends StatefulWidget {
  @override
  State<GenderizeScreen> createState() => _GenderizeScreenState();
}

class _GenderizeScreenState extends State<GenderizeScreen> {
  String gender = "";
  String name = "";
  void fetchData(String _name) async {
    var url = Uri.parse('https://api.genderize.io/?name=$_name'); // Reemplaza con la URL de tu API
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      // La solicitud fue exitosa
      gender = jsonDecode(body)['gender'];
      if(gender != 'male' && gender != 'female'){
        gender = '';
      }// Aquí obtienes los datos de la respuesta
      print(gender);
      // Puedes realizar el procesamiento de los datos aquí
    } else {
      // La solicitud falló
      print('Error de red: ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Genderize'),
        ),
        body: Center(
          child: Column(
            children: [

              Padding(padding: EdgeInsets.only(top: 20.0),
                child: gender == "male" ? Icon(Icons.male, size: 80.0,) : gender == "female"? Icon(Icons.female, size: 60.0,) : Icon(Icons.transgender, size: 60.0,)
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
                child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      name = value.toString().trim();
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.black,
                      hoverColor: Colors.black,
                      focusColor: Colors.black
                    )),
              ),

              ElevatedButton(
                onPressed: (){
                  fetchData(name);
                  setState(() {

                  });
                },
                child: Text("Send"), style: ElevatedButton.styleFrom(backgroundColor: Colors.black),)
            ],
          ),
        ),
    );
  }
}
