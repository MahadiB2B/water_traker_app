import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final TextEditingController  _glassNoTEController = TextEditingController(text:'1');
 List<WaterTrack>waterTrackList =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Water-Traker App"),
      centerTitle: true,),
      body: Column(
     crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(getTotalGlassCount().toString(),),
              const Text("Glasses"),
            ],
          ),
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
              TextButton(onPressed: _addNewWaterTrack,
                  child: const Text("Add")),
            ],
          ),
          const SizedBox(height: 16,),
          Expanded(

            child: ListView.separated(
              itemCount: waterTrackList.length,
              itemBuilder: (context,index){
              final WaterTrack waterTrack = waterTrackList[index];
              return ListTile(
              title: Text('${waterTrack.dateTime.hour}:${waterTrack.dateTime.minute}'),
              subtitle:  Text('${waterTrack.dateTime.day}/${waterTrack.dateTime.month}/${waterTrack.dateTime.year}'),
              leading: CircleAvatar(child: Text('${waterTrack.noOfGlasses}')),
              trailing: IconButton(onPressed:() => _onTapDeleteButton (index), icon: const Icon(Icons.delete)),
            );},
              separatorBuilder: (context,index){return const Divider();},
             ),)
        ],
      ),
    );}
 void _onTapDeleteButton(int index){
    waterTrackList.removeAt(index);
    setState(() {

    });
 }
 int getTotalGlassCount(){
    int counter =0;
    for (WaterTrack t in waterTrackList){
      counter += t.noOfGlasses;
    }
    return counter;
 }
  void _addNewWaterTrack(){
 if (_glassNoTEController.text.isEmpty){
   _glassNoTEController.text="1";
 }
    final int  noOfGlasses = int.tryParse(_glassNoTEController.text)?? 1;
WaterTrack waterTrack = WaterTrack(noOfGlasses: noOfGlasses,
 dateTime: DateTime.now(),);
waterTrackList.add(waterTrack);
setState(() {

});
  }

}

class WaterTrack{
  final int noOfGlasses;
  final DateTime dateTime;
  WaterTrack({required this.noOfGlasses, required this.dateTime});
}