import 'package:flutter/material.dart';
import 'upload_screen.dart';
import 'package:resomate/components/posts_list.dart';
import 'package:filter_list/filter_list.dart';

List<String> countList = [
  "All",
  "Blues",
  "R&B",
  "Jazz",
  "Rock",
  "Country",
  "Soul",
  "Dance",
  "Hip-hop",
];
List<String> selectedCountList = [];

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  void _openFilterList() async {
    var list = await FilterList.showFilterList(
      context,
      allTextList: countList,
      height: 450,
      borderRadius: 20,
      headlineText: "Select Genre",
      searchFieldHintText: "Search Here",
      selectedTextList: selectedCountList,
    );

    if (list != null) {
      setState(() {
        selectedCountList = List.from(list);
      });
    }
  }

  Widget getTabBar() {
    return TabBar(
      controller: tabController,
      tabs: [
        Tab(text: "Singer", icon: Icon(Icons.music_note)),
        Tab(text: "Composer", icon: Icon(Icons.create)),
        Tab(text: "MV Producer", icon: Icon(Icons.movie)),
      ],
    );
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      PostsList(
        type: 0,
      ),
      PostsList(
        type: 2,
      ),
      PostsList(
        type: 1,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          leading: Container(),
          flexibleSpace: SafeArea(
            child: getTabBar(),
          ),
        ),
//        floatingActionButton: FloatingActionButton(
//            backgroundColor: Colors.grey,
//            child: Icon(Icons.add),
//            onPressed: () {
//              showModalBottomSheet(
//                context: context,
//                builder: (context) => SingleChildScrollView(
//                  child: Container(
//                    padding: EdgeInsets.only(
//                      bottom: MediaQuery.of(context).viewInsets.bottom,
//                    ),
//                    child: UploadScreen(),
//                  ),
//                ),
//              );
//            }),

        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: _openFilterList,
              tooltip: 'Increment',
              backgroundColor: Colors.grey,
              child: Icon(Icons.filter_list),
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
                heroTag: 'btn2',
                backgroundColor: Colors.grey,
                child: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: UploadScreen(),
                      ),
                    ),
                  );
                }),
          ],
        ),

        /// check for empty or null value selctedCountList
        body: selectedCountList == null || selectedCountList.length == 0
            ? getTabBarPages()
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(selectedCountList[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: selectedCountList.length));
  }

//    return Scaffold(
//      backgroundColor: Colors.white,
//      floatingActionButton: FloatingActionButton(
//          backgroundColor: Colors.grey,
//          child: Icon(Icons.add),
//          onPressed: () {
//            showModalBottomSheet(
//              context: context,
//              builder: (context) => SingleChildScrollView(
//                child: Container(
//                  padding: EdgeInsets.only(
//                    bottom: MediaQuery.of(context).viewInsets.bottom,
//                  ),
//                  child: UploadScreen(),
//                ),
//              ),
//            );
//          }),
//      body: PostsList(),
//    );
}
