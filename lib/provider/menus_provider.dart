import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/model/menus.dart';
import 'package:flutter_application_1/utils/result_state.dart';

class MenusProvider extends ChangeNotifier {
  final ApiService apiService;

  MenusProvider({Key? key, required this.apiService}) {
    _fetchAllMenus();
  }

  late Menus _menusResult;
  late ResultState _state;
  String _message = '';

  Menus get result => _menusResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchAllMenus() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final menus = await apiService.getListMenus();
      if (menus.datas.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "Data is Empty";
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _menusResult = menus;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Sorry, please check your internet connection";
    }
  }
}
