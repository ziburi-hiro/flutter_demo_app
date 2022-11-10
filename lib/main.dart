import 'package:flutter/material.dart';

import 'next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titleList = ['Amazon','楽天','Yahoo!'];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  // ビルドメソッドでUIの設計をしている
  //ウィジェットとプロパティが重要（頭が大文字だとウィジェット説、プロパティは頭が小文字）
  //ウィジェットの中のプロパティ
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //見出しのようなもの
        title: const Text('Flutterラボ'),
      ),
      body: ListView.builder(
        itemCount: titleList.length,
          itemBuilder: (context, index){
          return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.key), //左側に何かを表示
                  title: Text(titleList[index]),  //indexはi++のようなもの。最初は0。リストが作られるごとにi++される。
                  onTap: (){
                    print('list tapped');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(titleList[index])));
                  },
                ),
                //線
                const Divider(height: 0,),
              ],
            );
          }
      ),
      floatingActionButton: FloatingActionButton( //右下にウィジェットを表示している
        onPressed:(){
          titleList.add('Google');
          print(titleList);
          setState(() { //画面を再描画するメソッド
            
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
