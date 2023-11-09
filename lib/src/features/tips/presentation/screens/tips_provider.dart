import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/tips/application/tips_service.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';

class TipsProvider extends ChangeNotifier {
  final TipsService _tipsService = TipsService();
  List<Tips> _tipsList = [];

  List<Tips> get tipsList => _tipsList;

  Future<void> fetchTips() async {
    try {
      _tipsList = await _tipsService.getAllTipsFuture();
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
