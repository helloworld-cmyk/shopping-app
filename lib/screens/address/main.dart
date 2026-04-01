import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router/app_router.dart';
import '../../../widgets/common_app_bar.dart';
import 'address_mock_data.dart';
import 'widget/add_address_button.dart';
import 'widget/address_item.dart';

@RoutePage()
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final List<AddressModel> _addresses = [...mockAddresses];

  void _deleteAddress(int index) {
    setState(() {
      _addresses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              CommonAppBar(
                title: 'ADDRESS',
                onBack: () => context.router.maybePop(),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 100),
                  itemCount: _addresses.length,
                  itemBuilder: (context, index) {
                    final address = _addresses[index];
                    return AddressItem(
                      address: address,
                      onDelete: () => _deleteAddress(index),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            left: 25,
            right: 25,
            bottom: MediaQuery.of(context).padding.bottom + 16,
            child: AddAddressButton(
              onTap: () {
                context.router.push(const AddAddressRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
