
import 'package:coffee_shop/business_logic/bloc/local_order_bloc/order_bloc.dart';
import 'package:coffee_shop/business_logic/bloc/remote_order_bloc/remote_order_bloc.dart';
import 'package:coffee_shop/data/models/order_model_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
class LocationPhoneNumberDialog extends StatefulWidget {
  @override
  _LocationPhoneNumberDialogState createState() => _LocationPhoneNumberDialogState();
}

class _LocationPhoneNumberDialogState extends State<LocationPhoneNumberDialog> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    locationController.dispose();
    phoneNumberController.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Location and Phone Number'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          TextField(
            controller: phoneNumberController,
            focusNode: phoneNumberFocusNode,
            keyboardType: TextInputType.number,
            inputFormatters: [
              MaskTextInputFormatter(mask: '##-###-##-##', filter: {"#": RegExp(r'[0-9]')}),
            ],
            decoration: InputDecoration(labelText: 'Phone Number (##-###-##-##)'),
            onChanged: (value) {
              if (value.length == 12) {
                FocusScope.of(context).requestFocus(FocusNode()); // Hide keyboard
              }
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            String location = locationController.text;
            String phoneNumber = phoneNumberController.text;
            // Handle the location and phone number as needed
            print('Location: $location');
            print('Phone Number: $phoneNumber');
            context.read<RemoteOrderBloc>().add(PlaceOrder(OrderModelFirabase(
                location: location,
                phoneNumber: phoneNumber,
                orderItems: context.read<LocalOrderBloc>().state)));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showLocationPhoneNumberDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LocationPhoneNumberDialog();
    },
  );
}
