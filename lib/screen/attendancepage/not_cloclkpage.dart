
import 'package:flutter/material.dart';
class NotClockPage extends StatefulWidget {
  const NotClockPage({super.key});

  @override
  State<NotClockPage> createState() => _NotClockPageState();
}

class _NotClockPageState extends State<NotClockPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Clock in Yet'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: ListView.builder(
                 itemCount: 5,
                  shrinkWrap:true,
                  primary: false,
                  itemBuilder:(context,index){
                    return ListTile(
                      leading:CircleAvatar(
                        radius: 18,
                        backgroundImage:
                        AssetImage('images/images.jpg'),
                      ),
                      title: Text(
                        'William Browns',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),
                      ),
                      subtitle: Text(
                        'William',
                        style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 12),
                      ),
                      trailing:  Wrap(
                        spacing: 12, // space between two icons
                        children: <Widget>[
                          Icon(Icons.message),
                          Icon(Icons.call), // icon-1
                          // icon-2
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
