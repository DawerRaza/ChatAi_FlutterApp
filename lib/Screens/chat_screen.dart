
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:personal_ai/constants/constants.dart';
import 'package:personal_ai/models/chat_model.dart';
import 'package:personal_ai/providers/models_provider.dart';
import 'package:personal_ai/services/api_services.dart';
import 'package:personal_ai/services/servicies.dart';
import 'package:personal_ai/widgets/chat_widget.dart';
import 'package:provider/provider.dart';

import '../services/assets_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
   bool  _isTyping = false;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  List<ChatModel> chatList = [];
  @override

  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
          backgroundColor: Colors.black54,
        leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AssetsManager.openaiLogo),
      ),title: const Text("Chat Ai", style: TextStyle(
        fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white
      ),
      ),actions: [IconButton
        (onPressed: () async {
        await Servicies.showModelSheet(context: context);
      }, icon: const Icon(Icons.more_vert_rounded, color: Colors.white,),
      ),
      ],
      ),
      body: SafeArea(
          child: Column( children: [
            Flexible(
              child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index){
                    return ChatWidget(
                      msg: chatList[index].msg,
                      chatIndex: chatList[index].chatIndex,
                    );
                  }
                  ),
            ),
            if(_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 40,
          ),],
          const SizedBox(height: 20,),
          Material(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: textEditingController,
                  onSubmitted: (value) async
                  {await sendMessagesFCT(
                    modelsProvider: modelsProvider,
                  );
                      },

                    decoration: const InputDecoration.collapsed(hintText: "How Can I Help You", hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                  IconButton(
                      onPressed: () async {await sendMessagesFCT(modelsProvider: modelsProvider,);},
                      icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ))
              ],
              ),
            ),
          ),

      ],
        
      )),
    );
  }
  Future<void> sendMessagesFCT ({required ModelsProvider modelsProvider }) async {
    try {
      setState(() {
        _isTyping = true;
      });
      chatList = await ApiServices.sendMessage(
        message: textEditingController.text,
        modelId: modelsProvider.getCurrentModel,
      );
      setState(() {

      });
    } catch (eroor) {
      log("eroor $eroor");
    }
    finally {
      setState(() {
        _isTyping = false;
      });
    }
  }
}
