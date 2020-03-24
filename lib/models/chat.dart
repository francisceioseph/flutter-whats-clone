class Chat {
  String id;
  String userName;
  String userPictureUrl;
  String lastMessgeResume;
  bool pinned;

  Chat({
    this.id,
    this.userName,
    this.userPictureUrl,
    this.lastMessgeResume,
    this.pinned,
  });

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    userPictureUrl = json['user_picture_url'];
    lastMessgeResume = json['last_messge_resume'];
    pinned = json['pinned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['user_picture_url'] = this.userPictureUrl;
    data['last_messge_resume'] = this.lastMessgeResume;
    data['pinned'] = this.pinned;
    return data;
  }
}
