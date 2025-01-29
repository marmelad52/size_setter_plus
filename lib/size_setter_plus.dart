// ignore_for_file: public_member_api_docs, sort_constructors_first
library size_setter_plus;

import 'package:flutter/material.dart';

part './helpers/dimens.dart';
part './helpers/extensions.dart';
part './helpers/widgets/height_sized_box.dart';
part './helpers/widgets/width_sized_box.dart';

/// This is a class which is used to set the  Source device size from  Stateful widget
/// for Example
/// @override
/// ``` dart
/// void didChangeDependencies() {
///    SizeSetterUtils.setSourceDeviceSize(
///       context: context,sourceWidth: 300,  sourceHeight: 700);
///   super.didChangeDependencies();
/// }
/// ```
abstract class SizeSetterUtils {
  static void setSourceDeviceSize({
    required BuildContext context,
    double sourceWidth = 430,
    double sourceHeight = 932,
  }) {
    /// Set Th value to common accessable variable
    Utils.setSizers(
        context: context, setupWidth: sourceWidth, setupHeight: sourceHeight);
  }
}

/// This Class which is used to initialize the  size_setter package from Stateless Widget
class SizeSetter extends StatelessWidget {
  const SizeSetter({
    super.key,
    required this.child,
    this.sourceWidth = 430,
    this.sourceHeight = 932,
  });

  final Widget child;
  final double sourceWidth;
  final double sourceHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        SizeSetterUtils.setSourceDeviceSize(
          context: context,
          sourceWidth: sourceWidth,
          sourceHeight: sourceHeight,
        );
        
        return child;
      }),
    );
  }
}
