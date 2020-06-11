import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'http://192.168.1.26:5000/graphql'),
  ),
);

final String expiredMedicines = """
query {
  expired {
    id,
    name,
    expiryDate,
    quantity,
    minimumQuantity,
    price,
    vendor{
      id,
      name,
      phoneNumber,
      email,
      address
    }
  }
}
""";

final String requiredMedicines = """
query {
  isShort {
    id,
    name,
    expiryDate,
    quantity,
    minimumQuantity,
    price,
    vendor{
      id,
      name,
      phoneNumber,
      email,
      address
    }
  }
}
""";

final String medicines = """
query {
  medicines{
    id,
    name,
    expiryDate,
    quantity,
    minimumQuantity,
    price,
    vendor{
      id,
      name,
      phoneNumber,
      email,
      address
    }
  }
}
""";

final String sales = """
query {
  sales{
    id,
    quantitySold,
    dateSold,
    medicine{
      id,
      name,
      price,
      quantity,
      minimumQuantity
    }
  }
}
""";

final String orders = """
query {
  orders{
    id,
    quantityOrdered,
    dateOrdered,
    medicine{
      id,
      name,
      price,
      quantity,
      minimumQuantity
    }
  }
}
""";

final String vendors = """
query {
  vendors{
    id,
    address
    name,
    phoneNumber,
    email,
    medicines{
      id,
      name
    }
  }
}
""";

// final String createTaskMutation = """
// mutation CreateTodo(\$id: ID!, \$title: String!) {
//   createTodo(id: \$id, title: \$title, completed: false) {
//     id
//   }
// }
// """;

// final String updateTaskMutation = """
// mutation UpdateTodo(\$id: ID!, \$completed: Boolean!) {
//   updateTodo(id: \$id, completed: \$completed) {
//     id
//   }
// }
// """;
