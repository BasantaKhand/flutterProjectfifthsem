import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: const [
            TableCard(
              tableNo: 'T-01',
              status: 'Available',
              seats: '2 seats',
              color: Colors.green,
            ),
            TableCard(
              tableNo: 'T-02',
              status: 'Occupied',
              seats: '2 seats',
              server: 'Waiter 01',
              color: Colors.blue,
            ),
            TableCard(
              tableNo: 'T-03',
              status: 'Occupied',
              seats: '4 seats',
              server: 'Waiter 02',
              color: Colors.blue,
            ),
            TableCard(
              tableNo: 'T-04',
              status: 'Available',
              seats: '4 seats',
              color: Colors.green,
            ),
            TableCard(
              tableNo: 'T-05',
              status: 'Available',
              seats: '6 seats',
              color: Colors.green,
            ),
            TableCard(
              tableNo: 'T-06',
              status: 'Reserved',
              seats: '8 seats',
              server: 'Owner',
              color: Colors.yellow,
            ),
            TableCard(
              tableNo: 'T-07',
              status: 'Available',
              seats: '6 seats',
              color: Colors.green,
            ),
            TableCard(
              tableNo: 'T-08',
              status: 'Available',
              seats: '8 seats',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class TableCard extends StatelessWidget {
  final String tableNo;
  final String status;
  final String seats;
  final String? server;
  final Color color;

  const TableCard({
    super.key,
    required this.tableNo,
    required this.status,
    required this.seats,
    this.server,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFBF360C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 10, backgroundColor: color),
          const SizedBox(height: 12),
          Text(
            tableNo,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 6),
          Text(
            status,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            seats,
            style: const TextStyle(color: Colors.white70),
          ),
          if (server != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                'Server: $server',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // logic: tablet if width >= 600
//         final bool isTablet = constraints.maxWidth >= 600;

//         return Scaffold(
//           backgroundColor: const Color(0xFFF5F5F5),
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             leading: IconButton(
//               icon: const Icon(Icons.menu, color: Colors.black),
//               onPressed: () {},
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16),
//             child: GridView.count(
//               // 🔴 ONLY THIS LINE CHANGES
//               crossAxisCount: isTablet ? 3 : 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               children: const [
//                 TableCard(
//                   tableNo: 'T-01',
//                   status: 'Available',
//                   seats: '2 seats',
//                   color: Colors.green,
//                 ),
//                 TableCard(
//                   tableNo: 'T-02',
//                   status: 'Occupied',
//                   seats: '2 seats',
//                   server: 'Waiter 01',
//                   color: Colors.blue,
//                 ),
//                 TableCard(
//                   tableNo: 'T-03',
//                   status: 'Occupied',
//                   seats: '4 seats',
//                   server: 'Waiter 02',
//                   color: Colors.blue,
//                 ),
//                 TableCard(
//                   tableNo: 'T-04',
//                   status: 'Available',
//                   seats: '4 seats',
//                   color: Colors.green,
//                 ),
//                 TableCard(
//                   tableNo: 'T-05',
//                   status: 'Available',
//                   seats: '6 seats',
//                   color: Colors.green,
//                 ),
//                 TableCard(
//                   tableNo: 'T-06',
//                   status: 'Reserved',
//                   seats: '8 seats',
//                   server: 'Owner',
//                   color: Colors.yellow,
//                 ),
//                 TableCard(
//                   tableNo: 'T-07',
//                   status: 'Available',
//                   seats: '6 seats',
//                   color: Colors.green,
//                 ),
//                 TableCard(
//                   tableNo: 'T-08',
//                   status: 'Available',
//                   seats: '8 seats',
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class TableCard extends StatelessWidget {
//   final String tableNo;
//   final String status;
//   final String seats;
//   final String? server;
//   final Color color;

//   const TableCard({
//     super.key,
//     required this.tableNo,
//     required this.status,
//     required this.seats,
//     this.server,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFFBF360C),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(radius: 10, backgroundColor: color),
//           const SizedBox(height: 12),
//           Text(
//             tableNo,
//             style: const TextStyle(color: Colors.white, fontSize: 20),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             status,
//             style: const TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           Text(
//             seats,
//             style: const TextStyle(color: Colors.white70),
//           ),
//           if (server != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 6),
//               child: Text(
//                 'Server: $server',
//                 style: const TextStyle(color: Colors.blue),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

