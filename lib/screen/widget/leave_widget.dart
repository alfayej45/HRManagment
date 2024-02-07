import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
class LeaveWidget extends StatelessWidget {
 final String type;
   LeaveWidget({super.key,required this.type});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 5, right: 5,top: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('images/images.jpg'),
              ),
              title: Text(
                'William Browns',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              subtitle: Text(
                'William',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
              trailing:type=='atte'? Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(Icons.message),
                  Icon(Icons.call), // icon-1
                  // icon-2
                ],
              ): type=='notif'? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Approve',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ):Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Notes:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: ReadMoreText(
                'The concept of management has been around for thousands of years. According to Pindur, Rogers, and Kim (1995), elemental approaches to management go back at least 3000 years before',
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: '..Show less',
                lessStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                moreStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
