import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/notification/notification_widget.dart';
import 'desktop_title_widget.dart' show DesktopTitleWidget;
import 'package:flutter/material.dart';

class DesktopTitleModel extends FlutterFlowModel<DesktopTitleWidget> {
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
