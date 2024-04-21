import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reportsName" field.
  String? _reportsName;
  String get reportsName => _reportsName ?? '';
  bool hasReportsName() => _reportsName != null;

  // "reportDescription" field.
  String? _reportDescription;
  String get reportDescription => _reportDescription ?? '';
  bool hasReportDescription() => _reportDescription != null;

  // "reportCreated" field.
  DateTime? _reportCreated;
  DateTime? get reportCreated => _reportCreated;
  bool hasReportCreated() => _reportCreated != null;

  // "userReports" field.
  DocumentReference? _userReports;
  DocumentReference? get userReports => _userReports;
  bool hasUserReports() => _userReports != null;

  // "reportStarDate" field.
  DateTime? _reportStarDate;
  DateTime? get reportStarDate => _reportStarDate;
  bool hasReportStarDate() => _reportStarDate != null;

  // "reportTime" field.
  String? _reportTime;
  String get reportTime => _reportTime ?? '';
  bool hasReportTime() => _reportTime != null;

  // "reportNumber" field.
  String? _reportNumber;
  String get reportNumber => _reportNumber ?? '';
  bool hasReportNumber() => _reportNumber != null;

  void _initializeFields() {
    _reportsName = snapshotData['reportsName'] as String?;
    _reportDescription = snapshotData['reportDescription'] as String?;
    _reportCreated = snapshotData['reportCreated'] as DateTime?;
    _userReports = snapshotData['userReports'] as DocumentReference?;
    _reportStarDate = snapshotData['reportStarDate'] as DateTime?;
    _reportTime = snapshotData['reportTime'] as String?;
    _reportNumber = snapshotData['reportNumber'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? reportsName,
  String? reportDescription,
  DateTime? reportCreated,
  DocumentReference? userReports,
  DateTime? reportStarDate,
  String? reportTime,
  String? reportNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportsName': reportsName,
      'reportDescription': reportDescription,
      'reportCreated': reportCreated,
      'userReports': userReports,
      'reportStarDate': reportStarDate,
      'reportTime': reportTime,
      'reportNumber': reportNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.reportsName == e2?.reportsName &&
        e1?.reportDescription == e2?.reportDescription &&
        e1?.reportCreated == e2?.reportCreated &&
        e1?.userReports == e2?.userReports &&
        e1?.reportStarDate == e2?.reportStarDate &&
        e1?.reportTime == e2?.reportTime &&
        e1?.reportNumber == e2?.reportNumber;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.reportsName,
        e?.reportDescription,
        e?.reportCreated,
        e?.userReports,
        e?.reportStarDate,
        e?.reportTime,
        e?.reportNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
