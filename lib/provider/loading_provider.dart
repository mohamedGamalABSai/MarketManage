import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/api/api_consumer.dart';
import 'package:vegan_admin_panel/api/endpoint.dart';

class LoadingProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Simulate loading process
  Future<void> loadContent() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    // Simulate loading delay
    setLoading(false); // Set loading to false when done
  }
}
