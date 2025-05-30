class ChatModel {
  String? id;
  String? message;
  String? sendername;
  String? senderId;
  String? receiverId;
  String? timestamp;
  String? readstatus;
  String? imageUrl;
  String? videoUrl;
  String? audioUrl;
  String? documentUrl;
  List<String>? reactions;
  List<dynamic>? replies;

  ChatModel({
    this.id,
    this.message,
    this.sendername,
    this.senderId,
    this.receiverId,
    this.timestamp,
    this.readstatus,
    this.imageUrl,
    this.videoUrl,
    this.audioUrl,
    this.documentUrl,
    this.reactions,
    this.replies,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] is String) {
      id = json['id'];
    }
    if (json['message'] is String) {
      message = json['message'];
    }
    if (json['sendername'] is String) {
      sendername = json['sendername'];
    }
    if (json['senderId'] is String) {
      senderId = json['senderId'];
    }
    if (json['receiverId'] is String) {
      receiverId = json['receiverId'];
    }
    if (json['timestamp'] is String) {
      timestamp = json['timestamp'];
    }
    if (json['readstatus'] is String) {
      readstatus = json['readstatus'];
    }
    if (json['imageUrl'] is String) {
      imageUrl = json['imageUrl'];
    }
    if (json['videoUrl'] is String) {
      videoUrl = json['videoUrl'];
    }
    if (json['audioUrl'] is String) {
      audioUrl = json['audioUrl'];
    }
    if (json['documentUrl'] is String) {
      documentUrl = json['documentUrl'];
    }
    if (json['reactions'] is List<String>) {
      reactions = json['reactions'];
    }
    if (json['replies'] is List<dynamic>) {
      replies = json['replies'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['id'] = id;
    _data['message'] = message;
    _data['sendername'] = sendername;
    _data['senderId'] = senderId;
    _data['receiverId'] = receiverId;
    _data['timestamp'] = timestamp;
    _data['readstatus'] = readstatus;
    _data['imageUrl'] = imageUrl;
    _data['videoUrl'] = videoUrl;
    _data['audioUrl'] = audioUrl;
    _data['documentUrl'] = documentUrl;
    if (reactions != null) {
      _data['reactions'] = reactions;
    }
    if (replies != null) {
      _data['replies'] = replies;
    }

    return _data;
  }
}
