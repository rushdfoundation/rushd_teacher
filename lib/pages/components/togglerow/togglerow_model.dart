import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/notification/notification_widget.dart';
import 'togglerow_widget.dart' show TogglerowWidget;
import 'package:flutter/material.dart';

class TogglerowModel extends FlutterFlowModel<TogglerowWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Notification component.
  late NotificationModel notificationModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    notificationModel = createModel(context, () => NotificationModel());
  }

  @override
  void dispose() {
    notificationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
