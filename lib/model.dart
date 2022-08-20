import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:request_api_helper/request.dart';
import 'package:request_api_helper/request_api_helper.dart';

class Satuan {
  int id;
  Satuan name;

  Satuan({required this.id, required this.name});
}

class Kategori {
  int id;
  String name;
  Satuan satuan;

  Kategori({required this.id, required this.name, required this.satuan});
}

class Item {
  int id;
  String name;
  int price;

  Map<String, dynamic> morp() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  static Item build(data) {
    return Item(
      id: data['id'],
      name: data['name'],
      price: data['price'],
    );
  }

  Item({required this.id, required this.price, required this.name});
}

// class AutoRefreshController {
//   static List listOfWidget = [];
// }

// class AutoRefresh<T> extends StatelessWidget {
//   final ValueListenable<T> listener;
//   final Function(T value) builder;
//   const AutoRefresh({Key? key, required this.listener, required this.builder}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AutoRefreshController.listOfWidget.clear();
//     return ValueListenableBuilder<T>(
//       valueListenable: listener,
//       builder: (_, v, __) {
//         AutoRefreshController.listOfWidget.add(ValueNotifier<T>);
//         return builder(v);
//       },
//     );
//   }
// }

// abstract class AutoRefreshModel<T> {
//   init(List<T> autoRefreshList) {}

//   getList() {
//     AutoRefreshController.listOfWidget.where((element) => false);
//   }
// }

class Controller extends ChangeNotifier {
  static ValueNotifier<List<Item>> item = ValueNotifier([]);

  static refresh(ValueNotifier data) {
    data.notifyListeners();
  }

  static getData() {
    RequestApiHelper.sendRequest(
      type: Api.post,
      url: 'echo/get/json/page/2',
      config: RequestApiHelperDownloadData(onSuccess: (d) {}),
    );
  }
}
