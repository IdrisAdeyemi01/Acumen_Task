import 'package:acumen_task/src/content/utilities/base_change_notifiers.dart';
import 'package:acumen_task/src/features/chat/model/chat_model.dart';
import 'package:acumen_task/src/features/chat/model/mock_chats.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatNotifier extends BaseChangeNotifier {
  List<ChatModel> getChats() {
    List<ChatModel> chatModels = [];
    for (var chat in mockChats) {
      ChatModel chatModel = ChatModel.fromMap(chat);
      chatModels.add(chatModel);
    }
    return chatModels;
  }
}

final chatProvider = Provider<ChatNotifier>(
  (ref) => ChatNotifier(),
);
