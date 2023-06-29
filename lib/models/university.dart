class University {
   String name = '';
   String domains = '';
   String webPages = '';

   University(_name, _domains, _webPages){
      this.name = _name;
      this.domains = _domains;
      this.webPages = _webPages;
   }

// factory University.fromJson(Map<String, dynamic> json) {
//   return University(
//     name: json['name'],
//     domains: List<String>.from(json['domains']),
//     webPages: List<String>.from(json['web_pages']),
//   );
// }
}