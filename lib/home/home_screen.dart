import 'package:flutter/material.dart';
import '../data/list_nama.dart'; // Import the list_nama.dart file

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),

      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: Listname.length,
        itemBuilder: (BuildContext context, int index) {
          final dataName = Listname[index];
          return Text(dataName, style: TextStyle(fontSize: 20));
        },
      ),
    );
  }
}
 
 
 
 
 
 
 
 
//  Widget build(BuildContext context) {
//      AppBar(
//               title: const Text('My Menu'),
//               backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//      );
//     return ListView.builder(
//       padding: const EdgeInsets.all(8),
//       itemCount: Listname.length,
//       itemBuilder: (context, index) {
//         return Container(
//           height: 50,
//           color: Colors.amber[(index % 9 + 1) * 100],
//           child: Center(child: Text(Listname[index])),
//         );
//       },
//     );
//   }
// }