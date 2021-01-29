import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newspedia/helper/data.dart';
import 'package:newspedia/helper/news.dart';
import 'package:newspedia/models/article_model.dart';
import 'package:newspedia/models/category_model.dart';
import 'package:newspedia/page_views/article_view.dart';
import 'package:newspedia/page_views/category_view.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<CategoryModel> categories= new List<CategoryModel>();
  List<ArticleModel> articles= new List<ArticleModel>();
  bool __loading= true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories= getCategories();
    getNews();
  }

  getNews() async{
    News newsClass= News();
    await newsClass.getNews();
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
            children: <Widget>[
              Container(
                height: 160,
                child: ListView.builder(
                  itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                    return CategoryThumbnails(
                      imagePath: categories[index].imagePath,
                      categoryName: categories[index].categoryName,
                    );
                    }),
              ),
              SizedBox(height: 5,),
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

class CategoryThumbnails extends StatelessWidget {
  
  final String imagePath, categoryName;
  CategoryThumbnails({this.imagePath, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> CategoryView(
              category: categoryName.toLowerCase(),
            )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(imageUrl: imagePath, width: 100, height: 150, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,

              width: 100, height: 150,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(7)),
              child: Text(categoryName, textAlign: TextAlign.center, style: TextStyle(

                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),),
            ),
          ],
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
