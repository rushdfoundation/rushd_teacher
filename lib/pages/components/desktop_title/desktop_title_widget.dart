import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/notification/notification_widget.dart';
import 'package:flutter/material.dart';
import 'desktop_title_model.dart';
export 'desktop_title_model.dart';

class DesktopTitleWidget extends StatefulWidget {
  const DesktopTitleWidget({super.key});

  @override
  State<DesktopTitleWidget> createState() => _DesktopTitleWidgetState();
}

class _DesktopTitleWidgetState extends State<DesktopTitleWidget> {
  late DesktopTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesktopTitleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: Color(0xFF606A85),
                  size: 22.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              Container(
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).rushdGreen5,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'lffnnsf5' /* Title */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).rushdPrimary,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: wrapWithModel(
              model: _model.notificationModel,
              updateCallback: () => setState(() {}),
              child: const NotificationWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
