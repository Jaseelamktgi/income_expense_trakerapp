import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

//Enumerator treating as another table in Hive

//________________Enumerators_______________
@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class TransactionModel {
  @HiveField(0)
  final id;

  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final CategoryType type;

   @HiveField(3)
  final String description;

   @HiveField(5)
  final int amount;
  
  TransactionModel(
      {required this.id,
      required this.name,
      required this.amount,
      required this.description,
      required this.type});

  // @override
  // String toString() {
  //   return '{$id $name $type $amount $description }';
  // }
}
