import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RentCar extends StatelessWidget {
  RentCar({
    super.key,
    required this.name,
    required this.carImagePath,
    required this.pricePerDay,
    this.prop1,
    this.prop2,
    this.prop3
  }
  );

  final String name;
  final String carImagePath;
  String? prop1;
  String? prop2;
  String? prop3;
  final int pricePerDay;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          padding: const EdgeInsets.all(22),
          width: 330,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 20)
                ],
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(prop1 ?? '5 Seater',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                  Text(prop2 ?? 'Automatic',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                  Text(prop3 ?? 'Diesel',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold))
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text('\$$pricePerDay/Day',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  )),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                      child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text('Details',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  )),
                ],
              )
            ],
          )),
      Positioned(
        top: -60,
        left: 5,
        child: Image(
          image: AssetImage(carImagePath),
          height: 150,
          width: 150,
        ),
      )
    ]);
  }
}
