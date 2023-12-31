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
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case RouteGenerator.orderInformationScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                value: sl<OrderInformationProvide>(),
                child: const OrderInformationScreen()));
      case RouteGenerator.addNewCardScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                value: sl<CardProvider>(), child: const AddNewCard()));
      case RouteGenerator.orderSuccess:
        return MaterialPageRoute(builder: (_) => const OrderSuccess());
      case RouteGenerator.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case RouteGenerator.paymentMethodScreen:
        return MaterialPageRoute(builder: (_) => PaymentMethodsScreen());
      case RouteGenerator.addressScreen:
        return MaterialPageRoute(builder: (_) => AddressScreen());
      case RouteGenerator.ordersScreen:
        return MaterialPageRoute(builder: (_) => OrdersScreen());
      case RouteGenerator.appointmentsScreen:
        return MaterialPageRoute(builder: (_) => const AppointmentsScreen());
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
                      value: sl<ProductProvider>(),
                      child: const AllPetProducts()),
                ));

      case RouteGenerator.allVetsDoctorScreen:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                  value: sl<HomeProvider>(),
                  child: const AllVetsDoctor(),
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
      case RouteGenerator.mainScreenApp:
        return MaterialPageRoute(builder: (_) => const MainScreenApp());

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

      case RouteGenerator.splashScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const SplashScreen();
          },
        );

      case RouteGenerator.loginScreen:
        return MaterialPageRoute(
          builder: (_) {
            return LoginScreen();
          },
        );
      case RouteGenerator.reminderScreen:
        return MaterialPageRoute(builder: (_) => ReminderScreen());
      case RouteGenerator.successAddPatScreen:
        return MaterialPageRoute(builder: (_) => const SuccessAddPatScreen());
      case RouteGenerator.editPetInfo:
        return MaterialPageRoute(builder: (_) {
          return const EditPetInfo();
        });
      case RouteGenerator.findArticle:
        return MaterialPageRoute(
            builder: (_) {
              initArticle();
              return ChangeNotifierProvider.value(
                value: sl<ArticleController>(), child: const FindArticle());});
      case RouteGenerator.addNewLocation:
        return MaterialPageRoute(builder: (_) => AddNewAddressScreen());
      case RouteGenerator.findVet:
        return MaterialPageRoute(builder: (_) {
          initVets();
          return const VetsScreen();
        });
      default:
        throw const FormatException("Route not found");
    }
  }
}
