import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Learnflutterpage extends StatefulWidget {
  const Learnflutterpage({super.key});

  @override
  State<Learnflutterpage> createState() => _LearnflutterpageState();
}

class _LearnflutterpageState extends State<Learnflutterpage> {
  bool isSwitch = false;
  bool? ischeckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uusi ikkuna'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [IconButton(onPressed: (){debugPrint('actions');}, icon: const  Icon(Icons.info_outline))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('https://img.freepik.com/free-icon/google_318-278809.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.amberAccent,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueGrey,
              width: double.infinity,
              child: const Center(
                child:   Text('kokeile googlettaa',
                    style: TextStyle(color: Colors.white)),
                    
              ),
              
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: isSwitch ? Colors.green : Colors.blue
              ),
              onPressed: (
              
            ){
              debugPrint('elevated button');
              },
               child: const  Text('Elevated button'),
               ),
            OutlinedButton(onPressed: (){
              debugPrint('Outlined button');
              },
               child: const  Text('Outlined button'),
               ),
            TextButton(onPressed: (){
              debugPrint('elevated button');
              },
               child: const  Text('text button'),
               ),
               GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  debugPrint('this is the row');
                },
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:const  [
                  Icon(Icons.local_fire_department,
                  color: Colors.indigo,
                  ),
                  Text('row widget'),
                  Icon(Icons.local_fire_department,
                  ),
                 ],),
               ),
               Switch(value: isSwitch, onChanged:(bool newBool){
                setState(() {
                  isSwitch = newBool;
                });
                
               }),
               Checkbox(value: ischeckbox, onChanged: (bool? newBool){
                setState(() {
                  ischeckbox = newBool;
                });
               }),
               
          ],
        ),
      ),
    );
  }
}
