import 'dart:convert';

import 'package:pet_care/features/home/models/pets_model.dart';
import 'package:pet_care/features/home/models/vets_model.dart';

class HomeRepository {
  Future<PetsModel> getPetsRepo() async {
    const String response = '''
{
  "pets": [
    {
      "petname": "Buddy",
      "selected": true,
      "id": 1,
      "image": "https://plus.unsplash.com/premium_photo-1673524889116-851a6919b52f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
    },
    {
      "petname": "Max",
      "selected": false,
      "id": 2,
      "image": "https://plus.unsplash.com/premium_photo-1674236550362-58a7fdd7f899?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YW5pbWFsfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60"
    },
    {
      "petname": "Charlie",
      "selected": false,
      "id": 3,
      "image": "https://images.unsplash.com/photo-1425082661705-1834bfd09dca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGFuaW1hbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60"
    }
  ]
}
''';

    Map<String, dynamic> jsonResponse = jsonDecode(response);
    PetsModel petsModel = PetsModel.fromJson(jsonResponse);
    return petsModel;
  }

  Future<VetsModel> getVetsRepo() async {
    const String response = '''
{
  "vets": [
    {
      "name": "Dr. John Doe",
      "id": 1,
      "review": 3,
      "image": "https://media.istockphoto.com/id/138205019/photo/happy-healthcare-practitioner.jpg?s=612x612&w=0&k=20&c=b8kUyVtmZeW8MeLHcDsJfqqF0XiFBjq6tgBQZC7G0f0="
    },
    {
      "name": "Dr. Jane Smith",
      "id": 2,
      "review": 5,
      "image": "https://previews.123rf.com/images/edhar/edhar1112/edhar111200367/11480871-senior-handsome-man-doctor.jpg"
    },
    {
      "name": "Dr. Michael Johnson",
      "id": 3,
      "review": 4,
      "image": "https://media.glamour.com/photos/569669a9eaefd309768dd95e/master/w_1600%2Cc_limit/health-fitness-blogs-vitamin-g-0708-concierge-doctor_vg.jpg"
    }
  ]
}


''';

    Map<String, dynamic> jsonResponse = jsonDecode(response);
    VetsModel vetsModel = VetsModel.fromJson(jsonResponse);
    return vetsModel;
  }
}
