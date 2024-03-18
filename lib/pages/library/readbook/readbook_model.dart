import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/appbar/appbar_widget.dart';
import '/pages/library/author/author_widget.dart';
import 'readbook_widget.dart' show ReadbookWidget;
import 'package:flutter/material.dart';

class ReadbookModel extends FlutterFlowModel<ReadbookWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for Author component.
  late AuthorModel authorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    authorModel = createModel(context, () => AuthorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
    authorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
