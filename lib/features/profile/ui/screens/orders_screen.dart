part of profile_module;

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> _orders = [
    {
      'status': 'Shipped',
      'date': 'Jul 3, 2023 • 04:48 PM',
      'address': '5616 Artesian Dr Derwood, Maryland(MD) 20855',
      'price': '\$64.95',
      'elements': [
        {'id': 1, 'url': 'assets/images/dog_medicine.png'},
        {'id': 2001, 'url': 'assets/images/dog_medicine.png'},
      ],
    },
    {
      'status': 'Completed',
      'date': 'Jul 2, 2023 • 04:48 PM',
      'address': '5616 Artesian Dr Derwood, Maryland(MD) 20855',
      'price': '\$64.95',
      'elements': [
        {'id': 3, 'url': 'assets/images/dog_medicine.png'},
        {'id': 4, 'url': 'assets/images/dog_medicine.png'},
        {'id': 45, 'url': 'assets/images/dog_medicine.png'},
        {'id': 46, 'url': 'assets/images/dog_medicine.png'},
      ],
    },
    {
      'status': 'Canceled',
      'date': 'Jul 2, 2023 • 04:48 PM',
      'address': '5616 Artesian Dr Derwood, Maryland(MD) 20855',
      'price': '\$64.95',
      'elements': [
        {'id': 45, 'url': 'assets/images/dog_medicine.png'},
        {'id': 45, 'url': 'assets/images/dog_medicine.png'},
        {'id': 45, 'url': 'assets/images/dog_medicine.png'},
        {'id': 45, 'url': 'assets/images/dog_medicine.png'},
      ],
    },
    // Add more order items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        leading: Row(
          children: [
            AppSize.s15.addHorizontalSpace,
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          ],
        ),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _orders,
        groupBy: (element) => _getGroupingLabel(element['date']),
        groupComparator: (value1, value2) => value2.compareTo(value1),
        order: GroupedListOrder.ASC,
        // useStickyGroupSeparators: true,
        groupSeparatorBuilder: (value) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Text(
                value,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: ColorManager.primaryWithTransparent10,
            )
          ],
        ),
        itemBuilder: (context, element) => Column(
          children: [
            Padding(
              padding: AppPadding.p24.paddingHorizontal,
              child: OrdersItem(
                element: element,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  String _getGroupingLabel(String dateString) {
    final DateFormat format = DateFormat('MMM d, yyyy • hh:mm a');
    final DateTime date = format.parse(dateString);
    final DateTime today = DateTime.now();
    final DateTime monthStart = DateTime(today.year, today.month);
    if (date.year == today.year && date.month == today.month) {
      if (date.day == today.day) {
        return 'Today';
      }
      return 'This Month';
    } else {
      return DateFormat('MMMM d, yyyy').format(date);
    }
  }
}
