import 'package:flutter/material.dart';
import 'package:testovoe_zadanie/constants/app_assets.dart';
import 'package:testovoe_zadanie/constants/app_styles.dart';
import 'package:testovoe_zadanie/model/user_data.dart';

import '../servieces/remote_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final remoteService = RemoteService();
  List<UserData>? user;
  String? errorMessage;
  //var isLoaded = false;
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    final resultUser = await remoteService.getPosts();
    //if (user != null) {
    // setState(() {
    //  isLoaded = true;
    //});
    // }
    if (resultUser.datas != null) {
      setState(() {
        user = resultUser.datas!;
      });
    }
    setState(() {
      errorMessage = resultUser.errorMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
        user: user,
        error: errorMessage,
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key, required this.user, required this.error})
      : super(key: key);
  final List<UserData>? user;
  final String? error;
  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            floating: false,
            expandedHeight: 55.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Пользователи',
                style: AppStyles.s18w400,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 80,
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.images.userphoto),
                      radius: 25,
                    ),
                    title: Text(
                      (user?[index].name).toString(),
                      style: AppStyles.s20w500,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (user?[index].email).toString(),
                          style: AppStyles.s13w200,
                        ),
                        Text(
                          'Surf',
                          style: AppStyles.s13w200.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              },
              childCount: user?.length,
            ),
          ),
        ],
      );
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        alignment: Alignment.center,
        child: Image(image: AssetImage(AppAssets.images.warning)),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 36.0, bottom: 32),
        child: Text(
          'Не удалось загрузить информацию',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'SourceSansPro'),
        ),
      ),
      Container(
        width: 230,
        height: 38,
        child: TextButton(
          onPressed: () {},
          style: AppStyles.textButton2.copyWith(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ))),
          child: Text(
            'Обновить',
            style: AppStyles.s16w400.copyWith(color: Colors.white),
          ),
        ),
      )
    ]);
  }
}
