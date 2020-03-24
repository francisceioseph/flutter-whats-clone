class Message {
  String id;
  String content;
  String createdAt;
  String status;
  String conversationId;

  Message({
    this.id,
    this.content,
    this.createdAt,
    this.status,
    this.conversationId,
  });

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    createdAt = json['created_at'];
    status = json['status'];
    conversationId = json['conversation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['conversation_id'] = this.conversationId;
    return data;
  }
}
