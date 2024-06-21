import 'package:app_offline/services/sync_service.dart';
import 'package:app_offline/ui/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SyncService syncService = SyncService();
  runApp(const MyApp());
}
