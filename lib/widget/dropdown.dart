import 'package:collection/collection.dart';
import 'package:first/data/list_nama.dart';
import 'package:flutter/material.dart';

class DropdownClass extends StatelessWidget {
  const DropdownClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body: const Center(child: DropdownMenuExample()),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    Listname.map<MenuEntry>(
      (dynamic name) => MenuEntry(value: name, label: name),
    ),
  );
  String dropdownValue = Listname.first;
  String radioValue = Listname.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Nama Sekolah: "),
        DropdownMenu<String>(
          initialSelection: Listname.first,
          onSelected: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          dropdownMenuEntries: menuEntries,
        ),
        ...cityNames.map(
          (name) => RadioListTile<String>(
            title: Text(name),
            value: name,
            groupValue: radioValue,
            onChanged: (String? value) {
              setState(() {
                radioValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
