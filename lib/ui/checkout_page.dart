import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/menus_provider.dart';
import 'package:flutter_application_1/utils/result_state.dart';
import 'package:flutter_application_1/widgets/card_food.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final finalWidth = MediaQuery.of(context).size.width;
    final finalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      body: SizedBox(
        width: finalWidth,
        height: finalHeight,
        child: Stack(
          children: [
            Consumer<MenusProvider>(builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.state == ResultState.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var menu = state.result.datas[index];
                    return CardFood(listMenus: menu);
                  },
                  itemCount: state.result.datas.length,
                );
              } else if (state.state == ResultState.noData) {
                return Center(child: Text(state.message));
              } else if (state.state == ResultState.error) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                    child:
                        Text('Sorry, please check your internet connection.'));
              }
            }),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    width: finalWidth,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        color: Color.fromRGBO(246, 246, 246, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Total Pesanan',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '('  + ' Menu) : ',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Text(
                          'Rp ',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 154, 173, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/vector/divider.png'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    height: 50,
                    width: finalWidth,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(246, 246, 246, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/vector/voucher.png'),
                            const SizedBox(width: 10),
                            const Text(
                              'Voucher',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                elevation: 10,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: const EdgeInsets.all(22),
                                    height: 200,
                                    width: finalWidth,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              const SizedBox(height: 30),
                                              Image.asset(
                                                  'assets/vector/voucher.png'),
                                              const SizedBox(width: 10),
                                              const Text(
                                                'Punya kode voucher?',
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'Masukkan kode voucher disini',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const TextField(
                                          maxLines: 1,
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width: finalWidth,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Validasi Voucher',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                shape: const StadiumBorder(),
                                                primary: const Color.fromRGBO(
                                                    0, 154, 173, 1),
                                                shadowColor:
                                                    const Color.fromRGBO(
                                                        0, 113, 127, 1),
                                                elevation: 9),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              const Text(
                                'Input Voucher',
                                style: TextStyle(
                                    color: Color.fromRGBO(46, 46, 46, 0.5)),
                              ),
                              const SizedBox(width: 7),
                              Image.asset('assets/vector/voucher_arrow.png')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    width: finalWidth,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              spreadRadius: 0.5,
                              blurRadius: 7),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/vector/cart.png'),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  'Total Pembayaran',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(46, 46, 46, 0.75),
                                  ),
                                ),
                                Text(
                                  'Rp ',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(0, 154, 173, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Pesan Sekarang',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: const Color.fromRGBO(0, 154, 173, 1),
                              shadowColor: const Color.fromRGBO(0, 113, 127, 1),
                              elevation: 9),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
