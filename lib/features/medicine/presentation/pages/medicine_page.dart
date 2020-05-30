import 'package:flutter/material.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/dashboard.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/statistics.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/transaction.dart';

class MedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          title: Text('Medicine Manager'),
        ),
        body: TabBarView(
          children: [
            Dashboard(),
            Transaction(),
            Statistics(),
          ],
        ),
      ),
    );
  }
}
