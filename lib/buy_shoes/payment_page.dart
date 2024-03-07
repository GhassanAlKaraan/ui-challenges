import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
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
                              'Complete Payment',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                          ))
                    ]),
              ),

              Container(
                width: sizeW,
                height: sizeH / 2,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                      bottomRight: Radius.circular(120),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Payment',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      //!
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          child: ListTile(
                            tileColor: Colors.grey[200],
                            title: Text(
                              'Credit Card ***2345',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange[700],
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'NOMAN MANZOR',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.orange[700]),
                            ),
                            leading: Image.asset(
                              'assets/buy_shoes/visa.png',
                            ),
                            trailing: const Icon(Icons.circle_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'Choose another method',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          child: ListTile(
                            tileColor: Colors.grey[200],
                            title: Text(
                              'Credit card or Debit card',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange[700],
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Pay with Visa or Mastercard',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.orange[700]),
                            ),
                            leading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.credit_card,
                                size: 40,
                                color: Colors.grey[700],
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          child: ListTile(
                            tileColor: Colors.grey[200],
                            title: Text(
                              'Paypal',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange[700],
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Image.asset(
                              'assets/buy_shoes/paypal.png',
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
