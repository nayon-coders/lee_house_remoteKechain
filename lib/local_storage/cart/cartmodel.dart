import 'package:hive/hive.dart';

part 'cartmodel.g.dart';

@HiveType(typeId: 0)
class HiveCartModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? qty;

  @HiveField(3)
  String? image;

  @HiveField(4)
  String? price;

  @HiveField(5)
  String? resid;
  @HiveField(6)
  String? resName;

  HiveCartModel(this.id, this.name, this.qty, this.image, this.price, this.resid, this.resName);
}


class HiveCartRestaurantInfoModel{
  final String restId;
  final String resName;
  HiveCartRestaurantInfoModel({required this.restId, required this.resName});
}
