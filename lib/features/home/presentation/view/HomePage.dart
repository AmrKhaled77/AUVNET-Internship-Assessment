import 'package:auvnet_cyper/features/home/presentation/viewModel/home%20cubit/home_cubit.dart';
import 'package:auvnet_cyper/features/search/presentation/view/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Shop App',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          body: BlocProvider.of<HomeCubit>(context)
              .Screens[BlocProvider.of<HomeCubit>(context).CurrntIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            elevation: 0.0,
            onTap: (index) {
              BlocProvider.of<HomeCubit>(context).ChangeIndex(index);
            },
            currentIndex: BlocProvider.of<HomeCubit>(context).CurrntIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.shopify), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        );
      },
      listener: (BuildContext context, HomeState state) {},
    );
  }
}
