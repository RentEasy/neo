import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/property.dart';
import 'routes.dart';

void main() => runApp(RentEasyApp());

class RentEasyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<PropertyModel>(
        create: (context) => PropertyModel(),
        update: (context, properties) => PropertyModel(),
      ),
    ], child: Router());
  }
}
