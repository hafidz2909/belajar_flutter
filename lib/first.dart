// import 'package:flutter/gestures.dart';
import 'package:first/FieldText/login_screen.dart';
import 'package:first/business/Business_screen.dart';
import 'package:first/expanded/expanded_screen.dart';
import 'package:first/grid/grid_screen.dart';
import 'package:first/home/home_screen.dart';
import 'package:first/school/school_screen.dart';
import 'package:first/wellcom_screen.dart';
import 'package:first/widget/dropdown.dart';
import 'package:flutter/material.dart';

class FirstClass extends StatelessWidget {
  const FirstClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Menu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Hafidz"),
              accountEmail: Text("Hafidz@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'Assets/image/images.jpg',
                ), // Ganti dengan gambar lokal Anda
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu Saya",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Business'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusinessScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text("School"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SchoolScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("grid"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("expanded"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpandedScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Login"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("dropdown"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DropdownClass(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("wellcome screen"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroScreens()),
                );
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Container(
          width: 400,
          height: 700,
          margin: EdgeInsets.all(30), // Margin luar
          padding: EdgeInsets.all(10), // Padding dalam
          decoration: BoxDecoration(
            color: Colors.green, // Warna latar belakang
            borderRadius: BorderRadius.circular(10), // Sudut melengkung
            //     boxShadow: [
            // BoxShadow(
            //   color: Colors.black45,
            //   offset: Offset(5, 5),
            //   blurRadius: 10,
            // ),
            //     ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("Assets/image/images.jpg"),
              Container(
                width: 150,
                height: 250,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://www.google.com/imgres?q=lego%20kartun&imgurl=https%3A%2F%2Fget.pxhere.com%2Fphoto%2Fplay-toy-figurine-lego-action-figure-cartoon-inflatable-dustman-1276911.jpg&imgrefurl=https%3A%2F%2Fpxhere.com%2Fid%2Fphoto%2F1276911&docid=um-_eNgnzaURlM&tbnid=oUDmm2kwYXFOmM&vet=12ahUKEwj0xqygmNSLAxXa3TgGHUHFEk0QM3oECHkQAA..i&w=1490&h=2460&hcb=2&ved=2ahUKEwj0xqygmNSLAxXa3TgGHUHFEk0QM3oECHkQAA",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 2, 21, 129),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 2, 21, 129),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text(
                    "My Name is Don Know",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 25,
                      color: const Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 10),
                  Text(
                    "Jalan RingRoad, Jakarta",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 7, 7, 7),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [nomor("0888-8888-8888"), nomor("0899-9999-9999")],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text nomor(no) {
    return Text(
      no,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: const Color.fromARGB(255, 7, 7, 7),
      ),
    );
  }
}
