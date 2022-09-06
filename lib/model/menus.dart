import 'dart:convert';

Menus menusFromJson(String str) => Menus.fromJson(json.decode(str));

String menusToJson(Menus data) => json.encode(data.toJson());

class Menus {
  Menus({
    required this.statusCode,
    required this.datas,
  });

  int statusCode;
  List<ListMenus> datas;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        statusCode: json["status_code"],
        datas: List<ListMenus>.from(
            json["datas"].map((x) => ListMenus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
      };
}

class ListMenus {
  ListMenus({
    required this.id,
    required this.nama,
    required this.harga,
    required this.tipe,
    required this.gambar,
  });

  int id;
  String nama;
  int harga;
  String tipe;
  String gambar;

  factory ListMenus.fromJson(Map<String, dynamic> json) => ListMenus(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        tipe: json["tipe"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "tipe": tipe,
        "gambar": gambar,
      };
}
