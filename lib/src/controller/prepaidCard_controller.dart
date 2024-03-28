import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrepaidCardController extends ChangeNotifier {
  PrepaidCardController(this._read);

  final Reader _read;
}
