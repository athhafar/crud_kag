import 'package:get/get_connect/http/src/request/request.dart';

class ListGudangModel {
  ListGudangModel({
    required this.id,
    required this.groupId,
    required this.name,
    required this.address,
    required this.remark,
    required this.deleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int groupId;
  late final String name;
  late final String address;
  late final String remark;
  late final int deleted;
  late final int createdBy;
  late final int updatedBy;
  late final String createdAt;
  late final String updatedAt;

  ListGudangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    groupId = json['group_id'] ?? 0;
    name = json['name'] ?? '';
    address = json['address'] ?? '';
    remark = json['remark'] ?? "";
    deleted = json['deleted'] ?? 0;
    createdBy = json['created_by'] ?? 0;
    updatedBy = json['updated_by'] ?? 0;
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['group_id'] = groupId;
    _data['name'] = name;
    _data['address'] = address;
    _data['remark'] = remark;
    _data['deleted'] = deleted;
    _data['created_by'] = createdBy;
    _data['updated_by'] = updatedBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
