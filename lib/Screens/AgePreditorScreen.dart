import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(AgePreditorScreen());

class AgePreditorScreen extends StatefulWidget {
  @override
  State<AgePreditorScreen> createState() => _GenderizeScreenState();
}

class _GenderizeScreenState extends State<AgePreditorScreen> {
  int age = 0;
  String name = "";
  String estado = '';
  void fetchData(String _name) async {
    var url = Uri.parse('https://api.agify.io/?name=$_name'); // Reemplaza con la URL de tu API
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      // La solicitud fue exitosa
      age = jsonDecode(body)['age'];
      if(age <= 17){
        estado = 'joven';
      } else if(age >= 18 && age <=59){
        estado = 'adulto';
      }else{
        estado = 'anciano';
      }
      print(estado);
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
        title: Text('Age Preditor'),
      ),
      body: Center(
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: 20.0),
                child: estado == "joven" ? Column(
                  children: [
                    Image.asset('assets/img/jovenes.png', width: 150, height: 150,),
                    Text('Age: $age , Status: $estado')
                  ],
                )
                    : estado == "adulto"? Column(
                  children: [
                    Image.asset('assets/img/adulto.png', width: 150, height: 150,),
                    Text('Age: $age , Status: $estado')
                  ],
                )
                    : estado == 'anciano' ? Column(
                  children: [
                    Image.asset('assets/img/viejos.png', width: 150, height: 150,),
                    Text('Age: $age , Status: $estado')
                  ],
                )
                 : Text('Age')
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
