part of profile_module;

extension CustomBorderSide on BorderSide {
  BorderSide withStatusColor(String status) {
    final Map<String, Color> statusColors = {
      'Shipped': const Color(0xFFC3E4F2),
      'Completed': const Color(0xFFD3EFC3),
      'Canceled': const Color(0xFFFF9D97),
    };

    if (statusColors.containsKey(status)) {
      return copyWith(color: statusColors[status]);
    }
    return this;
  }
}

class OrdersItem extends StatelessWidget {
  const OrdersItem({Key? key, this.element}) : super(key: key);
  final dynamic element;

  @override
  Widget build(BuildContext context) {
    final String status = element['status'];
    final Color? statusColor = getStatusColor(status);

    return Container(
        padding: AppPadding.p16.paddingAll,
        decoration: BoxDecoration(
          borderRadius: AppSize.s16.circularRadius,
          color: ColorManager.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: AppSize.s10.paddingHorizontal,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: statusColor!,
                  width: 3,
                ).withStatusColor(status),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      status,
                      style: bodyMedium,
                    ),
                    const Spacer(),
                    SvgPicture.asset(IconAssets.rightBack),
                  ],
                ),
                Text(
                  element['date'],
                  style: captionRegularPrimary,
                ),
                Text(
                  element['address'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: captionRegular,
                ),
              ],
            ),
          ),
          AppSize.s16.addVerticalSpace,
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: element['elements'].length > 3
                      ? 3
                      : element['elements'].length,
                  itemBuilder: (context, index) {
                    return Transform.translate(
                      offset: Offset(index * -30, 0), // Update the offset here
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorManager.secondGray),
                        ),
                        child: Image.asset(element['elements'][index]['url']),
                      ),
                    );
                  },
                ),
              ),
              if (element['elements'].length > 3) ...[
                Transform.translate(
                  offset: Offset(((element['elements'].length - 3) * -30.0),
                      0), // Update the offset here
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '+${element['elements'].length - 3}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                element['price'],
                style: bodyBoldPrimary,
              ),
              const Spacer(),
              SizedBox(
                height: 32,
                width: 115,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Reorder',
                    style: footNoteRegular(color: ColorManager.white),
                  ),
                ),
              ),
              // Rest of the widget code...
            ],
          ),
        ]));
  }

  Color? getStatusColor(String status) {
    final Map<String, Color> statusColors = {
      'Shipped': const Color(0xFFC3E4F2),
      'Completed': const Color(0xFFD3EFC3),
      'Canceled': const Color(0xFFFF9D97),
    };

    if (statusColors.containsKey(status)) {
      return statusColors[status];
    }
    // Return a default color if the status is not recognized
    return Colors.transparent;
  }
}
