
part of pets_module;

class PetRepo {
  Future<List<PetModel>> getPetsRepo() async {
    final String response = ''' 
    {
    "pets": [
  {
    "name": "Max",
    "age": 3,
    "breed": "Golden Retriever",
    "isNature": true,
    "type": "Dog",
    "gender": "Male",
    "photoUrl": "https://images.unsplash.com/photo-1596492784531-6e6eb5ea9993?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
  },
  {
    "name": "Lucy",
    "age": 2,
    "breed": "Siamese",
    "isNature": false,
    "type": "Cat",
    "gender": "Female",
    "photoUrl": "https://images.unsplash.com/photo-1529429617124-95b109e86bb8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80"
  },
  {
    "name": "Rocky",
    "age": 1,
    "breed": "German Shepherd",
    "isNature": true,
    "type": "Dog",
    "gender": "Male",
    "photoUrl": "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
  }
]
    }
    ''';

    Map<String, dynamic> jsonResponse = jsonDecode(response);
    List jsonItems = jsonResponse["pets"];
    List<PetModel> pets = jsonItems.map((e) => PetModel.formJson(e)).toList();
    return pets;
  }
}
