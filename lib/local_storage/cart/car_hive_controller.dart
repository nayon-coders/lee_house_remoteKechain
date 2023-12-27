import 'package:hive/hive.dart';
import 'package:resturentapp/local_storage/cart/cartmodel.dart';

class HiveCartController {
  static Future<void> openBox() async {
    await Hive.openBox<HiveCartModel>('your_data_box');
  }
  static Box<HiveCartModel> get cartBox => Hive.box<HiveCartModel>('your_data_box');
}
