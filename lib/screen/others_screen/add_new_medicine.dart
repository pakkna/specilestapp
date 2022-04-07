import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/add_new_medicine_two.dart';
import 'package:design/screen/others_screen/prescription_formate.dart';
import 'package:flutter/material.dart';

class AddNewMedicine extends StatefulWidget {
  const AddNewMedicine({Key? key}) : super(key: key);

  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}
List<String> rules=[];
String ? initValRules;
class _AddNewMedicineState extends State<AddNewMedicine> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight= MediaQuery.of(context).size.height;
    final double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body:
          Padding(
            padding:  EdgeInsets.all(screenWidth*0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*0.02,),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: allColor.backGroundColor),
                          onPressed: (){},
                          child: Text("Add New Medicine")),
                      Spacer(),
                      Container(
                          height: screenHeight*0.07,
                          child:Image.asset("assets/images/k.jpeg"))]),
                  SizedBox(height: screenWidth*0.05,),
                  Row(children: [
                    Text("Javed Ahmad M/46", style: TextStyle(fontSize: screenWidth*0.06,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    Container(
                      height: screenHeight*0.08,
                      child: Image(image: AssetImage("assets/images/men.png")))]),
                  SizedBox(height: screenWidth*0.10),
                  Text("Add new medicine", style: TextStyle(fontSize: screenWidth*0.05)),
                  SizedBox(height: screenWidth*0.05),
                  Container(
                    height: screenHeight*0.05,
                    child:  Row(children: [
                      Flexible(
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Medicine Name",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black12)),
                                  focusColor: Colors.black12,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10))))),
                      SizedBox(width: screenWidth*0.01),
                      Container(
                        height: screenHeight*0.07,
                        decoration: BoxDecoration(

                            border: Border.all(
                                color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: DropdownButton(
                                iconSize: 30,
                                iconDisabledColor: Colors.black,
                                iconEnabledColor: Colors.black,
                                hint: Text('', style: TextStyle(color: Colors.white)),
                                items: rules.map((val) => DropdownMenuItem(
                                    value: val,
                                    child: Text(val))).toList(),
                                onChanged: (newVal){
                                  setState(() {
                                    initValRules=newVal.toString();
                                  });
                                }),
                          ),
                        ),
                      )])),
                  SizedBox(height: screenWidth*0.05),
                  Container(
                      height: screenHeight*0.05,
                      child:  Row(children: [
                        Flexible(
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Dose",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.black12)),
                                    focusColor: Colors.black12,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(10))))),
                        SizedBox(width: screenWidth*0.01),
                        Container(
                          height: screenHeight*0.07,
                          decoration: BoxDecoration(

                              border: Border.all(
                                  color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: DropdownButton(
                                  iconSize: 30,
                                  iconDisabledColor: Colors.black,
                                  iconEnabledColor: Colors.black,
                                  hint: Text('', style: TextStyle(color: Colors.white)),
                                  items: rules.map((val) => DropdownMenuItem(
                                      value: val,
                                      child: Text(val))).toList(),
                                  onChanged: (newVal){
                                    setState(() {
                                      initValRules=newVal.toString();
                                    });
                                  }),
                            ),
                          ),
                        )])),
                  SizedBox(height: screenWidth*0.05),
                  Container(
                      height: screenHeight*0.05,
                      child:  Row(children: [
                        Flexible(
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Before/After Meal",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.black12)),
                                    focusColor: Colors.black12,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(10))))),
                        SizedBox(width: screenWidth*0.01),
                        Container(
                          height: screenHeight*0.07,
                          decoration: BoxDecoration(

                              border: Border.all(
                                  color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: DropdownButton(
                                  iconSize: 30,
                                  iconDisabledColor: Colors.black,
                                  iconEnabledColor: Colors.black,
                                  hint: Text('', style: TextStyle(color: Colors.white)),
                                  items: rules.map((val) => DropdownMenuItem(
                                      value: val,
                                      child: Text(val))).toList(),
                                  onChanged: (newVal){
                                    setState(() {
                                      initValRules=newVal.toString();
                                    });
                                  }),
                            ),
                          ),
                        )])),
                  SizedBox(height: screenWidth*0.05),
                  Container(
                      height: screenHeight*0.05,
                      child:  Row(children: [
                        Flexible(
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Duration",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.black12)),
                                    focusColor: Colors.black12,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(10))))),
                        SizedBox(width: screenWidth*0.01),
                        Container(
                          height: screenHeight*0.07,
                          decoration: BoxDecoration(

                              border: Border.all(
                                  color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: DropdownButton(
                                  iconSize: 30,
                                  iconDisabledColor: Colors.black,
                                  iconEnabledColor: Colors.black,
                                  hint: Text('', style: TextStyle(color: Colors.white)),
                                  items: rules.map((val) => DropdownMenuItem(
                                      value: val,
                                      child: Text(val))).toList(),
                                  onChanged: (newVal){
                                    setState(() {
                                      initValRules=newVal.toString();
                                    });
                                  }),
                            ),
                          ),
                        )])),
                  SizedBox(height: screenWidth*0.25),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: allColor.backGroundColor),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Prescription()));},
                      child: Text("Show prescription")),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.all(screenWidth*0.10),
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        primary: Colors.blue
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.05, top: screenWidth*0.02,
                          bottom: screenWidth*0.02, right: screenWidth*0.05),
                      child: Text('Back', style: TextStyle(fontSize: screenWidth*0.04,)),
                    )
                ),
                Spacer(),
                Container(
                  height: screenHeight*0.05,
                  child:
                  InkWell(
                      onTap: (){

                      },
                      child: Image.asset("assets/images/right.png")),
                ),
                Spacer(),
                Container(
                  height: screenHeight*0.05,
                  child:
                  InkWell(
                      onTap: (){

                      },
                      child: Image.asset("assets/images/setting.png")),
                ),
              ],
            ),
          ),
        )
    );
  }
}
