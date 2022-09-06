import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/provider/menus_provider.dart';
import 'package:flutter_application_1/ui/checkout_page.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => MenusProvider(apiService: ApiService(Client()))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Monserrat',
          primarySwatch: Colors.blue,
        ),
        home:  const CheckoutPage(),
      ),
    );
  }
}
