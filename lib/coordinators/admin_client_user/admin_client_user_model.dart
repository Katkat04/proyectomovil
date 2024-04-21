import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_client_user_widget.dart' show AdminClientUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminClientUserModel extends FlutterFlowModel<AdminClientUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y2018jy2' /* Please enter the patients full... */,
      );
    }

    return null;
  }

  // State field(s) for idUser widget.
  FocusNode? idUserFocusNode;
  TextEditingController? idUserTextController;
  final idUserMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? idUserTextControllerValidator;
  String? _idUserTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k920hz5m' /* Please enter the date of birth... */,
      );
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    idUserTextControllerValidator = _idUserTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    idUserFocusNode?.dispose();
    idUserTextController?.dispose();
  }
}
