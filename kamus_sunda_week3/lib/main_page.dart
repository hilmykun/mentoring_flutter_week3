import 'package:flutter/material.dart';
import 'package:kamus_sunda_week3/models/model_dictionary.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Dictionary> dictionary;
  List<Dictionary> dictionaryDetail;

  @override
  void initState() {
    getDictionary().then((value) {
      setState(() {
        dictionary = value;
        dictionaryDetail = dictionary;
      });
    });
    super.initState();
  }

  Future<List<Dictionary>> getDictionary() async {
    try {
      final response =
          await http.get("http://10.0.2.2/kamus-server/get_kamus.php");
      if (response.statusCode == 200) {
        final List<Dictionary> _dictionary =
            dictionaryFromJson(utf8.decode(response.bodyBytes));
        return _dictionary;
      } else {
        List<Dictionary>();
      }
    } catch (e) {
      return List<Dictionary>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("Indonesia-Sunda Kamus")),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(top: 14)),
                maxLines: 1,
                onChanged: (value) {
                  value = value.toLowerCase();
                  setState(() {
                    dictionaryDetail = dictionary.where((element) {
                      var title = element.judul.toLowerCase();
                      return title.contains(value);
                    }).toList();
                  });
                },
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: dictionaryDetail == null ? 0 : dictionaryDetail.length,
              itemBuilder: (context, i) {
                Dictionary dictionary = dictionaryDetail[i];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[200]),
                    child: ListTile(
                      title: Text(
                        dictionary.judul,
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        dictionary.isi,
                        style: TextStyle(fontSize: 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
