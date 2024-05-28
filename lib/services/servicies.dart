import 'package:flutter/material.dart';
import 'package:personal_ai/constants/constants.dart';
import 'package:personal_ai/widgets/drop_down.dart';
import 'package:personal_ai/widgets/text_widget.dart';

class Servicies {
  static Future<void> showModelSheet({required BuildContext context})async{
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ) ,
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context){
          return const Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Flexible(
                    child: TextWidget(
                      label: "Chosen Model:",
                      fontSize: 16,
                    ),
                ),
                Flexible(
                    flex: 2,
                    child: ModelsDrowDownWidget()),
              ],
            ),
          );
        });
}
}