import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:medicine_manager/core/api.dart';

class Medicines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
        options:
            QueryOptions(documentNode: gql(medicines), pollInterval: 1),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Center(
            child: result.hasException
                ? Text(result.exception.toString())
                : result.loading
                    ? CircularProgressIndicator()
                    : TaskList(
                        list: result.data['medicines'],
                        onRefresh: refetch,
                      ),
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
        final medicine = this.list[index];
        // return Column(
        //   children: [
        //     Text(medicine['quantity'].toString()),
        //     Text(medicine['id'].toString()),
        //     Text(medicine['name'].toString()),
        //     Text(medicine['price'].toString()),
        //   ],
        // );
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
              Text(medicine['name'].toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
              Row(
                children: [
                  Text(
                    '-' + medicine['quantity'].toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 100.0,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "+\$" +
                          (medicine['price'] * medicine['quantity']).toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
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