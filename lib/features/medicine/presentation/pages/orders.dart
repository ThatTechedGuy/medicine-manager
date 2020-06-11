import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:medicine_manager/core/api.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(orders), pollInterval: 1),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Center(
            child: result.hasException
                ? Text(result.exception.toString())
                : result.loading
                    ? CircularProgressIndicator()
                    : TaskList(list: result.data['orders'], onRefresh: refetch),
          );
        });
  }
}

class TaskList extends StatelessWidget {
  final List<dynamic> list;
  final dynamic onRefresh;

  TaskList({@required this.list, @required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.list.length,
      itemBuilder: (context, index) {
        final sale = this.list[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey[200],
          ),
          margin: EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sale['medicine']['name'].toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
              Row(
                children: [
                  Text('+' + sale['quantityOrdered'].toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  Container(
                    width: 100.0,
                    alignment: Alignment.centerRight,
                    child: Text(
                        "-\$" +
                            (sale['medicine']['price'] * sale['quantityOrdered'])
                                .toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}