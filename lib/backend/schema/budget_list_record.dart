import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetListRecord extends FirestoreRecord {
  BudgetListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reportUser" field.
  List<DocumentReference>? _reportUser;
  List<DocumentReference> get reportUser => _reportUser ?? const [];
  bool hasReportUser() => _reportUser != null;

  // "report" field.
  List<String>? _report;
  List<String> get report => _report ?? const [];
  bool hasReport() => _report != null;

  void _initializeFields() {
    _reportUser = getDataList(snapshotData['reportUser']);
    _report = getDataList(snapshotData['report']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgetList');

  static Stream<BudgetListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetListRecord.fromSnapshot(s));

  static Future<BudgetListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetListRecord.fromSnapshot(s));

  static BudgetListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BudgetListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetListRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class BudgetListRecordDocumentEquality implements Equality<BudgetListRecord> {
  const BudgetListRecordDocumentEquality();

  @override
  bool equals(BudgetListRecord? e1, BudgetListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.reportUser, e2?.reportUser) &&
        listEquality.equals(e1?.report, e2?.report);
  }

  @override
  int hash(BudgetListRecord? e) =>
      const ListEquality().hash([e?.reportUser, e?.report]);

  @override
  bool isValidKey(Object? o) => o is BudgetListRecord;
}
