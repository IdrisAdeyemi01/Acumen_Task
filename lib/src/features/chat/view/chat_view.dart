import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:acumen_task/src/features/chat/model/chat_model.dart';
import 'package:acumen_task/src/features/chat/notifiers/chat_notifier.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/shared/routing/routes.dart';
import 'package:acumen_task/src/shared/widgets/custom_text_field.dart';
import 'package:acumen_task/src/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.chat,
                style: textTheme.headline1,
              ),
              Spacing.smallHeight(),
              CustomTextField(
                hintText: AppStrings.search,
                prefix: Icon(IconlyLight.search),
                suffix: Icon(IconlyBold.filter),
              ),
              Spacing.bigHeight(),
            ],
          ),
        ),
        Expanded(
          child: Consumer(
            builder: (_, watch, __) {
              final chats = watch(chatProvider).getChats();
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: chats.length,
                itemBuilder: (context, index) => ChatListTile(
                  chatModel: chats[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    required this.chatModel,
  });
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Divider(
          thickness: 1.2,
        ),
        ListTile(
          onTap: () {
            context
                .read(navigationService)
                .toNamed(Routes.conversationView, arguments: {chatModel});
          },
          leading: CircleAvatar(
            backgroundColor: AppColors.orange,
            child: ClipOval(
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  chatModel.profilePicture!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            radius: 25,
          ),
          title: Text(
            chatModel.name!,
            style: textTheme.headline3,
          ),
          subtitle: Text(
            '${chatModel.message} . ${chatModel.time}',
            overflow: TextOverflow.ellipsis,
            style: textTheme.headline4!.copyWith(
              fontSize: 15,
            ),
          ),
          trailing: CircleAvatar(
            radius: 5,
            backgroundColor: chatModel.hasUreadMessage!
                ? AppColors.orange
                : AppColors.transparent,
          ),
        ),
      ],
    );
  }
}
