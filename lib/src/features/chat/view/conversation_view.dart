import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:acumen_task/src/content/utilities/app_images.dart';
import 'package:acumen_task/src/features/chat/model/chat_model.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/shared/widgets/custom_text_field.dart';
import 'package:acumen_task/src/shared/widgets/spacing.dart';
import 'package:acumen_task/src/shared/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:bubble/bubble.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({
    this.chatModel,
  });
  final ChatModel? chatModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StatusBar(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          leading: InkWell(
            onTap: () => context.read(navigationService).back(),
            child: Icon(
              IconlyLight.arrow_left,
              color: AppColors.black,
            ),
          ),
          centerTitle: false,
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.orange,
                child: ClipOval(
                  child: Container(
                    height: 48,
                    width: 48,
                    child: Image.asset(
                      AppImages.alexMurray,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                radius: 24,
              ),
              Spacing.smallWidth(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.alexMurray,
                    style: textTheme.headline3!.copyWith(fontSize: 17),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors.green,
                      ),
                      Spacing.tinyWidth(),
                      Text(
                        AppStrings.online,
                        style: textTheme.bodyText2!
                            .copyWith(color: AppColors.grey),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          actions: [
            Icon(
              IconlyBold.call,
              color: AppColors.black,
            ),
            Spacing.bigWidth(),
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      AppStrings.april1,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyText2!
                          .copyWith(color: AppColors.textNormalGrey),
                    ),
                    Bubble(
                      margin: const BubbleEdges.only(top: 10),
                      alignment: Alignment.topRight,
                      radius: Radius.circular(14),
                      nip: BubbleNip.rightBottom,
                      color: AppColors.lightOrange,
                      child: Text(AppStrings.message1,
                          style: textTheme.bodyText2!.copyWith(
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.right),
                    ),
                    Bubble(
                      margin: const BubbleEdges.only(top: 10),
                      radius: Radius.circular(14),
                      alignment: Alignment.topLeft,
                      color: AppColors.lightGrey,
                      nip: BubbleNip.leftBottom,
                      child: Text(
                        AppStrings.message1reply,
                        style: textTheme.bodyText2!.copyWith(
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Spacing.smallHeight(),
                    Text(
                      AppStrings.twelveThirty,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyText2!
                          .copyWith(color: AppColors.textNormalGrey),
                    ),
                    Bubble(
                      margin: const BubbleEdges.only(top: 10),
                      alignment: Alignment.topRight,
                      radius: Radius.circular(14),
                      nip: BubbleNip.rightBottom,
                      color: AppColors.lightOrange,
                      child: Text(AppStrings.message2,
                          style: textTheme.bodyText2!.copyWith(
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.right),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.lightGrey),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                    Spacing.bigWidth(),
                    Flexible(
                      child: CustomTextField(
                        hintText: 'Aa',
                        suffix: Icon(
                          IconlyBold.voice,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
