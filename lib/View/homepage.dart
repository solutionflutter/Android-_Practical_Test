import 'package:androidpracticaltest/Controller/fetchdataformapi.dart';
import 'package:androidpracticaltest/Models/quran.dart';
import 'package:androidpracticaltest/View/descriptionpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FetchDataFormApi>(
        builder: (_, fetchDataFormApi,__) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  "Home Screen",
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
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
              ),
              SliverFillRemaining(
                child: FutureBuilder<List<Results>?>(
                  future: fetchDataFormApi.fetchDataFormApi(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context,int index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                                  onPressed: (){
                                    Get.to(DescriptionPage(snapshot: snapshot, index: index));
                                  },
                                  child: Text(
                                    "${snapshot.data![index].text}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                  ),
              ),
            ],
          );
        },
      ),
    );
  }
}
