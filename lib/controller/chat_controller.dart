import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark_app/controller/profile_controller.dart';
import 'package:sampark_app/models/chat_model.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  ProfileController controller = Get.put(ProfileController());
  RxBool isloading = false.obs;

  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;
    // Consistent room ID generation
    return currentUserId.compareTo(targetUserId) < 0
        ? '$currentUserId-$targetUserId'
        : '$targetUserId-$currentUserId';
  }

  Future<void> sendMessage(String targetUserId, String message) async {
    isloading.value = true;
    String roomId = getRoomId(targetUserId);
    print(roomId);
    String chatId = Uuid().v6();

    // Add debug print
    print("Sending to room: $roomId");

    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      sendername: controller.currentUser.value.name,
      timestamp: DateTime.now().toString(), // Changed to server timestamp
    );

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());
      print("Message sent successfully");
    } catch (e) {
      print("Send error: ${e.toString()}");
    }
    isloading.value = false;
  }

  Stream<List<ChatModel>> getMessages(String targetUserId) {
    String roomId = getRoomId(targetUserId);
    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy('timestamp', descending: false) // Changed to ascending
        .snapshots()
        .map((event) {
      print("Fetched ${event.docs.length} messages");
      return event.docs.map((e) => ChatModel.fromJson(e.data())).toList();
    });
  }
}
