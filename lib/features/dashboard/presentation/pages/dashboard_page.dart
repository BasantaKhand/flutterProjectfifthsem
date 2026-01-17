import 'package:dinesmart_app/app/routes/app_routes.dart';
import 'package:dinesmart_app/app/theme/app_colors.dart';
import 'package:dinesmart_app/features/auth/presentation/pages/login_page.dart';
import 'package:dinesmart_app/features/auth/presentation/view_model/auth_viewmodel.dart';
import 'package:dinesmart_app/features/dashboard/presentation/pages/bill_page.dart';
import 'package:dinesmart_app/features/dashboard/presentation/pages/cart_page.dart';
import 'package:dinesmart_app/features/dashboard/presentation/pages/history_page.dart';
import 'package:dinesmart_app/features/dashboard/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerStatefulWidget{
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int selectedIndex = 0;

  List<Widget> topLevelScreens =[
    HomePage(),
    CartPage(),
    BillPage(),
    HistoryPage()
  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(  
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
          title: const Text('Dashboard'),
          leading: PopupMenuButton<String>(
            icon: const Icon(
              Icons.menu, // ☰ three horizontal lines
              color: Colors.black,
            ),
            onSelected: (value) {
              if (value == 'logout') {
                ref.read(authViewModelProvider.notifier).logout();
                AppRoutes.pushAndRemoveUntil(context, LoginPage());
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

      body: topLevelScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(  
        type: BottomNavigationBarType.fixed,
        items: const [  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(  
            icon: Icon(Icons.shopping_bag),
            label: 'Cart'
          ),
          BottomNavigationBarItem(  
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Bill'
          ),
          BottomNavigationBarItem(  
            icon: Icon(Icons.history),
            label: 'History'
          )
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState((){
            selectedIndex = index;
          });
        }

      ),
      

      
      
    );
  }
}