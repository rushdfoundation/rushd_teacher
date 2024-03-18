import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/appbar/appbar_widget.dart';
import 'general_information_widget.dart' show GeneralInformationWidget;
import 'package:flutter/material.dart';

class GeneralInformationModel
    extends FlutterFlowModel<GeneralInformationWidget> {
  ///  Local state fields for this page.

  dynamic profileVariable;

  List<dynamic> educations = [];
  void addToEducations(dynamic item) => educations.add(item);
  void removeFromEducations(dynamic item) => educations.remove(item);
  void removeAtIndexFromEducations(int index) => educations.removeAt(index);
  void insertAtIndexInEducations(int index, dynamic item) =>
      educations.insert(index, item);
  void updateEducationsAtIndex(int index, Function(dynamic) updateFn) =>
      educations[index] = updateFn(educations[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (get profile)] action in GeneralInformation widget.
  ApiCallResponse? getProfileApiResponse;
  // Model for Appbar component.
  late AppbarModel appbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
