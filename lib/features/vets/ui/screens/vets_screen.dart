part of vets_module;

class VetsScreen extends StatelessWidget {
  const VetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("available veterinarians"),
      ),
      body: Padding(
          padding: AppPadding.p24.paddingHorizontal,
          child: GetBuilder<VetsController>(
            builder: (VetsController controller) =>
                controller.isLoading == true ? const Center(
                    child: LoadingStatusWidget(loadingStatus: LoadingStatusOption.loading,)
                ) :
                ListView.builder(
              shrinkWrap: true,
                itemCount: controller.vets.length,
                itemBuilder: (context, index) {
                  final vet = controller.vets[index];
                  return VetCard(vet: vet);
                }),
          )),
    );
  }
}
