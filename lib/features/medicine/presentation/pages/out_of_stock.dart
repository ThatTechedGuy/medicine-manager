import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:medicine_manager/core/api.dart';

class OutOfStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(vendors), pollInterval: 1),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Center(
            child: result.hasException
                ? Text(result.exception.toString())
                : result.loading
                    ? CircularProgressIndicator()
                    : TaskList(
                        list: result.data['vendors'],
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
        final vendor = this.list[index];
        return Container(
          height: MediaQuery.of(context).size.height * 0.33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey[200],
          ),
          margin: EdgeInsets.all(7.0),
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 15.0,
            right: 15.0,
          ),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Text(
                    vendor['name'].toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_city),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      child: Text(
                        vendor['address'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.email),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      child: Text(
                        vendor['email'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      child: Text(
                        vendor['phoneNumber'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TaskList2(
                onRefresh: onRefresh,
                list: vendor['medicines'],
              )
            ],
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:medicine_manager/core/api.dart';

// class OutOfStock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Query(
//         options:
//             QueryOptions(documentNode: gql(requiredMedicines), pollInterval: 1),
//         builder: (QueryResult result,
//             {VoidCallback refetch, FetchMore fetchMore}) {
//           return Center(
//             child: result.hasException
//                 ? Text(result.exception.toString())
//                 : result.loading
//                     ? CircularProgressIndicator()
//                     : TaskList(
//                         list: result.data['isShort'],
//                         onRefresh: refetch,
//                       ),
//           );
//         });
//   }
// }

class TaskList2 extends StatelessWidget {
  final List<dynamic> list;
  final dynamic onRefresh;

  TaskList2({@required this.list, @required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Id',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('Medicine Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Required',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                      child: Text('Available',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      width: 100,
                      alignment: Alignment.centerRight),
                ],
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * list.length / 10,
          child: ListView.builder(
            itemCount: this.list.length,
            itemBuilder: (context, index) {
              final medicine = this.list[index];
              if (medicine['isShort'] != true) return null;
              print(medicine.toString());
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
                    Text(medicine['id'].toString()),
                    Text(medicine['name'].toString(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w300)),
                    Row(
                      children: [
                        Text(
                          (medicine['minimumQuantity'] < medicine['quantity']
                                  ? 0
                                  : medicine['minimumQuantity'] -
                                      medicine['quantity'])
                              .toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 100.0,
                          alignment: Alignment.centerRight,
                          child: Text(
                            (medicine['quantity']).toString(),
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
          ),
        ),
      ],
    );
  }
}
