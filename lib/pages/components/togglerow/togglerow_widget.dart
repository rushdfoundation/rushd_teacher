import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/notification/notification_widget.dart';
import 'package:flutter/material.dart';
import 'togglerow_model.dart';
export 'togglerow_model.dart';

class TogglerowWidget extends StatefulWidget {
  const TogglerowWidget({super.key});

  @override
  State<TogglerowWidget> createState() => _TogglerowWidgetState();
}

class _TogglerowWidgetState extends State<TogglerowWidget> {
  late TogglerowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TogglerowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(),
        child: Visibility(
          visible: responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.dehaze_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
              wrapWithModel(
                model: _model.notificationModel,
                updateCallback: () => setState(() {}),
                child: const NotificationWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
