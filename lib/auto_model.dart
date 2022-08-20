import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AutoRefreshListener<T> extends ChangeNotifier {
  late ValueNotifier<T> listener;

  AutoRefreshListener(T values) {
    listener = ValueNotifier<T>(values);
  }

  refresh(Function(T value) function) async {
    await function(listener.value);
    listener.notifyListeners();
  }
}

class AutoRefresh<T> extends StatelessWidget {
  final ValueListenable<T> listener;
  final Function(T value) builder;
  const AutoRefresh({Key? key, required this.listener, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(AutoRefreshController.listOfWidget.length);
    return ValueListenableBuilder<T>(
      valueListenable: listener,
      builder: (_, v, __) {
        return builder(v);
      },
    );
  }
}
