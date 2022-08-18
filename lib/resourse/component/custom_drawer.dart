import 'package:flutter/material.dart';
import 'package:practice_mvvm/data/response/status.dart';
import 'package:practice_mvvm/utilits/routes/routes_name.dart';
import 'package:practice_mvvm/view_model/single_user_view_model.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  SingleUserViewModel singleUserViewModel = SingleUserViewModel();
  @override
  void initState() {
    singleUserViewModel.fetchSingleUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SingleUserViewModel>(
      create: (BuildContext context) => singleUserViewModel,
      child: Consumer<SingleUserViewModel>(builder: (context, value, child) {
        switch (value.singleUserData.status) {
          case null:
            break;
          case Status.LOADING:
            return const CircularProgressIndicator();
          case Status.ERROR:
            return Text(value.singleUserData.status.toString());
          case Status.COMPLETED:
            return Drawer(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Container(
                  color: Colors.blueGrey,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 70.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(value
                                    .singleUserData.data!.data!.avatar!
                                    .toString()))),
                      ),
                      Text(
                        value.singleUserData.data!.data!.firstName!.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        value.singleUserData.data!.data!.email!.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                customDrawerList(),
              ],
            )));
        }
        return Container();
      }),
    );
  }

  var currentPage = CustomDrawerSections.dashboard;
  Widget customDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          customDrawerMenuItems(
            1,
            "DashBoard",
            Icons.dashboard_outlined,
            currentPage == CustomDrawerSections.dashboard ? true : false,
          ),
          customDrawerMenuItems(
            2,
            "Contacts",
            Icons.people_alt_outlined,
            currentPage == CustomDrawerSections.contacts ? true : false,
          ),
          customDrawerMenuItems(
            3,
            "Privacy Policy",
            Icons.privacy_tip_outlined,
            currentPage == CustomDrawerSections.privacy_policy ? true : false,
          ),
          customDrawerMenuItems(
            4,
            "Setting",
            Icons.settings_outlined,
            currentPage == CustomDrawerSections.settings ? true : false,
          ),
        ],
      ),
    );
  }

  Widget customDrawerMenuItems(
      int id, String title, IconData icon, bool selected) {
    return Material(
        //color: selected ? Colors.blueGrey : Colors.transparent,
        child: InkWell(
      onTap: () {
        // Navigator.pop(context);
        if (id == 1) {
          Navigator.pushNamed(context, RoutesName.dashboard);
        } else if (id == 2) {
          Navigator.pushNamed(context, RoutesName.contact);
        } else if (id == 3) {
          Navigator.pushNamed(context, RoutesName.privacypolicy);
        } else if (id == 4) {
          Navigator.pushNamed(context, RoutesName.settings);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
                child: Icon(
              icon,
              color: Colors.black,
              size: 20,
            )),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}

enum CustomDrawerSections {
  dashboard,
  contacts,
  privacy_policy,
  settings,
}
