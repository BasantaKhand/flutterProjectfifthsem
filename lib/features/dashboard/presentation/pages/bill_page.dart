import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BillPage extends ConsumerStatefulWidget{
  const BillPage({super.key});

  @override
  ConsumerState<BillPage> createState() => _BillPageState();
}

class _BillPageState extends ConsumerState<BillPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(  
      body: Center(  
        child: Text('Bill')
      )
    );
  }
}