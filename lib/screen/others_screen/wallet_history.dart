import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';

class WalletHistory extends StatefulWidget {
  const WalletHistory({Key? key}) : super(key: key);

  @override
  _WalletHistoryState createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
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
                  Text("My Wallet  \$850", style: TextStyle(fontSize: screenWidth*0.06,
                      fontWeight: FontWeight.bold, color: Colors.green)),

                  SizedBox(height: screenWidth*0.05),

                  Container(
                    width: screenWidth,
                    // height: screenHeight*0.20,
                    decoration: BoxDecoration(
                        color: allColor.homebgColor,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:
                    Padding(
                      padding:  EdgeInsets.only(left: screenHeight*0.05, right: screenHeight*0.05,
                          top: screenHeight*0.04, bottom: screenHeight*0.04),
                      child:
                      Row(
                        children: [

                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: screenHeight*0.08,
                                    child:
                                    InkWell(
                                        onTap: (){

                                        },
                                        child: Image.asset("assets/images/file.png")),
                                  ),
                                  SizedBox(height: screenHeight*0.01),
                                  Text("Transaction \n"
                                      "Request", style: TextStyle(fontSize: screenWidth*0.04,
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
                                    height: screenHeight*0.08,
                                    child:
                                    InkWell(
                                        onTap: (){
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyWallet()));
                                        },
                                        child: Image.asset("assets/images/tk.png")),
                                  ),
                                  SizedBox(height: screenHeight*0.01),
                                  Text("History", style: TextStyle(fontSize: screenWidth*0.04,
                                      fontWeight: FontWeight.bold))
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
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
