import '/flutter_flow/flutter_flow_util.dart';
import '/pages/activity/activitycomponent/activitycomponent_widget.dart';
import '/pages/components/appbar/appbar_widget.dart';
import '/pages/components/sidebar/sidebar_widget.dart';
import 'activity_widget.dart' show ActivityWidget;
import 'package:flutter/material.dart';

class ActivityModel extends FlutterFlowModel<ActivityWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Model for Activitycomponent component.
  late ActivitycomponentModel activitycomponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    appbarModel = createModel(context, () => AppbarModel());
    activitycomponentModel =
        createModel(context, () => ActivitycomponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidebarModel.dispose();
    appbarModel.dispose();
    activitycomponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
