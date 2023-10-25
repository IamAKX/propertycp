import 'dart:convert';

class LeadsModel {
  int? id;
  String? propertyType;
  String? mobileNo;
  String? fullName;
  String? status;
  String? comment;
  String? createdDate;
  String? updatedDate;
  int? createdById;
  LeadsModel({
    this.id,
    this.propertyType,
    this.mobileNo,
    this.fullName,
    this.status,
    this.comment,
    this.createdDate,
    this.updatedDate,
    this.createdById,
  });

  LeadsModel copyWith({
    int? id,
    String? propertyType,
    String? mobileNo,
    String? fullName,
    String? status,
    String? comment,
    String? createdDate,
    String? updatedDate,
    int? createdById,
  }) {
    return LeadsModel(
      id: id ?? this.id,
      propertyType: propertyType ?? this.propertyType,
      mobileNo: mobileNo ?? this.mobileNo,
      fullName: fullName ?? this.fullName,
      status: status ?? this.status,
      comment: comment ?? this.comment,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      createdById: createdById ?? this.createdById,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'propertyType': propertyType,
      'mobileNo': mobileNo,
      'fullName': fullName,
      'status': status,
      'comment': comment,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'createdById': createdById,
    };
  }

  factory LeadsModel.fromMap(Map<String, dynamic> map) {
    return LeadsModel(
      id: map['id']?.toInt(),
      propertyType: map['propertyType'],
      mobileNo: map['mobileNo'],
      fullName: map['fullName'],
      status: map['status'],
      comment: map['comment'],
      createdDate: map['createdDate'],
      updatedDate: map['updatedDate'],
      createdById: map['createdById']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LeadsModel.fromJson(String source) =>
      LeadsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LeadsModel(id: $id, propertyType: $propertyType, mobileNo: $mobileNo, fullName: $fullName, status: $status, comment: $comment, createdDate: $createdDate, updatedDate: $updatedDate, createdById: $createdById)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LeadsModel &&
        other.id == id &&
        other.propertyType == propertyType &&
        other.mobileNo == mobileNo &&
        other.fullName == fullName &&
        other.status == status &&
        other.comment == comment &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.createdById == createdById;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        propertyType.hashCode ^
        mobileNo.hashCode ^
        fullName.hashCode ^
        status.hashCode ^
        comment.hashCode ^
        createdDate.hashCode ^
        updatedDate.hashCode ^
        createdById.hashCode;
  }
}
