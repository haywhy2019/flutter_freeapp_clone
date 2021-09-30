import 'package:flutter/material.dart';
import '../model/sectionModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProvideSection with ChangeNotifier {
  List<Section> _sectionItems = [
    // Section(
    //   title: "test1",
    //   imageUrl: "assets/images/image1.jpeg",
    //   subtitle: "first",
    // ),
    // Section(
    //   title: "test1",
    //   imageUrl: "assets/images/image1.jpeg",
    //   subtitle: "first",
    // ),
    // Section(
    //   title: "test1",
    //   imageUrl: "assets/images/image1.jpeg",
    //   subtitle: "first",
    // )
  ];

  List<Section> get sectionItems {
    return [..._sectionItems];
  }

  Future<void> getSection(String urlLink) async {
    final url = Uri.parse(urlLink);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization':'Client-IDDXHwJ0HHqAlNtrnm8mo9qcp082gyMOiYW1TPlbtuMQ0'
        }
      );
      print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData);
      print(extractedData['name']);
      print(extractedData['gender']);


      final List<Section> loadedData = [];

      loadedData.add(Section(
        title: extractedData['name'],
        subtitle: extractedData['gender'],
        imageUrl: "assets/images/image1.jpeg",
      ));
      loadedData.add(Section(
        title: extractedData['name'],
        subtitle: extractedData['gender'],
        imageUrl: "assets/images/image1.jpeg",
      ));
      loadedData.add(Section(
        title: extractedData['name'],
        subtitle: extractedData['gender'],
        imageUrl: "assets/images/image1.jpeg",
      ));
      _sectionItems = loadedData;
      print(loadedData);
      print("-----");
      print(_sectionItems);

      notifyListeners();
    } catch (err) { 
      print(err);
      throw err;
    }
  }
}
