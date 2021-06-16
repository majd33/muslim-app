import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myappstate();
  }
}

class _myappstate extends State<myapp> {
  int _c = 0;

  void _inc() {
    setState(() {
      _c++;
    });
  }
  void _clear() {
    setState(() {
      _c=0;
    });
  }

  var athkar =[
    " اللهم أنت ربي، لا إله إلا أنت، خلَقتني وأنا عبدك، وأنا على عهدك ووعدك ما استطعت، أعوذ بك من شرِّ ما صنعت، أبُوء لك بنعمتك عليّ وأبوء بذنبي، فاغفر لي؛ فإنه لا يغفر الذنوب إلا أنت",
    "اللهم إني أسألك العافية في الدنيا والآخرة، اللهم إني أسألك العفو والعافية في ديني ودنياي، وأهلي ومالي، اللهم استُر عوراتي، وآمِن رَوعاتي، اللهم احفظني من بين يدي ومن خلفي، وعن يميني وعن شمالي، ومن فوقي، وأعوذ بعظمتك أن أُغتال من تحتي",
    "اللهم عافني في بدني، اللهم عافني في سمعي، اللهم عافني في بصري، لا إله إلا أنت",
    "اللهم إني أعوذ بك من الكفر والفقر، اللهم إني أعوذ بك من عذاب القبر، لا إله إلا أنت",
    "اللهم فاطر السموات والأرض، عالم الغيب والشهادة، ربَّ كلِّ شيء ومليكه، أشهد أنْ لا إله إلا أنت، أعوذ بك من شرِّ نفسي، وشر الشيطان وشِرْكه، وأن أَقترف على نفسي سوءًا، أو أجرَّه إلى مسلم",
    "رضيت بالله ربًّا، وبالإسلام دينًا، وبمحمد -صلى الله عليه وسلم- نبيًّا",
    "يا حي يا قيُّوم، برحمتك أستغيث، أصلِح لي شأني كله، ولا تَكلني إلى نفسي طرْفة عينٍ",
    "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد، وهو على كل شيء قدير",
    "سبحان الله وبحمده عدد خلقه، ورضا نفسه، وزِنة عرشه، ومداد كلماته",
    "بسم الله الذي لا يضرُّ مع اسمه شيء في الأرض ولا في السماء وهو السميع العليم",
  ];


  int AthkarIndex=0;
  int pageSelected=0;
  void pageNum(int value){
    setState(() {
      pageSelected=value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text("Muslim App")),
        body:
        pageSelected==0?
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Text("(${AthkarIndex+1})", style: TextStyle(fontSize: 15) ,textAlign: TextAlign.center,)),
                Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Text(athkar[AthkarIndex], style: TextStyle(fontSize: 16) ,textAlign: TextAlign.center,)),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                        IconButton(icon: Icon(Icons.arrow_back_ios_outlined, size: 25,), onPressed: (){
                          if(AthkarIndex>0)
                            setState(() {
                              AthkarIndex=AthkarIndex-1;
                            });
                          else
                            return null;
                        }),
                        SizedBox(width: 200,),
                        IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 30,), onPressed: (){
                          if(AthkarIndex<9)
                            setState(() {
                              AthkarIndex=AthkarIndex+1;
                            });
                          else
                            return null;
                        }),

                  ],
                )

              ],
            ),

        )
        :
        Center(
      child: InkWell(
      borderRadius: BorderRadius.circular(120),
      onTap: _inc,
      onLongPress:_clear,
      splashColor: Colors.grey,
      highlightColor: Colors.green,
      child:
      Container(
        height: 240,
        width: 240,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(120), border: Border.all(color: Colors.grey)),
        child: Center(
          child: Text(
            "$_c",
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    ),
    ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          onTap: pageNum,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.text_snippet),title: (Text("Athkar"))),
            BottomNavigationBarItem(icon: Icon(Icons.loop), title: (Text("Rosary"))),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.green[300],
          selectedFontSize: 20,
          unselectedFontSize: 10,
          currentIndex: pageSelected,
          //type: BottomNavigationBarType.shifting,
        ),
        ),

    );
  }
}
