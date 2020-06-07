import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // both default to 16
      marginRight: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.red,
            label: 'Add Medicine',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('FIRST CHILD')),
        SpeedDialChild(
          child: Icon(Icons.verified_user, color: Colors.black),
          backgroundColor: Colors.blue,
          label: 'Add vendor',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('SECOND CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.update, color: Colors.black),
          backgroundColor: Colors.green,
          label: 'Update Medicines',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('THIRD CHILD'),
        ),
        SpeedDialChild(
          child: Icon(
            Icons.supervised_user_circle,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
          label: 'Update Vendor',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('FOURTH CHILD'),
        ),
      ],
    );
  }
}
