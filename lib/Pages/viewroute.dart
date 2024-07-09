// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../Components/NetworkHelper.dart';
// import 'home.dart';
//
//
//
// class ViewRoute extends StatefulWidget {
//   double? startLat;
//     double? startLng;
//     double? endLat;
//     double? endLng;
//
//     double? pslat;
//     double? pslng;
//     double? ptlat;
//     double? ptlng;
//    ViewRoute({super.key, this.startLat, this.startLng, this.endLat, this.endLng, this.pslat, this.pslng, this.ptlat, this.ptlng});
//
//
//   @override
//   State<ViewRoute> createState() => _ViewRouteState();
// }
//
//
//
// class _ViewRouteState extends State<ViewRoute> {
// @override
//   void initState() {
//     super.initState();
//     setMarkers();
//     getJsonData();
//     getJsonDatap();
//
//   }
//
//     setPolyLines() {
//     Polyline polyline = Polyline(
//       polylineId: PolylineId("polyline"),
//       color: Color.fromARGB(183, 0, 90, 200),
//       points: polyPoints,
//       width: 5,
//     );
//     polyLines.add(polyline);
//     setState(() {});
//   }
//
//   setPolyLinep() {
//     Polyline polyline = Polyline(
//       polylineId: PolylineId("polylinep"),
//       color: Color.fromARGB(136, 0, 200, 50),
//       points: polyPointp,
//       width: 5,
//     );
//     polyLines.add(polyline);
//     setState(() {});
//   }
//
//  final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
//  final List<LatLng> polyPointp = [];
//   final Set<Polyline> polyLines = {}; // For holding instance of Polyline
//   final Set<Marker> markers = {};
//   CameraPosition _kGoogle = CameraPosition(
// 	target: LatLng(7.8731, 80.7718),
// 	zoom: 8,
// );
//   GoogleMapController? mapController;
//     setMarkers() {
//
//     markers.add(
//       Marker(
//         markerId: MarkerId("1"),
//         position: LatLng(widget.startLat!, widget.startLng!),
//         infoWindow: InfoWindow(
//           title: "start location",
//           snippet: "start location",
//         ),
//       ),
//     );
//
//     markers.add(Marker(
//         markerId: MarkerId('2'),
//         position: LatLng(widget.endLat!, widget.endLng!),
//         infoWindow: InfoWindow(
//           title: "end location",
//           snippet: "destination",
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
//
//          markers.add(Marker(
//         markerId: MarkerId('3'),
//         position: LatLng(widget.pslat!, widget.pslng!),
//         infoWindow: InfoWindow(
//           title: "end location",
//           snippet: "destination",
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)));
//
//          markers.add(Marker(
//         markerId: MarkerId('4'),
//         position: LatLng(widget.ptlat!, widget.ptlng!),
//         infoWindow: InfoWindow(
//           title: "end location",
//           snippet: "destination",
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)));
//
//   }
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     setMarkers();
//   }
//   var dat;
//   void getJsonData() async {
//     // Create an instance of Class NetworkHelper which uses http package
//     // for requesting data to the server and receiving response as JSON format
//
//     NetworkHelper network = NetworkHelper(
//       startLat: widget.startLat!,
//       startLng: widget.startLng!,
//       endLat: widget.endLat!,
//       endLng: widget.endLng!,
//
//     );
//
//     try {
//       // getData() returns a json Decoded data
//       dat = await network.getData();
//
//       // We can reach to our desired JSON data manually as following
//       LineString ls = LineString(dat['features'][0]['geometry']['coordinates']);
//
//       for (int i = 0; i < ls.lineString.length; i++) {
//         polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
//       }
//
//       if (polyPoints.length == ls.lineString.length) {
//         setPolyLines();
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
// void getJsonDatap() async {
//     // Create an instance of Class NetworkHelper which uses http package
//     // for requesting data to the server and receiving response as JSON format
//
//     NetworkHelper network = NetworkHelper(
//       startLat: widget.pslat!,
//       startLng: widget.pslng!,
//       endLat: widget.ptlat!,
//       endLng: widget.ptlng!,
//
//     );
//
//     try {
//       // getData() returns a json Decoded data
//       dat = await network.getData();
//
//       // We can reach to our desired JSON data manually as following
//       LineString ls = LineString(dat['features'][0]['geometry']['coordinates']);
//
//       for (int i = 0; i < ls.lineString.length; i++) {
//         polyPointp.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
//       }
//
//       if (polyPointp.length == ls.lineString.length) {
//         setPolyLinep();
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//       body: Stack(
//         children: [
//            GoogleMap(
//           initialCameraPosition: _kGoogle,
//           //   mapType: MapType.terrain,
//           onMapCreated: _onMapCreated,
//           // markers: markers,
//           polylines: polyLines,
//           //  onMapCreated: (controller) => onMapCreated(controller),
//           markers: Set.from(markers),
//           // polylines: Set<Polyline>.of(polylines.values),
//           compassEnabled: true,
//           myLocationEnabled: true,
//           //    zoomGesturesEnabled: true,
//         ),
//           Container(
//     alignment: Alignment.topCenter,
//     child: Container(
//       height: 120,
//       width: MediaQuery.of(context).size.width,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [
//                       Colors.red,
//                       Colors.orange,
//                     ],
//                   ),
//         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50 ),bottomRight: Radius.circular(50)),
//       ),
//       child:    Stack(
//         children: [
//           Positioned(
//             top: 30,
//             left: 15,
//             child: Container(
//             margin: const EdgeInsets.only(top: 20,left: 10),
//             child: IconButton(
//             color: Colors.black,
//             icon: const Icon(Icons.arrow_back_ios , color: Colors.white,),
//             iconSize: 20,
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ),),
//              Container(
//                         margin: const EdgeInsets.only(bottom: 20),
//           alignment: Alignment.bottomCenter,
//                        child: const Text("Route",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
//                       ),
//
//         ])
//
//
//     )
//    ),
//
//         ],
//
//       ),
//     );
//   }
// }