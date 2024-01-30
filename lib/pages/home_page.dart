import 'package:flutter/material.dart';
import 'package:interface_one/util/smart_device_box.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 25;
  final double verticalPadding = 15;
  List mySmartDevices = [
    ['Smart Light', 'lib/icons/light_bulb.png', true],
    ['Smart AC', 'lib/icons/air_conditioner.png', false],
    ['Smart TV', 'lib/icons/smart_tv.png', false],
    ['Smart Fan', 'lib/icons/fan.png', false],
  ];
  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('lib/icons/menu.png',
                    height: 40,
                    color: Colors.grey.shade800,
                  ),
                  Icon(Icons.person,
                    size: 40,
                    color: Colors.grey.shade800,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home,', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  Text('MUCH OLA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize: 50),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey,
                thickness: 1,

              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text('Smart Devices',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey.shade800
              ),),
            ),
            Expanded(child: GridView.builder(
              itemCount: mySmartDevices.length,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(25),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
      childAspectRatio: 1 /1.3,
    ),
    itemBuilder: (context, index){
      return SmartDeviceBox(
        smartDeviceName: mySmartDevices[index][0],
        iconPath: mySmartDevices[index][1],
        powerOn: mySmartDevices[index][2],
        onChnaged: (value) => powerSwitchChanged(value, index),
      );
    }
            ),
            )
          ],
        ),
      ),
    );
  }
}
