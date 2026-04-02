class MyOrderItemData {
  const MyOrderItemData({
    required this.name,
    required this.image,
    required this.price,
  });

  final String name;
  final String image;
  final String price;
}

const List<MyOrderItemData> myOrderItems = <MyOrderItemData>[
  MyOrderItemData(
    name: 'Basic T-shirt',
    image: 'lib/assets/catagories/men/men1.png',
    price: '\$ 49.00',
  ),
  MyOrderItemData(
    name: 'Cotton T-shirt',
    image: 'lib/assets/catagories/men/men2.png',
    price: '\$ 69.00',
  ),
  MyOrderItemData(
    name: 'Long-sleeved T-shirt',
    image: 'lib/assets/catagories/women/women1.jpg',
    price: '\$ 49.00',
  ),
];
