import 'package:flutter/material.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/expired.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/medicines.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/orders.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/out_of_stock.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/sales.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/vendor.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/floating_action_button.dart';

class MedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Out of Stock',
                ),
                Tab(
                  text: 'Expired',
                ),
                Tab(
                  text: 'Sales',
                ),
                Tab(
                  text: 'Orders',
                ),
                Tab(
                  text: 'Medicines',
                ),
                Tab(
                  text: 'Vendors',
                ),
              ],
            ),
            title: Text(
              'Medicine Manager',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              OutOfStock(),
              Expired(),
              Sales(),
              Orders(),
              Medicines(),
              Vendors(),
            ],
          ),
          floatingActionButton: CustomActionButton(),
        ),
      ),
    );
  }
}
