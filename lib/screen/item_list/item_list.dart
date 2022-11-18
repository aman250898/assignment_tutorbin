import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import '../../model/datamodel.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {

     Map<String, dynamic> ?userMap;
     var user;
     List<int> data=[];
     List<int> addItem=[];
     int totalAmount=0, flag=0;
     var values=0;

     List countData1 = [];
     List countData2 = [];
     List countData3 = [];
     List countData4 = [];

     @override
     void initState() {
       userMap =dataLists;
       user = Welcome.fromJson(userMap!);
       countData1 = new List.filled(user.cat1!.length, 0);
       countData2 = new List.filled(user.cat1!.length, 0);
       countData3 = new List.filled(user.cat1!.length, 0);
       countData4 = new List.filled(user.cat1!.length, 0);
       super.initState();
     }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Restaurant"),
          backgroundColor: Colors.orange,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
          ),
        ),
        backgroundColor: Colors.white,
        body: WillPopScope(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: double.infinity,
                        // flex: 1,
                            child: Column(
                              children: [

                                // popular Item
                                Visibility(
                                  visible: flag==1,
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    children: <Widget>[
                                      ExpansionTileCard(
                                          baseColor: Colors.white,
                                          expandedColor: Colors.white,
                                          title: Row(
                                            children: const [
                                              Text("Popular items",),
                                              Spacer(),
                                              Text("3"),
                                            ],
                                          ),
                                          children: <Widget>[
                                            const Divider(
                                              thickness: 1.0,
                                              height: 1.0,
                                            ),
                                            ListView.builder(
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemCount: 3,
                                                itemBuilder:
                                                    (BuildContext context,
                                                    int indexs) {
                                                  return
                                                    Column(
                                                      children: [
                                                        Container(
                                                          color: Colors.grey[200],
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.
                                                            spaceEvenly,
                                                            children: [
                                                              Expanded(
                                                                flex:8,
                                                                child: Padding(
                                                                  padding: const
                                                                  EdgeInsets.all(8.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const
                                                                        EdgeInsets.all(8.0),
                                                                        child: Text(
                                                                          user.cat2![indexs].name.toString(),
                                                                          style: const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Text("\$ ${user.cat2![indexs].price}",
                                                                          style: const TextStyle(color: Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                  flex:3,
                                                                  child:
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(right: 10),
                                                                    child: GestureDetector(
                                                                      onTap: (){
                                                                        setState(() {
                                                                          countData2[indexs]=countData2[indexs]+1;
                                                                          totalAmount=user.cat2![indexs].price+totalAmount;
                                                                        });
                                                                      },
                                                                      child: Container(
                                                                        width: 140,
                                                                        decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                            color: Colors.orange,),
                                                                          borderRadius: BorderRadius.circular(40),
                                                                        ),
                                                                        child:
                                                                        countData2[indexs]==0?const Center(child: Padding(
                                                                          padding: EdgeInsets.all(5.0),
                                                                          child: Text("Add",
                                                                            style: TextStyle(
                                                                                color: Colors.orange),),
                                                                        )):
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                                flex:1,
                                                                                child: GestureDetector(
                                                                                    onTap: (){
                                                                                      setState(() {
                                                                                        countData2[indexs]=countData2[indexs]+1;
                                                                                        totalAmount=user.cat2![indexs].price+totalAmount;
                                                                                      });
                                                                                    },
                                                                                    child: Icon(Icons.add,color: Colors.orange,))),
                                                                            Expanded(
                                                                              flex:2,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.orange,
                                                                                  borderRadius: BorderRadius.circular(40),),
                                                                                child:  Padding(
                                                                                  padding: EdgeInsets.all(8.0),
                                                                                  child: Center(child: Text(countData2[indexs].toString(),style: TextStyle(color: Colors.white),)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                                flex:1,
                                                                                child: GestureDetector(
                                                                                    onTap: (){
                                                                                      setState(() {
                                                                                        if(countData2[indexs]>0){
                                                                                          countData2[indexs]=countData2[indexs]-1;
                                                                                          values=user.cat2![indexs].price;
                                                                                          totalAmount=totalAmount-values;

                                                                                        }
                                                                                      });
                                                                                    },
                                                                                    child: Icon(Icons.remove,color: Colors.orange,)))],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                        )
                                                        ,
                                                        const Divider(
                                                          thickness: 1.0,
                                                          height: 1.0,
                                                        ),
                                                      ],
                                                    );
                                                }),
                                          ]),
                                    ],
                                  ),
                                ),

                                // Cat 1
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                    ExpansionTileCard(
                                        baseColor: Colors.white,
                                        expandedColor: Colors.white,
                                        title: Row(
                                          children: [
                                            const Text("Cat 1",),
                                            const Spacer(),
                                            Text(user.cat1!.length.toString()),
                                          ],
                                        ),
                                        children: <Widget>[
                                          const Divider(
                                            thickness: 1.0,
                                            height: 1.0,
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: user.cat1!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                  int indexs) {
                                                return
                                                  Column(
                                                    children: [
                                                      Container(
                                                        color: Colors.grey[200],
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.
                                                          spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              flex:8,
                                                              child: Padding(
                                                                padding: const
                                                                EdgeInsets.all(8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const
                                                                      EdgeInsets.all(8.0),
                                                                      child: Text(
                                                                        user.cat1![indexs].name.toString(),
                                                                        style: const TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Text("\$ ${user.cat1![indexs].price}",
                                                                        style: const TextStyle(color: Colors.grey),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex:3,
                                                                child:
                                                                Padding(
                                                                  padding: const EdgeInsets.only(right: 10),
                                                                  child: GestureDetector(
                                                                    onTap: (){
                                                                      setState(() {
                                                                        countData1[indexs] = countData1[indexs]+1;
                                                                        totalAmount=user.cat1![indexs].price+totalAmount;
                                                                      });
                                                                    },
                                                                    child: Container(
                                                                      width: 140,
                                                                      decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                          color: Colors.orange,),
                                                                        borderRadius: BorderRadius.circular(40),
                                                                      ),
                                                                      child:
                                                                      countData1[indexs]==0?const Center(child: Padding(
                                                                        padding: EdgeInsets.all(5.0),
                                                                        child: Text("Add",
                                                                          style: TextStyle(
                                                                              color: Colors.orange),),
                                                                      )):
                                                                      Row(
                                                                        children: [
                                                                          Expanded(
                                                                              flex:1,
                                                                              child: GestureDetector(
                                                                                  onTap: (){
                                                                                    setState(() {
                                                                                      countData1[indexs] = countData1[indexs]+1;
                                                                                      totalAmount=user.cat1![indexs].price+totalAmount;
                                                                                    });
                                                                                  },
                                                                                  child: Icon(Icons.add,color: Colors.orange,))),
                                                                          Expanded(
                                                                            flex:2,
                                                                            child: Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.orange,
                                                                                borderRadius: BorderRadius.circular(40),),
                                                                              child:  Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Center(child: Text(countData1[indexs].toString(),style: TextStyle(color: Colors.white),)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                              flex:1,
                                                                              child: GestureDetector(
                                                                                  onTap: (){
                                                                                    setState(() {
                                                                                      if(countData1[indexs]>0){
                                                                                        countData1[indexs] = countData1[indexs]-1;
                                                                                        values=user.cat1![indexs].price;
                                                                                        totalAmount=totalAmount-values;

                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  child: Icon(Icons.remove,color: Colors.orange,)))],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      )
                                                      ,
                                                      const Divider(
                                                        thickness: 1.0,
                                                        height: 1.0,
                                                      ),
                                                    ],
                                                  );
                                              }),
                                        ]),
                                  ],
                                ),

                                // Cat 2
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                    ExpansionTileCard(
                                        baseColor: Colors.white,
                                        expandedColor: Colors.white,
                                        title: Row(
                                          children: [
                                            const Text("Cat 2",),
                                            const Spacer(),
                                            Text(user.cat2!.length.toString()),
                                          ],
                                        ),
                                        children: <Widget>[
                                          const Divider(
                                            thickness: 1.0,
                                            height: 1.0,
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: user.cat2!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                  int indexs) {
                                                return
                                                  Column(
                                                  children: [
                                                    Container(
                                                      color: Colors.grey[200],
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.
                                                        spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            flex:8,
                                                            child: Padding(
                                                              padding: const
                                                              EdgeInsets.all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const
                                                                    EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      user.cat2![indexs].name.toString(),
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                      fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text("\$ ${user.cat2![indexs].price}",
                                                                      style: const TextStyle(color: Colors.grey),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex:3,
                                                              child:
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 10),
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      countData2[indexs]=countData2[indexs]+1;
                                                                      totalAmount=user.cat2![indexs].price+totalAmount;

                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    width: 140,
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color: Colors.orange,),
                                                                      borderRadius: BorderRadius.circular(40),
                                                                    ),
                                                                    child:
                                                                    countData2[indexs]==0?const Center(child: Padding(
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Add",
                                                                        style: TextStyle(
                                                                            color: Colors.orange),),
                                                                    )):
                                                                    Row(
                                                                      children: [
                                                                         Expanded(
                                                                            flex:1,
                                                                            child: GestureDetector(
                                                                              onTap: (){
                                                                                setState(() {
                                                                                  countData2[indexs]=countData2[indexs]+1;
                                                                                  totalAmount=user.cat2![indexs].price+totalAmount;
                                                                                });
                                                                              },
                                                                                child: Icon(Icons.add,color: Colors.orange,))),
                                                                        Expanded(
                                                                          flex:2,
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.orange,
                                                                              borderRadius: BorderRadius.circular(40),),
                                                                            child:  Padding(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: Center(child: Text(countData2[indexs].toString(),style: TextStyle(color: Colors.white),)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                         Expanded(
                                                                            flex:1,
                                                                            child: GestureDetector(
                                                                                onTap: (){
                                                                                  setState(() {
                                                                                    if(countData2[indexs]>0){
                                                                                      countData2[indexs] = countData2[indexs]-1;
                                                                                      values=user.cat2![indexs].price;
                                                                                      totalAmount=totalAmount-values;

                                                                                    }
                                                                                  });
                                                                                },
                                                                                child: Icon(Icons.remove,color: Colors.orange,)))],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    )
                                                    ,
                                                    const Divider(
                                                      thickness: 1.0,
                                                      height: 1.0,
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ]),
                                  ],
                                ),

                                // Cat 3
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                    ExpansionTileCard(
                                        baseColor: Colors.white,
                                        expandedColor: Colors.white,
                                        title: Row(
                                          children: [
                                            const Text("Cat 3",),
                                            const Spacer(),
                                            Text(user.cat3!.length.toString()),
                                          ],
                                        ),
                                        children: <Widget>[
                                          const Divider(
                                            thickness: 1.0,
                                            height: 1.0,
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: user.cat3!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                  int indexs) {
                                                return
                                                  Column(
                                                  children: [
                                                    Container(
                                                      color: Colors.grey[200],
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.
                                                        spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            flex:8,
                                                            child: Padding(
                                                              padding: const
                                                              EdgeInsets.all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const
                                                                    EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      user.cat3![indexs].name.toString(),
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                      fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text("\$ ${user.cat3![indexs].price}",
                                                                      style: const TextStyle(color: Colors.grey),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex:3,
                                                              child:
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 10),
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      countData3[indexs]=countData3[indexs]+1;
                                                                      totalAmount=user.cat3![indexs].price+totalAmount;

                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    width: 140,
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color: Colors.orange,),
                                                                      borderRadius: BorderRadius.circular(40),
                                                                    ),
                                                                    child:
                                                                    countData3[indexs]==0?const Center(child: Padding(
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Add",
                                                                        style: TextStyle(
                                                                            color: Colors.orange),),
                                                                    )):
                                                                    Row(
                                                                      children: [
                                                                         Expanded(
                                                                            flex:1,
                                                                            child: GestureDetector(
                                                                              onTap: (){
                                                                                setState(() {
                                                                                  countData3[indexs] = countData3[indexs]+1;
                                                                                  totalAmount=user.cat3![indexs].price+totalAmount;
                                                                                });
                                                                              },
                                                                                child: Icon(Icons.add,color: Colors.orange,))),
                                                                        Expanded(
                                                                          flex:2,
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.orange,
                                                                              borderRadius: BorderRadius.circular(40),),
                                                                            child:  Padding(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: Center(child: Text(countData3[indexs].toString(),style: TextStyle(color: Colors.white),)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                         Expanded(
                                                                            flex:1,
                                                                            child: GestureDetector(
                                                                                onTap: (){
                                                                                  setState(() {
                                                                                    if(countData3[indexs]>0){
                                                                                      countData3[indexs] = countData3[indexs]-1;
                                                                                      values=user.cat3![indexs].price;
                                                                                      totalAmount=totalAmount-values;

                                                                                    }                                                                                  });
                                                                                },
                                                                                child: Icon(Icons.remove,color: Colors.orange,)))],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    )
                                                    ,
                                                    const Divider(
                                                      thickness: 1.0,
                                                      height: 1.0,
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ]),
                                  ],
                                ),

                                // Cat 4
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                    ExpansionTileCard(
                                        baseColor: Colors.white,
                                        expandedColor: Colors.white,
                                        title: Row(
                                          children: [
                                            const Text("Cat 4",),
                                            const Spacer(),
                                            Text(user.cat4!.length.toString()),
                                          ],
                                        ),
                                        children: <Widget>[
                                          const Divider(
                                            thickness: 1.0,
                                            height: 1.0,
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: user.cat4!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                  int indexs) {
                                                return
                                                  Column(
                                                  children: [
                                                    Container(
                                                      color: Colors.grey[200],
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.
                                                        spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            flex:8,
                                                            child: Padding(
                                                              padding: const
                                                              EdgeInsets.all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const
                                                                    EdgeInsets.all(8.0),
                                                                    child: Text(
                                                                      user.cat4![indexs].name.toString(),
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                      fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Text("\$ ${user.cat4![indexs].price}",
                                                                      style: const TextStyle(color: Colors.grey),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex:3,
                                                              child:
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 10),
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      countData4[indexs]=countData4[indexs]+1;
                                                                      totalAmount=user.cat4![indexs].price+totalAmount;
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                    width: 140,
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color: Colors.orange,),
                                                                      borderRadius: BorderRadius.circular(40),
                                                                    ),
                                                                    child:
                                                                    countData4[indexs]==0? Center(child: Padding(
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Add",
                                                                        style: TextStyle(
                                                                            color: Colors.orange),),
                                                                    )):
                                                                    Row(
                                                                      children: [
                                                                         Expanded(
                                                                            flex:1,
                                                                            child: GestureDetector(
                                                                              onTap: (){
                                                                                setState(() {
                                                                                  countData4[indexs] = countData4[indexs]+1;
                                                                                  totalAmount=user.cat4![indexs].price+totalAmount;

                                                                                });
                                                                              },
                                                                                child: Icon(Icons.add,color: Colors.orange,))),
                                                                        Expanded(
                                                                          flex:2,
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.orange,
                                                                              borderRadius: BorderRadius.circular(40),),
                                                                            child:  Padding(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: Center(child: Text(countData4[indexs].toString(),style: TextStyle(color: Colors.white),)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                         Expanded(
                                                                            flex:1,
                                                                            child: GestureDetector(
                                                                                onTap: (){
                                                                                  setState(() {
                                                                                    if(countData4[indexs]>0){
                                                                                      countData4[indexs] = countData4[indexs]-1;
                                                                                      values=user.cat4![indexs].price;
                                                                                      totalAmount=totalAmount-values;
                                                                                    }                                                                                  });
                                                                                },
                                                                                child: Icon(Icons.remove,color: Colors.orange,)))],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    )
                                                    ,
                                                    const Divider(
                                                      thickness: 1.0,
                                                      height: 1.0,
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ]),
                                  ],
                                ),

                                // Place Order
                                GestureDetector(
                                  onTap: (){
                                    if(totalAmount!=0){
                                      _showDialogBox(totalAmount);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:  Center(child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("Place Order  \$ "+totalAmount.toString(),
                                          style: TextStyle(
                                              color: Colors.white,fontSize: 18,
                                          fontWeight: FontWeight.bold),),
                                      ))
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
              ],
            ),
            onWillPop: () async {
              return false;
            }),
      ),
    );
  }

  void _showDialogBox(int $totalamount) {
       showDialog(
           barrierDismissible: false,
           context: context,
           builder: (context) {
             return AlertDialog(
               title: Text("Are you sure"),
               content:
               Text("To Place Order \$"+$totalamount.toString()),
               actions: [
                 TextButton(
                   onPressed: () {
                     Navigator.pop(context);
                   },
                   child: Text("CANCEL"),
                 ),
                 TextButton(
                   onPressed: () {
                    totalAmount=0;
                    Navigator.pop(context);
                    setState(() {
                      flag=1;
                      countData1 = new List.filled(user.cat1!.length, 0);
                      countData2 = new List.filled(user.cat1!.length, 0);
                      countData3 = new List.filled(user.cat1!.length, 0);
                      countData4 = new List.filled(user.cat1!.length, 0);
                    });
                   },
                   child: Text("OK"),
                 )
               ],
             );
           });
     }
}

