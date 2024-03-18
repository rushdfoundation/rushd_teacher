import '/flutter_flow/flutter_flow_util.dart';
import 'verfication_code_widget.dart' show VerficationCodeWidget;
import 'package:flutter/material.dart';

class VerficationCodeModel extends FlutterFlowModel<VerficationCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
