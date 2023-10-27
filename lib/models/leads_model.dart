import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:propertycp/models/lead_comment_model.dart';

class LeadsModel {
  int? id;
  String? propertyType;
  String? mobileNo;
  String? fullName;
  String? status;
  List<LeadCommentModel>? leadCommentModel;
  String? createdDate;
  String? updatedDate;
  int? createdById;
  LeadsModel({
    this.id,
    this.propertyType,
    this.mobileNo,
    this.fullName,
    this.status,
    this.leadCommentModel,
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
    List<LeadCommentModel>? leadCommentModel,
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
      leadCommentModel: leadCommentModel ?? this.leadCommentModel,
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
      'leadCommentModel': leadCommentModel?.map((x) => x?.toMap())?.toList(),
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
      leadCommentModel: map['leadCommentModel'] != null
          ? List<LeadCommentModel>.from(
              map['leadCommentModel']?.map((x) => LeadCommentModel.fromMap(x)))
          : null,
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
    return 'LeadsModel(id: $id, propertyType: $propertyType, mobileNo: $mobileNo, fullName: $fullName, status: $status, leadCommentModel: $leadCommentModel, createdDate: $createdDate, updatedDate: $updatedDate, createdById: $createdById)';
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
        listEquals(other.leadCommentModel, leadCommentModel) &&
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
        leadCommentModel.hashCode ^
        createdDate.hashCode ^
        updatedDate.hashCode ^
        createdById.hashCode;
  }
}
