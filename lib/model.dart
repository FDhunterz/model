import 'package:request_api_helper/request.dart';
import 'package:request_api_helper/request_api_helper.dart';

import 'auto_model.dart';

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

class Controller {
  static AutoRefreshListener<List<Item>> item = AutoRefreshListener([]);

  static getData() {
    RequestApiHelper.sendRequest(
      type: Api.get,
      url: 'echo/get/json/page/2',
      config: RequestApiHelperData(
        onSuccess: (d) {
          for (var i in d['items']) {
            item.refresh((value) async {
              value.add(Item.build(i));
            });
          }
        },
      ),
    );
  }
}
