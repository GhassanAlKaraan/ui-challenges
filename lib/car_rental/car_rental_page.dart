import 'package:flutter/material.dart';
import 'package:ui_challenges/car_rental/cat_card.dart';

import 'rent_car_card.dart';

final List<Map<String, dynamic>> carRentals = [
  {
    'name': 'AMG GT S',
    'price': 250,
    'prop1': '5 Seater',
    'prop2': 'Automatic',
    'prop3': 'Diesel',
    'path': 'assets/car_rental/car1.png', // Added path
  },
  {
    'name': 'Tesla Model 3',
    'price': 300,
    'prop1': '5 Seater',
    'prop2': 'Automatic',
    'prop3': 'Electric',
    'path': 'assets/car_rental/car2.png', // Added path
  },
  {
    'name': 'Ford Explorer',
    'price': 200,
    'prop1': '7 Seater',
    'prop2': 'Automatic',
    'prop3': 'Petrol',
    'path': 'assets/car_rental/car3.png', // Added path
  },
  {
    'name': 'Chevrolet Bolt',
    'price': 180,
    'prop1': '5 Seater',
    'prop2': 'Automatic',
    'prop3': 'Electric',
    'path': 'assets/car_rental/car4.png', // Added path
  },
  {
    'name': 'BMW 5 Series',
    'price': 350,
    'prop1': '5 Seater',
    'prop2': 'Automatic',
    'prop3': 'Diesel',
    'path': 'assets/car_rental/car5.png', // Added path
  },
];

class CarRentalPage extends StatefulWidget {
  const CarRentalPage({super.key});

  @override
  State<CarRentalPage> createState() => _CarRentalPageState();
}

class _CarRentalPageState extends State<CarRentalPage> {
//!
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
//!

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double categoriesHeight = size.height * 0.15;
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey[600],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: Icon(
                Icons.menu,
                color: Colors.grey[600],
              ),
            ),
          ],
          title: Text(
            'C A R    R E N T',
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : categoriesHeight,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CatCard(icon: Icons.search),
                      CatCard(icon: Icons.car_rental),
                      CatCard(icon: Icons.abc),
                      CatCard(icon: Icons.abc),
                      CatCard(icon: Icons.abc),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        controller: controller,
                        itemCount: carRentals.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: RentCar(
                              name: carRentals[index]['name'],
                              carImagePath: carRentals[index]['path'],
                              pricePerDay: carRentals[index]['price'],
                              prop1: carRentals[index]['prop1'],
                              prop2: carRentals[index]['prop2'],
                              prop3: carRentals[index]['prop3'],
                            ),
                          );
                        },
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
