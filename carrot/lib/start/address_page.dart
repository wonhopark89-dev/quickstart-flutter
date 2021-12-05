import 'package:carrot/constants/common_size.dart';
import 'package:carrot/data/address_model.dart';
import 'package:carrot/uilts/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'address_service.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();

  AddressModel? _addressmodel;
  bool _isGettingLocation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: common_padding, right: common_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _addressController,
            onFieldSubmitted: (text) async {
              _addressmodel = await AddressService().searchAddressByStr(text);
              setState(() {});
            },
            decoration: InputDecoration(
                hintText: "도로명으로 검색",
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 24, minHeight: 24),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey))),
          ),
          TextButton.icon(
            icon: _isGettingLocation
                ? CircularProgressIndicator()
                : Icon(
                    CupertinoIcons.compass,
                    color: Colors.white,
                    size: 20,
                  ),
            onPressed: () async {
              setState(() {
                _isGettingLocation = true;
              });

              Location location = new Location();

              bool _serviceEnabled;
              PermissionStatus _permissionGranted;
              LocationData _locationData;

              _serviceEnabled = await location.serviceEnabled();
              if (!_serviceEnabled) {
                _serviceEnabled = await location.requestService();
                if (!_serviceEnabled) {
                  return;
                }
              }

              _permissionGranted = await location.hasPermission();
              if (_permissionGranted == PermissionStatus.denied) {
                _permissionGranted = await location.requestPermission();
                if (_permissionGranted != PermissionStatus.granted) {
                  return;
                }
              }

              _locationData = await location.getLocation();
              logger.d(_locationData);
              AddressService().findAddressByCoordinate(
                  long: _locationData.longitude!, lat: _locationData.latitude!);

              setState(() {
                _isGettingLocation = false;
              });
            },
            label: Text(
              _isGettingLocation ? "위치정보 가져오는 중..." : "현재 위치 찾기",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: common_padding),
              itemBuilder: (context, index) {
                if (_addressmodel == null ||
                    _addressmodel!.result == null ||
                    _addressmodel!.result!.items == null ||
                    _addressmodel!.result!.items![index].address == null) {
                  return Container();
                }
                return ListTile(
                  // leading: Icon(Icons.image),
                  // trailing:
                  //     ExtendedImage.asset("assets/imgs/carrot_bunny.jpeg"),
                  title: Text(
                      _addressmodel!.result!.items![index].address!.road ?? ""),
                  subtitle: Text(
                      _addressmodel!.result!.items![index].address!.parcel ??
                          ""),
                );
              },
              itemCount: (_addressmodel == null ||
                      _addressmodel!.result == null ||
                      _addressmodel!.result!.items == null)
                  ? 0
                  : _addressmodel!.result!.items!.length,
            ),
          )
        ],
      ),
    );
  }
}
