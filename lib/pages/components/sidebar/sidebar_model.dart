import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/desktop_drawer/desktop_drawer_widget.dart';
import 'sidebar_widget.dart' show SidebarWidget;
import 'package:flutter/material.dart';

class SidebarModel extends FlutterFlowModel<SidebarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DesktopDrawer component.
  late DesktopDrawerModel desktopDrawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    desktopDrawerModel = createModel(context, () => DesktopDrawerModel());
  }

  @override
  void dispose() {
    desktopDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
