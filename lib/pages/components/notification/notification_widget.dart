import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 8.0, 10.0),
      child: badges.Badge(
        badgeContent: Text(
          FFLocalizations.of(context).getText(
            'q8px62ld' /* 1 */,
          ),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Plus Jakarta Sans',
                color: Colors.white,
                fontSize: 8.0,
              ),
        ),
        showBadge: true,
        shape: badges.BadgeShape.circle,
        badgeColor: FlutterFlowTheme.of(context).error,
        elevation: 4.0,
        padding: const EdgeInsets.all(6.0),
        position: badges.BadgePosition.topEnd(),
        animationType: badges.BadgeAnimationType.scale,
        toAnimate: true,
        child: Icon(
          Icons.notifications_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
      ),
    );
  }
}
