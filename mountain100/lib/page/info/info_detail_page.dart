import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/page/info/info_detail_provider.dart';
import 'package:mountain100/page/main/main_provider.dart';

class InfoDetailPage extends ConsumerStatefulWidget{
  late MountainModel model;
  InfoDetailPage({required this.model});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoDetailPageState(model: model);

}

class _InfoDetailPageState extends ConsumerState<InfoDetailPage>{
  late MountainModel model;
  late final shortDescription;
  _InfoDetailPageState({required this.model});

  @override
  void initState() {
    shortDescription = parse(model.description).body!.text.split(']')[0].split('[')[1];
  }

  @override
  Widget build(BuildContext context) {
    final mountainImages = ref.watch(mountainImageListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name} 정보"),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){navigatorKey.currentState!.pop();},icon: Icon(Icons.chevron_left),color: Colors.black,),
      ),
      body: Container(
        child: Column(
          children: [
            CarouselSlider(//items: mountainImages,
              items: [
                Container(color: Colors.green),
              ],
                options: CarouselOptions(
                  height: 250.h,
              viewportFraction: 1,
            )),

           Row(children: [
             Text(model.name),
             Text(" - "),
             Text(shortDescription),
           ],)
          ],
        ),
      ),
    );
  }

}