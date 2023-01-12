import 'package:androidpracticaltest/Models/quran.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DescriptionPage extends StatefulWidget {
  final AsyncSnapshot<List<Results>?> snapshot;
  final int index;
  const DescriptionPage({Key? key,required this.snapshot,required this.index}) : super(key: key);

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Description Screen",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
            ),
            pinned: true,
            floating: false,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: TextButton.icon(
                  onPressed: (){
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.black54,
                  ),
              label: Text(""),
              ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height/10,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 155, 155, .5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "verse_key : ${widget.snapshot.data![widget.index].verseId}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height/10,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 155, 155, .5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "verse_key : ${widget.snapshot.data![widget.index].verseKey}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height/5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 155, 155, .5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          "${widget.snapshot.data![widget.index].text}",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 155, 155, .5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Words : ",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/4,
                            padding: EdgeInsets.symmetric(vertical: 4),
                            alignment: Alignment.center,
                            child: ListView.builder(
                                itemCount: widget.snapshot.data![widget.index].words!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context,int index){
                                  return Text(
                                    "${widget.snapshot.data![widget.index].words![index].text} , ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black54,
                                    ),
                                  );
                                }
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 155, 155, .5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      "translations : ",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/4,
                      padding: EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      child: ListView.builder(
                          itemCount: widget.snapshot.data![widget.index].translations!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context,int index){
                            return Text(
                              "${widget.snapshot.data![widget.index].translations![index].text} , ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.black54,
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
