
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_care/features/shop/controllers/product_cotroller.dart';
import 'package:pet_care/features/shop/models/product_model.dart';

// bool validateEmail(String email) {
//   if (email.isEmpty) {
//     return false;
//   }
//   // Check if the entered email has the right format
//   if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
//     return false;
//   }
//   // Return null if the entered email is valid
//   return true;
// }
void main() {
  late ProductController productController;

  setUp(() {
    productController = ProductController();
  });

// group("validation email", () {
//   test('invalid email', () {
//     expect(validateEmail("abdalrhmangmail.com"), false);
//   });
//   test('valid email', () {
//     expect(validateEmail("abdalrhman@gmail.com"), true);
//   });
// });



  group('ProductController', () {
    test('isFloatingActionButtonEnabled should return false when selectedCardIndex is -1', () {
      expect(productController.isFloatingActionButtonEnabled(), false);
    });

    test('selectVisa should update selectedIndexPayment correctly', () {
      // Initial state
      expect(productController.selectedIndexPayment, -1);

      // Select the first item
      productController.selectVisa(0);
      expect(productController.selectedIndexPayment, 0);

      // Select the same item again
      productController.selectVisa(0);
      expect(productController.selectedIndexPayment, -1);

      // Select a different item
      productController.selectVisa(1);
      expect(productController.selectedIndexPayment, 1);
    });

    test('addToCart should add the item to the cartList', () {
      // Initial state
      expect(productController.cartList.length, 0);
      expect(productController.cartLength, 0);

      final singleProduct = SingleProduct(id: 1, name: 'Product 1', price: 10.0);

      // Add the item to the cart
      productController.addToCart(singleProduct);

      // Verify the item is added to the cartList and cartLength is updated
      expect(productController.cartList.length, 1);
      expect(productController.cartList[0], singleProduct);
      expect(productController.cartLength, 1);
    });

    // test('deleteFromCart should remove the item from the cartList', () {
    //   // Initial state
    //   final singleProduct = SingleProduct(id: 1, name: 'Product 1', price: 10.0);
    //   productController.cartList = [singleProduct];
    //   productController.cartLength = 1;
    //
    //   // Remove the item from the cart
    //   productController.deleteFromCart(singleProduct);
    //1
    //   // Verify the item is removed from the cartList and cartLength is updated
    //   expect(productController.cartList.length, 0);
    //   expect(productController.cartLength, 0);
    // });
  });
}
