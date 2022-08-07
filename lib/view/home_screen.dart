import 'package:flutter/material.dart';
import 'package:practice_mvvm/model/user_model.dart';
import 'package:practice_mvvm/resourse/component/custom_drawer.dart';
import 'package:practice_mvvm/utilits/routes/routes_name.dart';
import 'package:practice_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPreferance = Provider.of<UserViewModel>(context);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            shadowColor: Colors.blueGrey,
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.blueGrey,
            title: const Text(
              "Home Screen",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              InkWell(
                  onTap: () {
                    userPreferance.removeUser().then((value) {
                      Navigator.pushNamed(context, RoutesName.login);
                    });
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ))
            ],
          ),
          drawer: CustomDrawer(),
          body: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
