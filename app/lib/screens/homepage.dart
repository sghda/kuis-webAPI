import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuis/model/item.dart'; // Import model user
import 'package:kuis/provider/item_provider.dart';
import 'package:kuis/services/item_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ItemProvider>(context, listen: false).getItems();
    });
    // Provider.of<ItemProvider>(context, listen: false).getAllitems();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, ItemProvider, child) {
          if (ItemProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          final items = ItemProvider.items;
          return ListView.builder(
            itemCount: ItemProvider.items.length,
            itemBuilder: (context, index) {
              final item = ItemProvider.items[index];
              return ListTile(
                leading: CircleAvatar(
                  // backgroundColor: item.completed ? Color.fromARGB(255, 27, 126, 255) : Color.fromARGB(255, 0, 42, 255),
                  child: Text(item.id.toString()),
                ),
                title: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                subtitle: Text('Rp'+item.price.toString()),
              );
            },
          );
        },
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>{
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       Provider.of<ItemProvider>(context, listen: false).getItems();
//     });
//     }

//     Widget build(BuildContext context) {
//   return Consumer<ItemProvider>(
//     builder: (context, itemProvider, _) {
//       // Get the list of items from the provider
//       List<Item> items = itemProvider.items;

//       return MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Home'),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   // Add logic when the Cart button is pressed
//                 },
//               ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: 2,
//               children: items.map((Item item) {
//                 return _buildFoodItem(
//                   item.title,
//                   item.img_name,
//                   item.price.toString(),
//                   // item.description,
//                 );
//               }).toList(),
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.info),
//                 label: 'Status',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }


//   Widget _buildFoodItem(String title, String imagePath, String price) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           // Tambahkan logika ketika item makanan ditekan untuk melihat detail
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Icon(icon, size: 40.0, color: Colors.blue),
//             SizedBox(height: 8.0),
//             Image.asset(
//               imagePath,
//               width: 100.0,
//               height: 100.0,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               title,
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 4.0),
//             Text(
//               price,
//               style: TextStyle(fontSize: 14.0, color: Colors.grey),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 8.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Tambahkan logika ketika tombol detail ditekan
//                   },
//                   child: Text('Detail'),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Tambahkan logika ketika tombol tambah ke keranjang ditekan
//                   },
//                   icon: Icon(Icons.add_shopping_cart),
//                   label: Text(''),

//                   // child: 
//                   // Text('Add to Cart'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

