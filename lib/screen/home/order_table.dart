import 'package:c2b_vendor/common/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../common/widgets.dart';

// Define a custom class for your data
class RowData {
  final String customerName;
  final String address;
  final String date;
  final String time;
  final String orderId;
  final String products;
  final String itemsCount;
  final String items;
  final String deliveryMode;
  final String status;
  final String deliveryType;
  final List<String> drivers;
  final String acceptedTime;
  final String view;

  RowData({
    required this.customerName,
    required this.address,
    required this.date,
    required this.time,
    required this.orderId,
    required this.products,
    required this.itemsCount,
    required this.items,
    required this.deliveryMode,
    required this.status,
    required this.deliveryType,
    required this.drivers,
    required this.acceptedTime,
    required this.view,
  });
}

class HorizontalScrollingTable extends StatefulWidget {
  @override
  _HorizontalScrollingTableState createState() => _HorizontalScrollingTableState();
}

class _HorizontalScrollingTableState extends State<HorizontalScrollingTable> {

  bool isExpanded = false;
  String selectedDriver = '';
  List<String> selectedStatusList = [];
  String status = '';
  List<RowData> tableData = [
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),
    RowData(
      customerName: 'John Doe',
      address: '123 Main St',
      date: '2023-09-21',
      time: '10:00 AM',
      orderId: '12345',
      products: 'Product A, Product B',
      itemsCount: '5',
      items: "assets/images/amico.png",
      deliveryMode: 'Express',
      status: '',
      deliveryType: "Dunzo",
      drivers: ['Driver 1', 'Driver 2'],
      acceptedTime: "20-9-2024",
      view: "View",

    ),





    // Add more rows as needed
  ];


  void _showDriverSlecetionDialog (List<String> drivers) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
            return Dialog(
            child:
            Container(
              //height: 100, // Set a fixed height for the cell
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: drivers.length,
                itemBuilder: (context, driverIndex) {
                  return Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text("Choose Driver")),
                          //Text(rowData.drivers[driverIndex]),
                          Expanded(child: Icon(Icons.expand_more))
                        ],
                      ),
                      Text(drivers[driverIndex].toString()),
                      // if (driverIndex < rowData.drivers.length - 1)
                      //   SizedBox(width: 5),
                    ],
                  );
                },

              ),
            ),
          );
        });
  }

  void _showProductDetailsDialog () {

    final List<String> specifications = [
      "Material: High-quality cotton blend ",
      "Fit: Regular fit ",
      "Pattern: Multi-color vertical stripes",
      " Collar: Classic button-down collar ",
      "Sleeve: Full sleeves with button cuffs ",
      "Closure: Front button closure ",
      "Pocket: Single chest pocket ",
      "Care Instructions: Machine wash cold, gentle cycle; do not bleach; tumble dry low; iron on low heat",
    ];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          Widget specification() {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: specifications.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.brightness_1,
                        size: 5,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                            specifications[index],
                            style: fontStyleSentences(),
                          )),
                    ],
                  ),
                );
              },
            );
          }
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set your desired border radius
                ),
                child:
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Mistari Shirt - MultiColor", style: fontStyle60016(AppColors.bgBlack),),
                             IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.close))
                           ],
                         ),
                         const SizedBox(height: 12,),
                         Text("\u20B9 3,500", style: fontStyle60016(AppColors.bgBlack),),
                        const SizedBox(height: 12,),
                         Text("Summer in the Cambodian flower market - thats the vibe this print channels", style: fontStyleSentences(),),
                        const SizedBox(height: 16,),
                        Divider(
                          height: 10,
                          thickness: 2,
                          color: AppColors.bgBlack,
                        ),
                        const SizedBox(height: 16,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Product ID", style: fontStyle60016(AppColors.bgBlack),),
                            Text("dhcbye783", style: fontStyleSentences(),)
                          ],
                        ),
                        const SizedBox(height: 16,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order ID" ,style: fontStyle60016(AppColors.bgBlack),),
                            Text("dhcbye783", style: fontStyleSentences(),)
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Divider(
                          height: 10,
                          thickness: 2,
                          color: AppColors.bgBlack,
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          children: [
                            const Text("Color",
                                style: TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(width: 20,),
                            Container(
                              height: 30,
                              child:  Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: AppColors.headerGradient2,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all()),

                                width: 40,
                                child: const Text("",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12,),
                        Row(
                          children: [
                            const Text("Size",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(width: 30,),
                            Container(
                              height: 30,
                              child:  Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all()),
                                width: 40,
                                child: const Text("s",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Divider(
                          height: 10,
                          thickness: 2,
                          color: AppColors.bgBlack,
                        ),
                        const SizedBox(height: 16,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Order date and time", style: fontStyle60016(AppColors.bgBlack),),
                            Container(
                              padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                              decoration: BoxDecoration(
                                color: AppColors.bgGreen2,
                                borderRadius: BorderRadius.circular(8)
                              ),
                                child: Text("23/08/23")),
                            Container(
                                padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                                decoration: BoxDecoration(
                                    color: AppColors.bgGreen2,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("12:56")),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Divider(
                          height: 10,
                          thickness: 2,
                          color: AppColors.bgBlack,
                        ),
                        const SizedBox(height: 16,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order date and time" ,style: fontStyle60016(AppColors.bgBlack),),
                            Container(
                                padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                                decoration: BoxDecoration(
                                    color: AppColors.bgGreen2,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("23/08/23")),
                            Container(
                                padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                                decoration: BoxDecoration(
                                    color: AppColors.bgGreen2,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("12:56")),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Specification",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              specification()
                            ],
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Divider(
                          height: 10,
                          thickness: 2,
                          color: AppColors.bgBlack,
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery mode", style: fontStyleHeading(AppColors.bgBlack),),
                            Text("Self Delivery", style: fontStyleSentences(),)
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Text("Delivery Address :"),
                        const SizedBox(height: 16,),
                        Text("Plot no: 477, Jawaharlal Nehru Road, BEML Layout 3rd Stage, RR Nagar Land Mark: Above Louis Philippe Showroom, opposite to Sub Register Office, Rajarajeshwari Nagar, Bengaluru, Karnataka 560098", style: fontStyleSentences(),)
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  // void _deliveryStatus () {
  //
  //   final List<String> statusData = [
  //     "Packed",
  //     "Ready for delivery"
  //   ];
  //    showDialog(
  //        context: context,
  //        builder: (BuildContext context) {
  //     return Dialog(
  //       child: Container(
  //         height: MediaQuery.of(context).size.height * 0.1,
  //         width: MediaQuery.of(context).size.width * 0.1,
  //         child: ListView.builder(
  //           itemCount: statusData.length,
  //             itemBuilder: (BuildContext context, int index) {
  //
  //           return InkWell(
  //             onTap: () {
  //              setState(() {
  //                selectedStatus = statusData[index];
  //                Navigator.of(context);
  //              });
  //             },
  //             child: Container(
  //               padding: EdgeInsets.all(5),
  //               margin: EdgeInsets.all(5),
  //               decoration: BoxDecoration(
  //                 color: Colors.red
  //               ),
  //               alignment: Alignment.center,
  //               child: Text(statusData[index]),
  //             ),
  //           );
  //         }),
  //       ),
  //     );
  //   });
  // }
  void _deliveryStatus(RowData rowData, int rowIndex) {
    final List<String> statusData = [
      "Packed",
      "Ready for delivery",
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.1,
            child: ListView.builder(
              itemCount: statusData.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedStatusList[rowIndex] = statusData[index];
                      Navigator.of(context).pop();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    alignment: Alignment.center,
                    child: Text(statusData[index]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }


  final List<String> columnNames = [
    'Customer Name',
    'Address',
    'Date',
    'Time',
    'Order ID',
    'Products',
    'Items Count',
    //'Items',
    'Delivery Mode',
    'Status',
    'Delivery type',
    "Driver",
    "Accepted Time",
    "View",
  ];
  // Define the number of rows and columns per page
  final int rowsPerPage = 10;
  final int totalColumns = 13;
  int currentPage = 0;

  // Calculate the total number of pages
  int get totalPages => (tableData.length / rowsPerPage).ceil();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedStatusList = List.filled(tableData.length, "placed");
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the starting and ending indices for the current page
    int startIndex = currentPage * rowsPerPage;
    int endIndex = (currentPage + 1) * rowsPerPage;
    endIndex = endIndex > tableData.length ? tableData.length : endIndex;

    // Create the table headers
    List<DataColumn> columns = List.generate(
      totalColumns,
          (index) => DataColumn(label: Text(columnNames[index])),
    );

    // Create the table rows for the current page
    List<DataRow> rows = List.generate(
      endIndex - startIndex,
          (index) {
        final rowData = tableData[startIndex + index];
        return DataRow(
          cells: [
            DataCell(
                Container(
                    child: Text(rowData.customerName))),
            DataCell(
                Container(
                    child: Text(rowData.address))),
            DataCell(
                Container(
                  padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                    decoration: BoxDecoration(
                        color: AppColors.bgGreen2,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text(rowData.date, style: fontStyle50012(AppColors.bgGreen3)))),
            DataCell(
                Container(
                    padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                    decoration: BoxDecoration(
                        color: AppColors.bgGreen2,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text(rowData.time))),
            DataCell(
                Container(child: Text(rowData.orderId))),
            DataCell(
                Container(child: Text(rowData.products))),
            DataCell(
                Container(
                    child: Text(rowData.itemsCount))),
            // DataCell(
            //   // Display an image in the "Items" column
            //   Container(
            //     child: Image.asset(
            //       rowData.items, // Assuming that 'items' contains the image path
            //       width: 50,    // Adjust the image size as needed
            //       height: 50,
            //     ),
            //   ),
            // ),
            DataCell(
                Container(
                    padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                    decoration: BoxDecoration(
                        color: AppColors.bgGreen2,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text(rowData.deliveryMode))),
            // DataCell(
            //     Container(
            //         padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
            //         decoration: BoxDecoration(
            //             color: AppColors.bgGreen2,
            //             borderRadius: BorderRadius.circular(8)
            //         ),
            //         child: InkWell(
            //           onTap: () {
            //             _deliveryStatus();
            //           },
            //           child: Row(
            //             children: [
            //               Text(selectedStatus),
            //               Icon(Icons.expand_more)
            //             ],
            //           ),
            //         ))),
            DataCell(
              Container(
                padding: EdgeInsets.only(top: 2, bottom: 2, right: 8, left: 6),
                decoration: BoxDecoration(
                  color: AppColors.bgGreen2,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    _deliveryStatus(rowData, startIndex + index);
                  },
                  child: Row(
                    children: [
                      Text(selectedStatusList[startIndex + index]),
                      Icon(Icons.expand_more),
                    ],
                  ),
                ),
              ),
            ),

            DataCell(Text(rowData.deliveryType)),
            DataCell(
              // Container(
              //   //height: 100, // Set a fixed height for the cell
              //   width: 100,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: rowData.drivers.length,
              //     itemBuilder: (context, driverIndex) {
              //       return Column(
              //         children: [
              //           Row(
              //             children: [
              //               Expanded(child: Text("Choose Driver")),
              //               //Text(rowData.drivers[driverIndex]),
              //               Expanded(child: Icon(Icons.expand_more))
              //             ],
              //           ),
              //           Text(rowData.drivers[driverIndex]),
              //           // if (driverIndex < rowData.drivers.length - 1)
              //           //   SizedBox(width: 5),
              //         ],
              //       );
              //     },
              //
              //   ),
              // ),

              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _showDriverSlecetionDialog(rowData.drivers);
                          },
                            child: const Expanded(child: Text("Choose Driver"))),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            DataCell(Text(rowData.acceptedTime)),
            DataCell(ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: (){
                _showProductDetailsDialog();
              },
                child: Text(rowData.view)))
          ],
        );
      },
    );


    // Create the DataTable
    DataTable dataTable = DataTable(
      columns: columns,
      rows: rows,
    );

    // Create pagination buttons
    // List<Widget> paginationButtons = [
    //   ElevatedButton(
    //     onPressed: () {
    //       if (currentPage > 0) {
    //         setState(() {
    //           currentPage--;
    //         });
    //       }
    //     },
    //     child: Text('Previous'),
    //   ),
    //   Text('Page ${currentPage + 1}'),
    //   ElevatedButton(
    //     onPressed: () {
    //       if (currentPage < (tableData.length / rowsPerPage).ceil() - 1) {
    //         setState(() {
    //           currentPage++;
    //         });
    //       }
    //     },
    //     child: Text('Next'),
    //   ),
    // ];

    // Create the overall layout
    List<Widget> paginationButtons = List.generate(
      totalPages,
          (page) => ElevatedButton(
        onPressed: () {
          setState(() {
            currentPage = page;
          });
        },
        child: Text('${page + 1}'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            page == currentPage ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
    return Scaffold(

      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dataTable,
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: paginationButtons,
            ),
          ),
        ],
      ),
    );
  }
}

























//
// class HorizontalScrollingTable extends StatefulWidget {
//   @override
//   _HorizontalScrollingTableState createState() => _HorizontalScrollingTableState();
// }
//
// class _HorizontalScrollingTableState extends State<HorizontalScrollingTable> {
//
//   List<List<String>> tableData = [
//     ['Row 1, Col 1', 'Row 1, Col 2', 'Row 1, Col 3', 'Row 1, Col 4', 'Row 1, Col 5', 'Row 1, Col 6', 'Row 1, Col 7', 'Row 1, Col 8', 'Row 1, Col 9'],
//     // Add more rows as needed
//   ];
//
//   // Define the number of rows and columns per page
//   final int rowsPerPage = 5;
//   final int totalColumns = 9;
//   int currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     // Calculate the starting and ending indices for the current page
//     int startIndex = currentPage * rowsPerPage;
//     int endIndex = (currentPage + 1) * rowsPerPage;
//     endIndex = endIndex > tableData.length ? tableData.length : endIndex;
//
//     // Create the table headers
//     List<DataColumn> columns = List.generate(
//       totalColumns,
//           (index) => DataColumn(label: Text('Column ${index + 1}')),
//     );
//
//     // Create the table rows for the current page
//     List<DataRow> rows = List.generate(
//       endIndex - startIndex,
//           (index) {
//         final rowData = tableData[startIndex + index];
//         return DataRow(
//           cells: List.generate(
//             rowData.length,
//                 (colIndex) => DataCell(Text(rowData[colIndex])),
//           ),
//         );
//       },
//     );
//
//     // Create the DataTable
//     DataTable dataTable = DataTable(
//       columns: columns,
//       rows: rows,
//     );
//
//     // Create pagination buttons
//     List<Widget> paginationButtons = [
//       ElevatedButton(
//         onPressed: () {
//           if (currentPage > 0) {
//             setState(() {
//               currentPage--;
//             });
//           }
//         },
//         child: Text('Previous'),
//       ),
//       Text('Page ${currentPage + 1}'),
//       ElevatedButton(
//         onPressed: () {
//           if (currentPage < (tableData.length / rowsPerPage).ceil() - 1) {
//             setState(() {
//               currentPage++;
//             });
//           }
//         },
//         child: Text('Next'),
//       ),
//     ];
//
//     // Create the overall layout
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Horizontal Scrolling Table with Pagination'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             dataTable,
//             Row(
//               children: paginationButtons,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
