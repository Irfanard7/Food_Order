import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/menus.dart';

class CardFood extends StatefulWidget {
  final ListMenus listMenus;

  const CardFood({Key? key, required this.listMenus}) : super(key: key);

  @override
  State<CardFood> createState() => _CardFoodState();
}

class _CardFoodState extends State<CardFood> {
  int _counter = 0;
  late int price;
  late int itemTotal;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 31),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(223, 223, 223, 1),
            ),
            height: 75,
            width: 75,
            child: Image.network(widget.listMenus.gambar),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    widget.listMenus.nama,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'Rp ' + widget.listMenus.harga.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.lightBlue),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/vector/note.png'),
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                      width: 150,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tambahkan Catatan'),
                        maxLines: 1,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 7),
            child: Row(
              children: [
                InkWell(
                  child: Image.asset('assets/vector/minus.png'),
                  onTap: () {
                    setState(() {
                      if (_counter <= 0) {
                        _counter = 0;
                        itemTotal = 0;
                        price = 0;
                      } else {
                        _counter--;
                        itemTotal = _counter;
                        price = widget.listMenus.harga * _counter;
                      }
                    });
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  '$_counter',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                InkWell(
                  child: Image.asset('assets/vector/plus.png'),
                  onTap: () {
                    setState(() {
                      _counter++;
                      itemTotal = _counter;
                      price = widget.listMenus.harga * _counter;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
