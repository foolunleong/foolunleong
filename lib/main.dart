import 'package:etiqa/providers/_providers.dart';
import 'package:etiqa/app.dart';
import 'package:etiqa/settings/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  buildFluro();
  runApp(
    MultiProvider(
      providers: etiqaProviders(),
      child: const MyApp(),
    ),
  );
}
