import 'package:flutter/material.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/dashboard.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/statistics.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/transaction.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/floating_action_button.dart';

class MedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Dashboard',
                ),
                Tab(
                  text: 'Statistics',
                ),
                Tab(
                  text: 'Transaction',
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
              Dashboard(),
              Transaction(),
              Statistics(),
            ],
          ),
          floatingActionButton: CustomActionButton(),
        ),
      ),
    );
  }
}
