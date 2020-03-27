class Message {
  String id;
  String content;
  String createdAt;
  String status;
  String conversationId;
  String from;
  String to;

  Message(
      {this.id,
      this.content,
      this.createdAt,
      this.status,
      this.conversationId,
      this.from,
      this.to});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    createdAt = json['created_at'];
    status = json['status'];
    conversationId = json['conversation_id'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['conversation_id'] = this.conversationId;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
