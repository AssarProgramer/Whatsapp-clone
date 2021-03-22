import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/call_user.dart';

class CallLog extends StatelessWidget {
  List<CallUser> callUser;
  CallLog(this.callUser);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: callUser.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                      callUser[index].receiverPic ?? ''),
                ),
                title: Text(callUser[index].receiverName),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    callUser[index].hasDialled
                        ? Icon(
                            Icons.call_received,
                            color: callUser[index].hasDialled
                                 ? Colors.red
                                : Colors.green,
                            size: 16.0,
                          )
                        : Icon(
                            Icons.call_made,
                            color: callUser[index].hasDialled
                                ? Colors.red
                                : Colors.green,
                            size: 16.0,
                          ),
                    // call.callDetails.length > 1
                    //     ?

                    Text(
                      'Yesterday, ',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    )
                    // : Container(),
                    ,
                    Text(
                      '10:00 PM',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    callUser[index].isAudio ? Icons.call : Icons.videocam,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:whatsapp_clon/src/helpers/text_helpers.dart';
// import 'package:whatsapp_clon/src/models/call.dart';
// import 'package:whatsapp_clon/src/widgets/line_painter.dart';
// import 'package:intl/intl.dart';

// class CallItem extends StatelessWidget {
//   final Call call;
//   final String searchKeyword;
//   final Function onProfileTap;
//   final Function onTap;
//   final Function onLeadingTap;

//   CallItem({
//     this.call,
//     this.searchKeyword,
//     this.onProfileTap,
//     this.onTap,
//     this.onLeadingTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: LinePainter(),
//       child: ListTile(
//         leading: GestureDetector(
//           onTap: () {
//             onProfileTap();
//           },
//           child: CircleAvatar(
//             radius: 30.0,
//             backgroundImage: CachedNetworkImageProvider(call.avatarUrl),
//           ),
//         ),
//         title: searchKeyword == null || searchKeyword.isEmpty
//             ? Text(
//                 call.name,
//                 maxLines: 1,
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )
//             : TextHelpers.getHighlightedText(
//                 call.name,
//                 searchKeyword,
//                 TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 )),
// subtitle: Row(
//   mainAxisSize: MainAxisSize.min,
//   children: <Widget>[
//     call.lastCall.isIncoming
//         ? Icon(
//             Icons.call_received,
//             color: call.lastCall.isMissed ? Colors.red : Colors.green,
//             size: 16.0,
//           )
//         : Icon(
//             Icons.call_made,
//             color: call.lastCall.isMissed ? Colors.red : Colors.green,
//             size: 16.0,
//           ),
//     call.callDetails.length > 1
//         ? Text(
//             '(${call.callDetails.length})',
//             style: TextStyle(
//               fontSize: 12.0,
//               color: Colors.grey,
//             ),
//           )
//         : Container(),
//     Text(
//       DateFormat('dd/MM/yy, HH:mm').format(call.lastCall.timestamp),
//       style: TextStyle(
//         fontSize: 12.0,
//         color: Colors.grey,
//       ),
//     ),
//   ],
// ),

//     );
//   }
// }
