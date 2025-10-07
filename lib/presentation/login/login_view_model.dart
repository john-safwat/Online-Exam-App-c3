import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

class LoginViewModel extends Cubit<LoginViewStates> {
  LoginViewModel() : super(LoginViewStates());

  Future<void> getUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    emit(state.copyWith(locationData: locationData));
  }


  void getLocationUpdates()async{
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.changeSettings(accuracy: LocationAccuracy.high , interval: 1000 , distanceFilter: 10);

    location.onLocationChanged.listen((locationData){
      // todo upload this to firebase
      emit(state.copyWith(locationData: locationData));
    });

  }
}

class LoginViewStates {
  LocationData? locationData;

  LoginViewStates({this.locationData});

  LoginViewStates copyWith({LocationData? locationData}) {
    return LoginViewStates(locationData: locationData ?? this.locationData);
  }
}
