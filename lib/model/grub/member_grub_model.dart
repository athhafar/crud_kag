class MemberGrubModel {
  MemberGrubModel({
    required this.id,
    required this.groupId,
    required this.userId,
    required this.name,
    required this.email,
    this.photoUrl,
  });
  late final int id;
  late final int groupId;
  late final int userId;
  late final String name;
  late final String email;
  late final Null photoUrl;

  MemberGrubModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    photoUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['group_id'] = groupId;
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['email'] = email;
    _data['photo_url'] = photoUrl;
    return _data;
  }
}
