import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/desktop_title/desktop_title_widget.dart';
import '/pages/components/mobile_appbar/mobile_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'appbar_model.dart';
export 'appbar_model.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  late AppbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              wrapWithModel(
                model: _model.mobileAppbarModel,
                updateCallback: () => setState(() {}),
                child: const MobileAppbarWidget(),
              ),
            wrapWithModel(
              model: _model.desktopTitleModel,
              updateCallback: () => setState(() {}),
              child: const DesktopTitleWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
