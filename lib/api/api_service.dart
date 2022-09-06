import 'dart:convert';

import 'package:flutter_application_1/model/menus.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  static const String _baseUrl = 'https://tes-mobile.landa.id/api/';
  static const String baseUrlImage = 'https://tes-mobile.landa.id/img/';
  static const String _throw = 'Failed to load data';
  static const String _menus = 'menus';

  final Client client;

  ApiService(this.client);

  Future<Menus> getListMenus() async {
    final response = await client.get(Uri.parse(_baseUrl + _menus));

    if (response.statusCode == 200) {
      return Menus.fromJson(json.decode(response.body));
    } else if (response.statusCode == 204) {
      throw Exception('Data tidak ditemukan');
    } else if (response.statusCode == 400) {
      throw Exception('Data gagal ditemukan');
    } else {
      throw Exception(_throw);
    }
  }
}
