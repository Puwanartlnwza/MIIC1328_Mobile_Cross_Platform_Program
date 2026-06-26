import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(128, 135, 206, 235),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
      title: Text("Food Bill Calculator"),
      leading: Icon(Icons.menu),
      actions: [Icon(Icons.settings),Icon(Icons.save_alt)],)
        ,body: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _totalprice =0;
  List<String> _items = [];

  void _addprice(String name, int price) {
    setState(() {
      _totalprice += price;
      _items.add("$name ฿$price");
    });
  }

  void _reset(int price) {
    setState(() {
      _totalprice = 0;
      _items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('ราคารวมทั้งหมด'),
          Text('฿$_totalprice',
            style: Theme.of(context).textTheme.headlineMedium),
          ElevatedButton(
            onPressed: () => _addprice("ข้าวกะเพรา",50),
            child: const Text('ข้าวกะเพรา ฿50'),
          ),
          ElevatedButton(
            onPressed: () => _addprice('ไข่ดาว',10),
            child: const Text('ไข่ดาว ฿10'),
          ),
          ElevatedButton(
            onPressed: () => _addprice('ชานม',30),
            child: const Text('ชานม ฿30'),
          ),
          ElevatedButton(
            onPressed: () => _addprice('น้ำเปล่า',7),
            child: const Text('น้ำเปล่า ฿7'),
          ),ElevatedButton(
            onPressed: () => _reset(0),
            child: const Text('Reset')),
          const SizedBox(height: 20),
          const Text(
            "รายการที่เลือก",),
          ..._items.map((item) => Text(item)).toList(),
        ],
      ),
    );
  }
}
