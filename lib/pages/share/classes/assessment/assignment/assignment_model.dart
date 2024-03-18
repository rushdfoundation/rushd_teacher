import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/appbar/appbar_widget.dart';
import 'assignment_widget.dart' show AssignmentWidget;
import 'package:flutter/material.dart';

class AssignmentModel extends FlutterFlowModel<AssignmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Appbar component.
  late AppbarModel appbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
