import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuis/screens/cartpage.dart';
import 'package:provider/provider.dart';
import 'package:kuis/model/item.dart'; // Import model item
import 'package:kuis/provider/item_provider.dart';
import 'package:kuis/services/item_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Variabel untuk mengontrol indeks item yang dipilih

  String _searchKeyword = ''; // Variabel untuk menyimpan kata kunci pencarian
  int _quantity = 0; // Variabel untuk menyimpan jumlah item yang dipilih

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ItemProvider>(context, listen: false).getItems();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BarayaFood'), // Mengubah judul aplikasi
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(CartPageScreen(cartItems: []));
              
              // Logika untuk menangani ketika ikon keranjang belanja diklik
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Logika untuk menangani ketika ikon pencarian diklik
            },
          ),
        ],
      ),
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Menggunakan fixed untuk menampilkan semua item
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildHomePageContent();
      case 1:
        return _buildSearchPage();
      case 2:
        return _buildStatusPage();
      case 3:
        return _buildProfilePage();
      default:
        return Container(); // Tambahkan widget default jika diperlukan
    }
  }

  Widget _buildSearchPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40, // Mengurangi tinggi TextField
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchKeyword = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Mau makan apa...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Set border radius to 20
                  borderSide: BorderSide(
                    width: 2.0, // Set border thickness to 2
                    color: Colors.blue, // Optionally, set border color
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text('Search Page Content'),
          ),
        ),
      ],
    );
  }

  Widget _buildHomePageContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40, // Mengurangi tinggi TextField
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchKeyword = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Mau makan apa...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // Set border radius to 20
                  borderSide: BorderSide(
                    width: 2.0, // Set border thickness to 2
                    color: Colors.blue, // Optionally, set border color
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilterBox(
              label: 'Terlaris',
              onPressed: () {
                // Logika untuk memfilter item terlaris
              },
              iconData: Icons.trending_up,
            ),
            FilterBox(
              label: 'Terdekat',
              onPressed: () {
                // Logika untuk memfilter item terdekat
              },
              iconData: Icons.location_on,
            ),
            FilterBox(
              label: 'Termurah',
              onPressed: () {
                // Logika untuk memfilter item termurah
              },
              iconData: Icons.attach_money,
            ),
            FilterBox(
              label: 'Promo',
              onPressed: () {
                // Logika untuk memfilter item dengan harga promo
              },
              iconData: Icons.discount,
            ),
          ],
        ),
        Expanded(
          child: Consumer<ItemProvider>(
            builder: (context, itemProvider, _) {
              if (itemProvider.items.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final filteredItems = itemProvider.items
                  .where((item) =>
                      item.title.toLowerCase().contains(_searchKeyword))
                  .toList();

              return ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return ListTile(
  leading: Image.asset('../img/${item.img_name}', width: 100, height: 100),
  title: Text(item.title),
  subtitle: Text('Rp ${item.price}'),
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          _incrementQuantity();
        },
      ),
      IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          // Tambahkan navigasi atau tampilkan dialog untuk melihat detail item
          _showItemDetail(item);
        },
      ),
    ],
  ),
);


                },
              );
            },
          ),
        ),

      ],
    );
  }

void _showItemDetail(Item item) {
  // Tampilkan dialog atau navigasi ke halaman detail item
  // Contoh menggunakan dialog:
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(item.title),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('../img/${item.img_name}', width: 200, height: 200),
          SizedBox(height: 10),
          Text('Description: ${item.description}'),
          Text('Price: Rp ${item.price}'),
          // Tambahkan informasi lainnya yang perlu ditampilkan
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    ),
  );
}
  Widget _buildStatusPage() {
    return Column(
      children: [
        ListTile(
          title: Text('Order ID: 1'),
          subtitle: Text('Status: Checkout'),
        ),
        ListTile(
          title: Text('Order ID: 2'),
          subtitle: Text('Status: Payment'),
        ),
        ListTile(
          title: Text('Order ID: 3'),
          subtitle: Text('Status: Accepted'),
        ),
        ListTile(
          title: Text('Order ID: 4'),
          subtitle: Text('Status: On Delivery'),
        ),
        ListTile(
          title: Text('Order ID: 5'),
          subtitle: Text('Status: Completed'),
        ),
      ],
    );
  }

  Widget _buildProfilePage() {
    return Center(
      child: Text('Profile Page Content'),
    );
  }
}

class FilterBox extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData iconData; // IconData untuk setiap teks

  const FilterBox({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Memberikan jarak antar kotak
      child: ElevatedButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 35, // Ukuran ikon
              color: Colors.black, // Warna ikon
            ),
            SizedBox(height: 5), // Memberikan jarak antara ikon dan teks
            Text(label),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10), // Memberikan ruang di dalam kotak
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
