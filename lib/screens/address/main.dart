import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/addressBloc/bloc.dart';
import '../../bloc/addressBloc/event.dart';
import '../../bloc/addressBloc/state.dart';
import '../../router/app_router.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/add_address_button.dart';
import 'widget/address_item.dart';

@RoutePage()
class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
                child: BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    if (state.addresses.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'No address yet. Add a new address to continue.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: const Color(0xFF8F8F8F)),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 100),
                      itemCount: state.addresses.length,
                      itemBuilder: (context, index) {
                        final address = state.addresses[index];
                        return AddressItem(
                          address: address,
                          isSelected: state.selectedAddressId == address.id,
                          onDelete: () {
                            context.read<AddressBloc>().add(
                              DeleteAddress(address.id),
                            );
                          },
                          onTap: () {
                            context.read<AddressBloc>().add(
                              SelectAddress(address.id),
                            );
                          },
                        );
                      },
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
