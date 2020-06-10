import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/add_medicine_bottom_sheet_design.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/add_vendor_bottom_sheet_design.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/transactions_bottom_sheet_design.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/update_medicine_bottom_sheet_design.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/update_vendor_bottom_sheet_design.dart';

class CustomActionButton extends StatelessWidget {
  final List<String> addVendorFields = [
    'Id :  ',
    'Name :  ',
    'Address : ',
    'Phone Number :  ',
  ];

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
            Icons.attach_money,
            color: Colors.black,
          ),
          backgroundColor: Colors.orange,
          label: 'Make Sale',
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TransactionsBottomSheetDesign(
                    transactionName: 'Make Sale',
                  ),
                );
              },
            );
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
          ),
          backgroundColor: Colors.pink,
          label: 'Order',
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TransactionsBottomSheetDesign(
                    transactionName: 'Order',
                  ),
                );
              },
            );
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.red,
          label: 'Add Medicine',
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: AddMedicineBottomSheetDesign(),
                );
              },
            );
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.verified_user, color: Colors.black),
          backgroundColor: Colors.blue,
          label: 'Add vendor',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: AddVendorBottomSheetDesign(),
                );
              },
            );
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.update, color: Colors.black),
          backgroundColor: Colors.green,
          label: 'Update Medicines',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: UpdateMedicineBottomSheetDesign(),
                );
              },
            );
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.supervised_user_circle,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
          label: 'Update Vendor',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  child: UpdateVendorBottomSheetDesign(),
                  height: MediaQuery.of(context).size.height * 0.8,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
