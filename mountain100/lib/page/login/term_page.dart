import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/util/route_provier.dart';
import 'package:webview_flutter/webview_flutter.dart';

final checkTermProvider = StateProvider<bool>((ref) => false);
class TermPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_TermPageState();

}

class _TermPageState extends ConsumerState<TermPage>{
  late WebViewController _webViewController;
  String filePath = 'assets/term.html';
  @override

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
  @override
  Widget build(BuildContext context) {
    final checkTerm = ref.watch(checkTermProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("약관 안내"),
      ),
      body: Container(
        child: WebView(initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _loadHtmlFromAssets();
          },),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
            child: Row(
              children: [
                Checkbox(value: checkTerm, onChanged: (value){ref.read(checkTermProvider.notifier).state=value!;}),
                Text("개인정보 수집 동의"),
              ],
            ),),
            Container(
              padding: EdgeInsets.only(right:30),
            child: TextButton(
              onPressed: (){
                if(ref.read(checkTermProvider)){
                  navigatorKey.currentState!.pushNamedAndRemoveUntil(Routes.userinfoInput, (route) => false);
                }
                else{
                  Fluttertoast.showToast(msg: "개인정보 수집에 동의해야 가입을 완료할 수 있습니다.");
                }
              },
              child: Text("다음"),
            ),)
          ],
        ),
      ),
    );
  }

}

/*
WebView(initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _loadHtmlFromAssets();
          },),
 */