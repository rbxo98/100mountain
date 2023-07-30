import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/app/config/app_config.dart';
import 'package:mountain100/page/info/info_detail_page.dart';
import 'package:mountain100/page/info/info_provider.dart';
import 'package:mountain100/page/main/main_provider.dart';

class InfoPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_InfoPageState();

}

class _InfoPageState extends ConsumerState<InfoPage> with SingleTickerProviderStateMixin{
  late InfoPageProvider provider;
  late TabController infoTabController;
  late TextEditingController infoTextController;
  List<Widget> infoPages = [
    InfoSortedByAlphabetPage(),
  ];

  @override
  void initState() {
    provider = ref.read(infoProvider);
    infoTabController = ref.read(infoTabControllerProvider(this));
    infoTextController=ref.read(infoTextControllerProvider);
  }

  @override
  Widget build(BuildContext context){
    final pageIndex = ref.watch(infoPageIndex);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 39.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TabBar(
          controller: infoTabController,
          onTap: provider.setTap,
          tabs: [
            Container(
              child: Tab(
                child: Text(
                  "가나다 순",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSettings.FONTSIZE_INFOTAB.sp
                  ),
                ),
              ),
            ),
            Container(
              child: Tab(
                child: Text(
                  "인기 순",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSettings.FONTSIZE_INFOTAB.sp
                  ),
                ),
              ),
            ),

            Container(
              child: Tab(
                child: Text(
                  "거리 순",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSettings.FONTSIZE_INFOTAB.sp
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              onChanged: (msg){
                print("##################");
                provider.filterByKeyword(msg);
                print("##################");
              },
              controller: infoTextController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.highlight_off),
                  onPressed: infoTextController.clear,
                )
              ),
            ),
          ),
          infoPages[pageIndex],
        ],
      ),
    );
  }
}

class InfoSortedByAlphabetPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoSortedByAlphabetPageState();
}
class _InfoSortedByAlphabetPageState extends ConsumerState<InfoSortedByAlphabetPage>{
  @override
  Widget build(BuildContext context) {
    final mountainList = ref.watch(infoSearchSortedProvider);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: mountainList.map((e) => InkWell(
            onTap: (){
              navigatorKey.currentState!.push(MaterialPageRoute(builder: (_)=>InfoDetailPage(model: e,)));
            },
            child: ListTile(
              isThreeLine: true,
              title: Text(e.name),
              subtitle: Text(e.location),
              trailing: Icon(Icons.chevron_right),
            ),
          )).toList(),
        ),
      ),
    );
  }

}