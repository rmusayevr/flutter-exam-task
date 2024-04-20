import 'package:exam_task/cubits/products/products_cubit.dart';
import 'package:exam_task/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ProductsCubit()..getProductInfo(),
        child: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
