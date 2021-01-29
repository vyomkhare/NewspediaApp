import 'package:flutter/material.dart';
import 'package:newspedia/helper/news.dart';
import 'package:newspedia/models/article_model.dart';
import 'article_view.dart';
import 'homepage.dart';

class CategoryView extends StatefulWidget {

  final String category;
  CategoryView({this.category});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  List<ArticleModel> articles= new List<ArticleModel>();

  bool __loading= true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNews newsClass= CategoryNews();
    await newsClass.getNews(widget.category);
    articles= newsClass.news;
    setState(() {
      __loading= false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("N  E  W  S  ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Text("P  E  D  I  A", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.add),
            ),
          )//for appBar title in center
        ],
        elevation: 0.0,
      ),
      body: __loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return NewsTile(
                        imagePath: articles[index].urlToImage,
                        title: articles[index].title,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {

  final String imagePath, title, description, url;
  NewsTile({@required this.imagePath, @required this.title, @required this.description, @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ArticleView(
              newsUrl: url,
            )));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imagePath)),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),),
            SizedBox(height: 5,),
            Text(description, style: TextStyle(
                color: Colors.white70,
                fontSize: 14
            ),)
          ],
        ),
      ),
    );
  }
}