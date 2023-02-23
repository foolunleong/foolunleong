import 'package:etiqa/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> etiqaProviders() =>
    [ChangeNotifierProvider(create: (_) => UserProvider())];
