import 'package:flutter/material.dart';
class ClockInWidget extends StatelessWidget {
  const ClockInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Clock In'),
      ),
      body: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context,index){
            return ListTile(
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
              trailing: Icon(Icons.arrow_forward_ios),

            );
          }),
    );
  }
}
