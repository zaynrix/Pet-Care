import 'package:flutter/material.dart';
import 'package:pet_care/common_widgets/custom_circularProgressIndicator.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/home/widgets/vet_card.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';

class AllVetsDoctor extends StatefulWidget {
  const AllVetsDoctor({Key? key}) : super(key: key);

  @override
  State<AllVetsDoctor> createState() => _AllVetsDoctorState();
}

class _AllVetsDoctorState extends State<AllVetsDoctor> {
  @override
  void initState() {
    super.initState();
    sl<HomeProvider>().getVetsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Vets"),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => homeProvider.vetsModel ==
                null
            ? const CustomCircularProgressIndicator()
            : Padding(
                padding: 20.paddingVertical,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 0.0, // Spacing between columns
                    mainAxisSpacing: 8.0, // Spacing between rows
                  ),
                  itemCount: homeProvider.vetsModel!.vets!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      homeProvider.setVetObject(
                          current: homeProvider.vetsModel!.vets![index]);
                    },
                    child: VetCardGrid(
                      vet: homeProvider.vetsModel!.vets![index],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
