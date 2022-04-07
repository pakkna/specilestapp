import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/order_lab/order_labs_two.dart';
import 'package:design/services/order_lab_service/given_test_list_service.dart';
import 'package:design/services/order_lab_service/delete_order_lab_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GivenTestList extends StatefulWidget {
  const GivenTestList({Key? key}) : super(key: key);

  @override
  State<GivenTestList> createState() => _GivenTestListState();
}

class _GivenTestListState extends State<GivenTestList> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<GivenTestListService>(
      builder: (BuildContext context, value, Widget? child) => value
                  .givenTestList !=
              null
          ? value.givenTestList != "error"
              ? ListView.builder(
                  itemCount: value.givenTestList.data.length,
                  itemBuilder: (_, i) => Card(
                    elevation: 2,
                    // margin: EdgeInsets.symmetric(vertical: ,horizontal: ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.02,
                          top: screenWidth * 0.02,
                          bottom: screenWidth * 0.02,
                          right: screenWidth * 0.02),
                      child: Row(
                        children: [
                          //
                          if (value.givenTestList.data[i].testName == null)
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Text(""),
                            )
                          else
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Text(value.givenTestList.data[i].testName),
                            ),
                          SizedBox(width: screenWidth * 0.02),
                          //
                          if (value.givenTestList.data[i].reason == null)
                            SizedBox(
                              width: screenWidth * 0.27,
                              child: Text(""),
                            )
                          else
                            SizedBox(
                              width: screenWidth * 0.27,
                              child: Text(value.givenTestList.data[i].reason),
                            ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              //EditOrderLabTest
                              Navigator.of(context).pushNamed(
                                  GiveATestTwo.routeName,
                                  arguments: i);
                            },
                          ),
                          IconButton(
                            onPressed: () async {
                              final giventestlist =
                                  Provider.of<GivenTestListService>(context,
                                          listen: false)
                                      .givenTestList;
                              String deleteId =
                                  giventestlist.data[i].id.toString();

                              //DeleteOrderLabTest API
                              try {
                                await Provider.of<DeleteOrderLabService>(
                                        context,
                                        listen: false)
                                    .deleteOrderLab(deleteId, context);
                              } catch (e) {
                                print(e);
                              }
                            },
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          ),
                        ],
                      ),
                    ),
                    // ListTile(
                    //   leading: Text(value.givenTestList.data[i].testName),
                    //   //  title: Text(value.givenTestList.data[i].tds),
                    //   subtitle: Text(value.givenTestList.data[i].reason),
                    //   trailing: SizedBox(
                    //     width: 100,
                    //     child: Row(
                    //       children: [
                    //         IconButton(
                    //           onPressed: () {
                    //             //EditOrderLabTest
                    //           },
                    //           icon: const Icon(Icons.edit),
                    //           color: Theme.of(context).primaryColor,
                    //         ),
                    //         IconButton(
                    //           onPressed: () async {
                    //             //DeleteOrderLabTest API
                    //           },
                    //           icon: const Icon(Icons.delete),
                    //           color: Theme.of(context).errorColor,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                )
              : const Text("Something went wrong")
          : OthersHelper().spinner(allColor.backGroundColor),
    );
  }
}
