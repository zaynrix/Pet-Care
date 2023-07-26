part of routing_module;

class RoutsGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteGenerator.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case RouteGenerator.verifyEmailScreen:
        return MaterialPageRoute(builder: (_) => VerifyEmailScreen());
      case RouteGenerator.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case RouteGenerator.mainAuthScreen:
        return MaterialPageRoute(builder: (_) => const MainAuthScreen());
      case RouteGenerator.mainAddPetScreen:
        return MaterialPageRoute(builder: (_) => const MainAppPetScreen());
      case RouteGenerator.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case RouteGenerator.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case RouteGenerator.orderInformationScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                value: sl<OrderInformationProvide>(),
                child: OrderInformationScreen()));
      case RouteGenerator.addNewCardScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                value: sl<CardProvider>(), child: const AddNewCard()));
      case RouteGenerator.orderSuccess:
        return MaterialPageRoute(builder: (_) => const OrderSuccess());
      case RouteGenerator.editProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case RouteGenerator.paymentMethodScreen:
        return MaterialPageRoute(builder: (_) => PaymentMethodsScreen());
      case RouteGenerator.addressScreen:
        return MaterialPageRoute(builder: (_) => AddressScreen());
      case RouteGenerator.ordersScreen:
        return MaterialPageRoute(builder: (_) => OrdersScreen());
      case RouteGenerator.appointmentsScreen:
        return MaterialPageRoute(builder: (_) => AppointmentsScreen());
      case RouteGenerator.addNewPaymentMethodScreen:
        return MaterialPageRoute(builder: (_) => AddNewPaymentMethodScreen());
      case RouteGenerator.orderDetailScreen:
        return MaterialPageRoute(builder: (_) => const OrderDetailScreen());
      case RouteGenerator.mainShopScreen:
        return MaterialPageRoute(builder: (_) => const MainShopScreen());
      case RouteGenerator.allPetShopScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => HomeProvider(),
                  child: ChangeNotifierProvider.value(
                      value: sl<ProductController>(),
                      child: const AllPetProducts()),
                ));
      case RouteGenerator.addNewLocationManual:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: sl<AddressProvider>(),
            child: const AddNewAddressManually(),
          ),
        );
      case RouteGenerator.addReminderScreen:
        return MaterialPageRoute(builder: (_) => const AddReminderScreen());

      case RouteGenerator.searchScreen:
        return MaterialPageRoute(
          builder: (_) {
            return ChangeNotifierProvider.value(
              value: sl<HomeProvider>(),
              child: ChangeNotifierProvider.value(
                value: sl<SearchProvider>(),
                child: const SearchScreen(),
              ),
            );
          },
        );
      case RouteGenerator.homeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return ChangeNotifierProvider.value(
              value: sl<HomeProvider>(),
              child: const HomeScreen(),
            );
          },
        );

      default:
        throw const FormatException("Route not found");
    }
  }
}
