import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final TextEditingController  _glassNoTEController = TextEditingController(text:'1');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Water-Traker App"),
      centerTitle: true,),
      body: Column(
     crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          const Text("12"),
          const Text("Glasses"),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
            SizedBox(
              width: 50,
              child: TextField(
                controller: _glassNoTEController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
              TextButton(onPressed: (){},
                  child: const Text("Add")),
            ],
          ),
          const SizedBox(height: 16,),
          Expanded(
            child: ListView.separated(itemBuilder: (context,index){return ListTile(
              title: const Text("Time"),
              subtitle: const Text("Date"),
              leading: const Text("1"),
              trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
            );},
              separatorBuilder: (context,index){return const Divider();},
              itemCount: 3),)
        ],
      ),
    );}
}
