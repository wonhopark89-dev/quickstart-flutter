import 'package:carrot/constants/common_size.dart';
import 'package:carrot/data/address_model.dart';
import 'package:carrot/data/address_model2.dart';
import 'package:carrot/uilts/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'address_service.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();

  AddressModel? _addressModel;
  List<AddressModel2> _addressModel2List = [];
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
              // todo : 완료버튼 꼭 눌러야함
              _addressModel2List.clear();
              _addressModel = await AddressService().searchAddressByStr(text);
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
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Icon(
                    CupertinoIcons.compass,
                    color: Colors.white,
                    size: 20,
                  ),
            onPressed: () async {
              _addressModel = null;
              _addressModel2List.clear();

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

              List<AddressModel2> addresses = await AddressService()
                  .findAddressByCoordinate(
                      long: _locationData.longitude!,
                      lat: _locationData.latitude!);

              logger.d(addresses.length);
              _addressModel2List.addAll(addresses);

              setState(() {
                _isGettingLocation = false;
              });
            },
            label: Text(
              _isGettingLocation ? "위치정보 가져오는 중..." : "현재 위치 찾기",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          if (_addressModel != null)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: common_padding),
                itemBuilder: (context, index) {
                  if (_addressModel == null ||
                      _addressModel!.result == null ||
                      _addressModel!.result!.items == null ||
                      _addressModel!.result!.items![index].address == null) {
                    return Container();
                  }
                  return ListTile(
                    onTap: () {
                      _saveAddressOnSharedPreference(
                          _addressModel!.result!.items![index].address!.road ??
                              "");
                    },
                    // leading: Icon(Icons.image),
                    // trailing:
                    //     ExtendedImage.asset("assets/imgs/carrot_bunny.jpeg"),
                    title: Text(
                        _addressModel!.result!.items![index].address!.road ??
                            ""),
                    subtitle: Text(
                        _addressModel!.result!.items![index].address!.parcel ??
                            ""),
                  );
                },
                itemCount: (_addressModel == null ||
                        _addressModel!.result == null ||
                        _addressModel!.result!.items == null)
                    ? 0
                    : _addressModel!.result!.items!.length,
              ),
            ),
          if (_addressModel2List.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: common_padding),
                itemBuilder: (context, index) {
                  if (_addressModel2List[index].result == null ||
                      _addressModel2List[index].result!.isEmpty) {
                    logger.d("empty?");
                    return Container();
                  }
                  return ListTile(
                    onTap: () {
                      _saveAddressOnSharedPreference(
                          _addressModel2List[index].result![0].text ?? "");
                    },
                    // leading: Icon(Icons.image),
                    // trailing:
                    //     ExtendedImage.asset("assets/imgs/carrot_bunny.jpeg"),
                    title:
                        Text(_addressModel2List[index].result![0].text ?? ""),
                    subtitle: Text(
                        _addressModel2List[index].result![0].zipcode ?? ""),
                  );
                },
                itemCount: _addressModel2List.length,
              ),
            )
        ],
      ),
    );
  }

  _saveAddressOnSharedPreference(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);
  }
}
