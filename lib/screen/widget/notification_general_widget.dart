import 'package:flutter/material.dart';
class NotificationGeneral extends StatelessWidget {
  const NotificationGeneral({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListTile(
        leading: CircleAvatar(
          radius: 18,
         child: Center(child: Icon(Icons.security)),
        ),
        title: Text(
          'William Browns',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        subtitle: Text(
          'The concept of management has been around for thousands of years. According to Pindur, Rogers, and Kim (1995), elemental approaches to management go back at least 3000 years before',
         overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 12),
        ),
        trailing: Icon(Icons.arrow_forward_ios)
      ),
    );
  }
}
