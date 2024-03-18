import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/desktop_title/desktop_title_widget.dart';
import '/pages/components/mobile_appbar/mobile_appbar_widget.dart';
import 'appbar_widget.dart' show AppbarWidget;
import 'package:flutter/material.dart';

class AppbarModel extends FlutterFlowModel<AppbarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MobileAppbar component.
  late MobileAppbarModel mobileAppbarModel;
  // Model for DesktopTitle component.
  late DesktopTitleModel desktopTitleModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mobileAppbarModel = createModel(context, () => MobileAppbarModel());
    desktopTitleModel = createModel(context, () => DesktopTitleModel());
  }

  @override
  void dispose() {
    mobileAppbarModel.dispose();
    desktopTitleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
