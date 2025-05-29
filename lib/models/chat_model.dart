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
    id = json['id'];
    message = json['message'];
    sendername = json['sendername'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    timestamp = json['timestamp'];
    readstatus = json['readstatus'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    audioUrl = json['audioUrl'];
    documentUrl = json['documentUrl'];
    reactions = json['reactions']?.cast<String>();
    replies = json['replies'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'sendername': sendername,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp,
      'readstatus': readstatus,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'audioUrl': audioUrl,
      'documentUrl': documentUrl,
      'reactions': reactions,
      'replies': replies,
    };
  }
}
