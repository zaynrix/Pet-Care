part of article_module;

class ArticleRepo{

  Future<List<ArticleModel>> getArticleRepo() async {
    const response = '''{
   "articles" : [
  {
    "id": "1",
    "title": "Fake Article 1",
    "content": "This is the content of Fake Article 1.",
    "description": "Description of Fake Article 1.",
    "isPublished": true,
    "petCategory": "Dogs",
    "createdAt": "2023-07-30T12:34:56Z",
    "updatedAt": "2023-07-30T12:34:56Z",
    "imagePath": "path/to/image1.jpg"
  },
  {
    "id": "2",
    "title": "Fake Article 2",
    "content": "This is the content of Fake Article 2.",
    "description": "Description of Fake Article 2.",
    "isPublished": false,
    "petCategory": "Cats",
    "createdAt": "2023-07-29T10:11:12Z",
    "updatedAt": "2023-07-30T08:09:10Z",
    "imagePath": "path/to/image2.jpg"
  },
  {
    "id": "3",
    "title": "Fake Article 3",
    "content": "This is the content of Fake Article 3.",
    "description": "Description of Fake Article 3.",
    "isPublished": true,
    "petCategory": "Fish",
    "createdAt": "2023-07-28T05:06:07Z",
    "updatedAt": "2023-07-29T12:34:56Z",
    "imagePath": "path/to/image3.jpg"
  },
  {
    "id": "4",
    "title": "Fake Article 4",
    "content": "This is the content of Fake Article 4.",
    "description": "Description of Fake Article 4.",
    "isPublished": true,
    "petCategory": "Birds",
    "createdAt": "2023-07-27T15:30:45Z",
    "updatedAt": "2023-07-28T11:22:33Z",
    "imagePath": "path/to/image4.jpg"
  },
  {
    "id": "5",
    "title": "Fake Article 5",
    "content": "This is the content of Fake Article 5.",
    "description": "Description of Fake Article 5.",
    "isPublished": false,
    "petCategory": "Rabbits",
    "createdAt": "2023-07-26T09:45:56Z",
    "updatedAt": "2023-07-27T13:25:30Z",
    "imagePath": "path/to/image5.jpg"
  },
  {
    "id": "6",
    "title": "Fake Article 6",
    "content": "This is the content of Fake Article 6.",
    "description": "Description of Fake Article 6.",
    "isPublished": true,
    "petCategory": "Reptiles",
    "createdAt": "2023-07-25T20:15:30Z",
    "updatedAt": "2023-07-26T09:10:20Z",
    "imagePath": "path/to/image6.jpg"
  },
  {
    "id": "7",
    "title": "Fake Article 7",
    "content": "This is the content of Fake Article 7.",
    "description": "Description of Fake Article 7.",
    "isPublished": false,
    "petCategory": "Hamsters",
    "createdAt": "2023-07-24T16:40:20Z",
    "updatedAt": "2023-07-25T14:33:42Z",
    "imagePath": "path/to/image7.jpg"
  },
  {
    "id": "8",
    "title": "Fake Article 8",
    "content": "This is the content of Fake Article 8.",
    "description": "Description of Fake Article 8.",
    "isPublished": true,
    "petCategory": "Guinea Pigs",
    "createdAt": "2023-07-23T06:12:34Z",
    "updatedAt": "2023-07-24T19:50:15Z",
    "imagePath": "path/to/image8.jpg"
  },
  {
    "id": "9",
    "title": "Fake Article 9",
    "content": "This is the content of Fake Article 9.",
    "description": "Description of Fake Article 9.",
    "isPublished": false,
    "petCategory": "Horses",
    "createdAt": "2023-07-22T18:22:15Z",
    "updatedAt": "2023-07-23T11:40:30Z",
    "imagePath": "path/to/image9.jpg"
  },
  {
    "id": "10",
    "title": "Fake Article 10",
    "content": "This is the content of Fake Article 10.",
    "description": "Description of Fake Article 10.",
    "isPublished": true,
    "petCategory": "Snakes",
    "createdAt": "2023-07-21T13:55:10Z",
    "updatedAt": "2023-07-22T16:10:40Z",
    "imagePath": "path/to/image10.jpg"
  }
]}
 ''';

    Map<String, dynamic> jsonResponse = jsonDecode(response);
    List jsonItems = jsonResponse["articles"];
    List<ArticleModel> articles = jsonItems.map((e) => ArticleModel.fromJson(e)).toList();
    return articles;
  }
}