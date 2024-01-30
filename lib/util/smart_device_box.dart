import 'dart:math';

import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChnaged;

  SmartDeviceBox ({
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChnaged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey.shade900 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(24),
        ),

      padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              iconPath,
          height: 65,
          color: powerOn ? Colors.white : Colors.black,
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(smartDeviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: powerOn ? Colors.white : Colors.black,
                    ),
                    ),
                  ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: Switch(
                    value: powerOn,
                    onChanged: onChnaged,
                ),
              )
            ],
          )
        ],
      ),
      ),
    );

  }
}
