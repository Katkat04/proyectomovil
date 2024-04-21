import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_reports_u_s_widget.dart' show CreateReportsUSWidget;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateReportsUSModel extends FlutterFlowModel<CreateReportsUSWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for budgetName widget.
  FocusNode? budgetNameFocusNode;
  TextEditingController? budgetNameTextController;
  String? Function(BuildContext, String?)? budgetNameTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    budgetNameFocusNode?.dispose();
    budgetNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
