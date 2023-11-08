import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';

class TipsService {
  final CollectionReference tipsCollection =
      FirebaseFirestore.instance.collection('tips');

  // Tips-Stream

  Stream<List<Tips>> getAllTipsStream() {
    try {
      return tipsCollection.snapshots().map((snapshot) {
        List<Map<String, dynamic>> rawData = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        List<Tips> tips = rawData.map((val) => Tips.fromJson(val)).toList();
        return tips;
      });
    } catch (e) {
      debugPrint(e.toString());
      return Stream.value([]);
    }
  }

  // Tips-Future

  Future<List<Tips>> getAllTipsFuture() async {
    try {
      QuerySnapshot tipsCollection =
          await FirebaseFirestore.instance.collection('tips').get();

      List<Tips> tips = tipsCollection.docs
          .map((doc) => Tips.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return tips;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
