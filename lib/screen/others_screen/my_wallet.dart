import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/wallet_history.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
                  SizedBox(height: screenHeight*0.05,),
                  Row(
                    children: [
                      Text("Dr. Mahbub \nKhan", style: TextStyle(fontSize: screenWidth*0.06,
                          fontWeight: FontWeight.bold)),
                      Spacer(),
                      Container(
                          height: screenHeight*0.07,
                          child:Image.asset("assets/images/k.jpeg")),
                    ],
                  ),


                  SizedBox(height: screenWidth*0.15),
                  Row( children: [
                    Text("My Wallet  \$850", style: TextStyle(fontSize: screenWidth*0.06,
                        fontWeight: FontWeight.bold, color: Colors.green)),
                    Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: allColor.backGroundColor
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletHistory()));
                        },
                        child: Text("Wallet History")),
                  ],),


                  SizedBox(height: screenWidth*0.05),

                  Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffc9def9),
                                      borderRadius: BorderRadius.circular(360)
                                  ),
                                  height: screenHeight*0.10,
                                  width: screenWidth*0.22,
                                  child:
                                  Center(child: Text("\$11,520", style: TextStyle(fontSize: screenWidth*0.04,
                                      fontWeight: FontWeight.bold)))),
                              SizedBox(height: screenHeight*0.01),
                              Text("Today", style: TextStyle(fontSize: screenWidth*0.04,fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff2d473),
                                      borderRadius: BorderRadius.circular(360)
                                  ),
                                  height: screenHeight*0.10,
                                  width: screenWidth*0.22,
                                  child:
                                  Center(child: Text("\$11,520", style: TextStyle(fontSize: screenWidth*0.04,
                                      fontWeight: FontWeight.bold)))),
                              SizedBox(height: screenHeight*0.01),
                              Text("This Month", style: TextStyle(fontSize: screenWidth*0.04,
                                  fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff9bdf1),
                                  borderRadius: BorderRadius.circular(360)
                                ),
                                height: screenHeight*0.10,
                                width: screenWidth*0.22,
                                child:
                                Center(child: Text("\$11,520", style: TextStyle(fontSize: screenWidth*0.04,
                                      fontWeight: FontWeight.bold)))),
                              SizedBox(height: screenHeight*0.01),
                              Text("Til Date", style: TextStyle(fontSize: screenWidth*0.04,
                                  fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: screenWidth*0.15),
                  Table(
                    columnWidths:  {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                    },
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('S.No', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold),),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Name', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Date', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold),),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Amount', style: TextStyle(fontSize: screenWidth*0.04, fontWeight: FontWeight.bold)),
                            )),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('01', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Shain', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('2-Dec-21', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('150', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('02', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Faizan ', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('3-Dec-21', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('150', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('03', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('Waseem', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('4-Dec-21', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('250', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                          ]
                      ),

                      TableRow(
                          children: [
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Center(child: Text('04', style: TextStyle(fontSize: screenWidth*0.04),)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('David', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('6-Dec-21', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                            TableCell(child:
                            Padding(
                              padding:  EdgeInsets.all(screenWidth*0.02),
                              child: Text('250', style: TextStyle(fontSize: screenWidth*0.04)),
                            )),
                          ]
                      ),

                    ],
                  ),

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
