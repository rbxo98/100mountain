import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mountain100/app/config/app_config.dart';
import 'package:mountain100/firebase_options.dart';
import 'package:nfc_manager/nfc_manager.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName:EnvPath.envPath);
  runApp( ProviderScope(child: MyApp()));
}

