import 'package:flutter/widgets.dart';

extension SizedBoxExtension on double {
  SizedBox get w => SizedBox(width: this);
  SizedBox get h => SizedBox(height: this);
}
