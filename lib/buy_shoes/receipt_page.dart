import 'package:ui_challenges/buy_shoes/shadow.dart';
import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              //* 1
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        //! ORDER SUMMARY CARD
                        padding: const EdgeInsets.all(18),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'ORDER SUMMARY',
                                  style: TextStyle(
                                      color: Colors.orange[300],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SubTotal',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                                Text(
                                  '\$150',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'VAT',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                                Text(
                                  '\$1.50',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shipping',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                                Text(
                                  '\$7.50',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Divider(
                                  color: Colors.orange[200],
                                  thickness: 2,
                                )),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TOTAL',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$159',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: -20,
                          child: Container(
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                                child: Text(
                              'Proceed to Payment',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            )),
                          ))
                    ]),
              )),
          
              Stack(alignment: Alignment.center, children: [
                Container(
                  width: sizeW,
                  height: sizeH / 2,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Checkout',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        //!
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: -20,
                  right: -90,
                  child: SizedBox(
                      height: 320, child: MyShadow(assetPath: 'assets/shoe.png')),
                ),
                const Positioned(
                  top: 50,
                  child: Image(
                      height: 350,
                      image: AssetImage(
                        'assets/buy_shoes/shoe.png',
                      )),
                ),
              ])
            ],
          ),
        ));
  }
}
