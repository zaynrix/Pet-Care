part of vets_module;

class VetsRepo{

  Future<List<MainVetsModel>> getVetsRepo() async {
    const response = '''[
  {
    "name": "Vet 1",
    "id": "1",
    "price": 50.0,
    "completedService": 100,
    "experienceYears": 5,
    "image": "https://previews.123rf.com/images/edhar/edhar1112/edhar111200367/11480871-senior-handsome-man-doctor.jpg",
    "pio": "Lorem ipsum dolor sit amet",
    "rating" : 3.5",
     "countRating" : 32,
    "reviews": [
      {
        "rate": 4.5,
        "content": "Great vet, very knowledgeable",
        "reviewsBy": "JohnDoe",
        "createdAt": "2023-08-08T10:00:00Z"
      },
      {
        "rate": 5.0,
        "content": "Excellent service!",
        "reviewsBy": "JaneSmith",
        "createdAt": "2023-08-08T11:30:00Z"
      }
    ]
  },
  {
    "name": "Vet 2",
    "id": "2",
    "price": 60.0,
    "completedService": 150,
    "experienceYears": 8,
    "image": "https://previews.123rf.com/images/edhar/edhar1112/edhar111200367/11480871-senior-handsome-man-doctor.jpg",
    "pio": "Consectetur adipiscing elit",
    "rating" : 4.5",
    "countRating" : 20,
    "reviews": [
      {
        "rate": 4.0,
        "content": "Good vet, friendly staff",
        "reviewsBy": "AliceJohnson",
        "createdAt": "2023-08-08T09:15:00Z"
      },
      {
        "rate": 4.8,
        "content": "Highly recommended!",
        "reviewsBy": "BobMiller",
        "createdAt": "2023-08-08T14:20:00Z"
      }
    ]
  }
]
''';

    Map<String, dynamic> jsonResponse = jsonDecode(response);
    List jsonItems = jsonResponse["articles"];
    List<MainVetsModel> vets = jsonItems.map((e) => MainVetsModel.fromJson(e)).toList();
    return vets;
  }
}