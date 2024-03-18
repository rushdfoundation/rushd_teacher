import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'complate_profilestep2_widget.dart' show ComplateProfilestep2Widget;
import 'package:flutter/material.dart';

class ComplateProfilestep2Model
    extends FlutterFlowModel<ComplateProfilestep2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  DateTime? datePicked;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode1;
  TextEditingController? passwordConfirmController1;
  String? Function(BuildContext, String?)? passwordConfirmController1Validator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode2;
  TextEditingController? passwordConfirmController2;
  String? Function(BuildContext, String?)? passwordConfirmController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    passwordConfirmFocusNode1?.dispose();
    passwordConfirmController1?.dispose();

    passwordConfirmFocusNode2?.dispose();
    passwordConfirmController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
