import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/service/models.dart';
import 'package:tutor/service/store.dart';
import '../components/messagesList.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

// import 'package:chat_bubbles/chat_bubbles.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<StatefulWidget> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  ChatPageState({Key? key});

  @override
  void initState() {
    socket = IO.io(
        'http://localhost:8080',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
    socket.connect();
    setUpSocketListeners();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //============================================================================
  TextEditingController msgInputController = TextEditingController();
  late IO.Socket socket;

  ChatController chatController = ChatController();

  void sendMessage(String text) {
    var messageJson = {"message": text, "sentByMe": socket.id};
    socket.emit('message', messageJson);
    chatController.ChatMessages.add(Message.fromJSON(messageJson));
  }

//============================================================================
  void setUpSocketListeners() {
    socket.on('message-receive', (data) {
      print(data);
      chatController.ChatMessages.add(Message.fromJSON(data));
    });
    // socket.on('connected-user', (data) {
    //   print(data);
    //   chatController.ConnectedUser.value = data;
    // });
  }

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: white,
            title: Text(
              chatsData[0].name,
              style: TextStyle(fontSize: 24, color: black),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: black),
            actions: [
              IconButton(
                  onPressed: () => {
                        //                List<DropdownMenuItem> choices = [
                        //   DropdownMenuItem(
                        //     value: 1,
                        //     child: Row(
                        //       children: [
                        //         Icon(Icons.image_search),
                        //         Text("  Choose from gallery", style: kMenuItemStyle),
                        //       ],
                        //     ),
                        //   ),
                        //   DropdownMenuItem(
                        //     value: 2,
                        //     child: Row(
                        //       children: [
                        //         Icon(Icons.camera_alt_outlined),
                        //         Text("  Take a photo", style: kMenuItemStyle),
                        //       ],
                        //     ),
                        //   ),
                        // ];
                      },
                  icon: const Icon(Icons.more_vert))
            ]),
        body: Column(
          children: [
            //////// connected users
            // Expanded(
            //     child: Obx(
            //       ()=> Container(
            //         padding: EdgeInsets.all(10),
            //                     child: Text(
            //       "Connected User ${chatController.ConnectedUser}",
            //                     style:  TextStyle(
            //       color: Colors.white, fontSize: 20
            //                     ),),
            //                   ),
            //     )),
            /////// message
            Expanded(
              flex: 9,
              child: Obx(
                () => ListView.builder(
                    itemCount: chatController.ChatMessages.length,
                    itemBuilder: (context, index) {
                      var currentItem = chatController.ChatMessages[index];
                      return MessageItem(
                        sentByMe: currentItem.sentByMe == socket.id,
                        message: currentItem.message,
                      );
                    }),
              ),
            ),
            ////// MessageBar
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                // color: Colors.amber,
                child: TextField(
                  style: TextStyle(color: black),
                  cursorColor: Colors.purple,
                  controller: msgInputController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: basecolor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: basecolor,
                        ),
                        child: IconButton(
                          onPressed: () {
                            sendMessage(msgInputController.text);
                            msgInputController.text = "";
                          },
                          icon: Icon(Icons.send_rounded, color: basecolor3),
                        ),
                      )),
                ),
              ),
            ),
          ],
        )

        //////////////////////////// UI //////////////////////////
        //  Column(children: [
        //   const Expanded(child: ChatList()),
        //   //      DashChat(
        //   //   currentUser: currUser![0],
        //   //   onSend: (ChatMessage m) {
        //   //     setState(() {
        //   //       messages.insert(0, m as Map<String, Object>);
        //   //     });
        //   //   },
        //   //   messages: messages,
        //   // ),

        //   ///// Input Message text
        //   MessageBar(
        //     // message: 'typeeeee',
        //     onSend: (message) => {null},
        //     sendButtonColor: basecolor,
        //     replyingTo: "Type Message..",
        //     actions: [
        //       InkWell(
        //           child: Icon(Icons.emoji_emotions, color: basecolor, size: 24),
        //           onTap: () => {print('Emoji button tapped')})
        //     ],
        //   )
        // ])
        //////////////////////////// UI //////////////////////////

        );
  }
}

//============================================================================

//===========================================================================
