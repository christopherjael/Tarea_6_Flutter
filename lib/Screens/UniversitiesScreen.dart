import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tarea_6/models/university.dart';

void main() => runApp(UniversitiesScreen());

class UniversitiesScreen extends StatefulWidget {
  @override
  State<UniversitiesScreen> createState() => _UniversitiesScreen();
}

class _UniversitiesScreen extends State<UniversitiesScreen> {
  String name = "";
  String Domain = "";
  String link = "";
  String university = "";
  List<University> _listUniversities = [];
  void fetchData(String _university) async {
    _university = _university.trim().replaceAll(' ', '+');
    var url = Uri.parse('http://universities.hipolabs.com/search?country=$_university'); // Reemplaza con la URL de tu API
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      // La solicitud fue exitosa
      final List jsonArray = jsonDecode(body);
      jsonArray.forEach((element) {
        _listUniversities.add(University(element['name'].toString(), element['domains'][0].toString(), element['web_pages'][0].toString()));
      });

      for (var obj in _listUniversities){
        print(obj.name);
      }
      // Aquí obtienes los datos de la respuesta
      // Puedes realizar el procesamiento de los datos aquí
    } else {
      // La solicitud falló
      print('Error de red');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Universities'),
      ),
      body: SingleChildScrollView( child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
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
              child: Text("Send"), style: ElevatedButton.styleFrom(backgroundColor: Colors.black),),
            SizedBox(height: 20,),
            Text('Result', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(0), child: Column( children: [for (var i in _listUniversities) UniversityCard(name: '${i.name}', domain: '${i.domains}', webPage: '${i.webPages}')],),)
            
          ],
        ),
      )
    );
  }
}

class UniversityCard extends StatelessWidget {

  final String name;
  final String domain;
  final String webPage;
  const UniversityCard({super.key, required this.name, required this.domain, required this.webPage});


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name: ${name}', style: TextStyle(fontSize: 15.0,), textAlign: TextAlign.start,),
        Text('Domain: ${domain}', style: TextStyle(fontSize: 15.0,), textAlign: TextAlign.start,),
        Text('Web: ${webPage}', style: TextStyle(fontSize: 15.0,), textAlign: TextAlign.start,)
      ],
    );
  }
}



