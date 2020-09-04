import 'dart:convert';

List<Dictionary> dictionaryFromJson(String str) => List<Dictionary>.from(json.decode(str).map((x) => Dictionary.fromJson(x)));

String dictionaryToJson(List<Dictionary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dictionary{

  String id;
  String judul;
  String isi;

  Dictionary({
    this.id,
    this.judul,
    this.isi,
  });

  factory Dictionary.fromJson(Map<String, dynamic> json) => Dictionary(
    id: json["id"],
    judul: json["judul"],
    isi: json["isi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "isi": isi,
  };
}