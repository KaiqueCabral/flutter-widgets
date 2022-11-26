import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPackagePage extends StatefulWidget {
  static const String routeName = "/location-package";

  @override
  _LocationPackagePageState createState() => _LocationPackagePageState();
}

class _LocationPackagePageState extends State<LocationPackagePage> {
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      _ad = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.largeBanner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
      );

      _ad?.load();
    }
    getLoc();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  late LocationData _currentPosition;
  late String _address;
  late GoogleMapController mapController;
  late Marker marker;
  late GoogleMapController _controller;

  Location location = Location();

  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              l.latitude!,
              l.longitude!,
            ),
            zoom: 15,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Container(
        color: Colors.blue[900],
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialcameraposition,
                  zoom: 15,
                ),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            SizedBox(
              height: 3,
            ),
            if (_currentPosition.latitude != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Latitude: ${_currentPosition.latitude}",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            if (_currentPosition.longitude != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Longitude: ${_currentPosition.longitude}",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(
              height: 3,
            ),
            if (_address.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Address: $_address",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

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

    _currentPosition = await location.getLocation();
    _initialcameraposition =
        LatLng(_currentPosition.latitude!, _currentPosition.longitude!);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition =
            LatLng(_currentPosition.latitude!, _currentPosition.longitude!);

        // _getAddress(_currentPosition.latitude!, _currentPosition.longitude!)
        //     .then((value) {
        //   setState(() {
        //     _address = "${value.first.addressLine}";
        //   });
        // });
      });
    });
  }

  // Future<List<Address>> _getAddress(double lat, double lang) async {
  //   final coordinates = new Coordinates(lat, lang);
  //   List<Address> add =
  //       await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   return add;
  // }
}
