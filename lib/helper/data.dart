import 'package:newspedia/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category= new List<CategoryModel>();
  CategoryModel categoryModel= new CategoryModel();

  //1st
  categoryModel.categoryName= "Technology";
  categoryModel.imagePath= "https://images.unsplash.com/photo-1535223289827-42f1e9919769?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  //2nd
  categoryModel.categoryName= "Entertainment";
  categoryModel.imagePath= "https://images.unsplash.com/photo-1470020618177-f49a96241ae7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  //3rd
  categoryModel.categoryName= "Science";
  categoryModel.imagePath= "https://images.unsplash.com/photo-1516339901601-2e1b62dc0c45?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=620&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  //4th
  categoryModel.categoryName= "Business";
  categoryModel.imagePath= "https://images.unsplash.com/photo-1472417583565-62e7bdeda490?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  //5th
  categoryModel.categoryName= "Sports";
  categoryModel.imagePath= "https://images.unsplash.com/photo-1509027572446-af8401acfdc3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  //6th
  categoryModel.categoryName= "Health";
  categoryModel.imagePath= "https://images.unsplash.com/photo-1549476464-37392f717541?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(categoryModel);


  return category;

}