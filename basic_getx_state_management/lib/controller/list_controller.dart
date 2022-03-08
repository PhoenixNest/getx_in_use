import 'package:get/get.dart';

class ListController extends GetxController {
  RxList _list = [].obs;

  RxList get list => _list;

  void setVallue(int x) {
    _list.add(x);

    print("List Length: " + _list.length.toString());
  }
}
