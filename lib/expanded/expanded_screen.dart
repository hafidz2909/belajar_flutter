import 'package:flutter/material.dart';
import 'package:first/grid/grid_screen.dart'; 


class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
            flex:3 ,
            child: Container(
        
              color: Colors.red,
              height: 100,
              width: 100,
            ),
          ),
            Expanded(
              child: Container(
              color: Colors.green,
              height: 100,
              width: 100,
                    ),
            ),
        ],),
        
        Row(children: [
          Expanded(
            flex:2 ,
            child: Container(
        
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ),
            Expanded(
              child: Container(
              color: Colors.amber,
              height: 100,
              width: 100,
                    ),
            ),
        ],),
        Expanded(child: GridScreen())
      ],
    );
  }
}