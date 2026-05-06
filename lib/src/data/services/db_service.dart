import 'package:hive_flutter/hive_flutter.dart';

class DbService {
  final box = Hive.box('transactions');

  Future<void> addTransaction(Map<String, dynamic> data) async {
    await box.add(data);
  }

  List getTransactions() {
    return box.values.toList();
  }

  void deleteTransaction(int index) {
    box.deleteAt(index);
  }
}