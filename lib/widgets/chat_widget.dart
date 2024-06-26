import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_ai/constants/constants.dart';
import 'package:personal_ai/services/assets_manager.dart';
import 'package:personal_ai/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Material(
        color: chatIndex == 0 ? scaffoldBackgroundColor: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Image.asset(
                chatIndex == 0 ? AssetsManager.userImage:AssetsManager.botImage,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child:  chatIndex == 0
                  ?TextWidget(
                  label: msg,
                ):AnimatedTextKit(animatedTexts:
                [TyperAnimatedText(
                  msg.trim(),
                )]) ,
              ),

              chatIndex == 0 ? const SizedBox.shrink():
              const Row(
               mainAxisAlignment: MainAxisAlignment.end,
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(
                   Icons.thumb_up_alt_outlined,
                   color: Colors.white,
                 ),
                 SizedBox(
                   width: 5,
                 ),
                 Icon(Icons.thumb_down_alt_outlined,
                 color: Colors.white,
                 )

               ],
              )

            ],
          ),
        ),
      ),
    ],
    );
  }
}
