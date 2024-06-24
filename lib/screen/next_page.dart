import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('실시간'),
          elevation: 0.0,
          backgroundColor: Colors.grey[800],
          centerTitle: true,
          // 왼쪽 상단에 메뉴바
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: '전체'),
              Tab(text: '연예'),
              Tab(text: '스포츠'),
              Tab(text: '정치'),
              Tab(text: '경제'),
              Tab(text: '사회'),
              Tab(text: '생활/문화'),
              Tab(text: 'IT/과학'),
              Tab(text: '세계'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildCategoryPage('카테고리 1'),
            buildCategoryPage('카테고리 2'),
            buildCategoryPage('카테고리 3'),
            buildCategoryPage('카테고리 4'),
            buildCategoryPage('카테고리 5'),
            buildCategoryPage('카테고리 6'),
            buildCategoryPage('카테고리 7'),
            buildCategoryPage('카테고리 8'),
            buildCategoryPage('카테고리 9'),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryPage(String category) {
    return Center(
      child: Text(
        '게시물 받아올 예정 - $category',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
