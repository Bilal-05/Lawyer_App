import 'dart:developer';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserService extends BaseViewModel {
  String? fullName;
  String? uid;
  String? email;
  String? phoneNumber;
  String? photoUrl;
  String? userType;
  String? cnicNumber;
  String? cnicFrontUrl;
  String? cincBackUrl;
  String? barCardFrontUrl;
  String? barCardBackUrl;
  String? designation;
  String? bio;
  String? institution;
  String? degree;
  String? degreeYear;
  String? experience;
  String? availabileFrom;
  String? availabileTill;
  String? startTime;
  String? endTime;
  String? hourlyRate;
  List practiceArea = [];
  String? address;
  String? freeConsultation;
  String? whatsAppNumber;
  String? noOfCases;
  String? noOfWins;
  String? rating;
  bool? firstLogin;
  String? fname;
  String? lname;
  Map<String, dynamic> userData = {};
  String? front;
  String? back;
  String? backNetworkUrl;
  String? frontNetworkUrl;
  String? barFrontNetworkUrl;
  String? barBackNetworkUrl;
  String? profilePhoto;
  String? profilePhotoNetworkUrl;

  final snackbarService = locator<SnackbarService>();
  CollectionReference clients =
      FirebaseFirestore.instance.collection('clients');
  CollectionReference lawyers =
      FirebaseFirestore.instance.collection('lawyers');

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Future<void> addType(usertype) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   return usersType
  //       .doc(user!.uid.toString())
  //       .set(
  //         {
  //           'userType': usertype,
  //         },
  //       )
  //       .then(
  //         (value) => log("User Type Added"),
  //       )
  //       .catchError(
  //         (error) {
  //           snackbarService.showSnackbar(
  //             message: error,
  //             title: 'Error',
  //             duration: const Duration(seconds: 2),
  //           );
  //         },
  //       );
  // }

  Future<void> addClientinUser(loginProvided) async {
    final user = FirebaseAuth.instance.currentUser;
    log('inside');
    // Call the user's CollectionReference to add a new user
    return users
        .doc(user!.uid.toString())
        .set(
          {
            'phoneNumber': phoneNumber,
            'uid': user.uid.toString(),
            'fullName': fullName,
            'cnicNumber': cnicNumber,
            'cnicFrontUrl': cnicFrontUrl,
            'cincBackUrl': cincBackUrl,
            'firstLogin': loginProvided,
            'userType': userType,
            'fname': fname,
            "lname": lname,
            'email': email,
            'frontNetworkUrl': frontNetworkUrl,
            'backNetworkUrl': backNetworkUrl,
            'profilePhoto': profilePhoto,
            'profilePhotoNetworkUrl': profilePhotoNetworkUrl,
          },
        )
        .then(
          (value) => log("Client Added"),
        )
        .catchError(
          (error) {
            snackbarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  Future<void> addClientinClient(loginProvided) async {
    final user = FirebaseAuth.instance.currentUser;
    log('inside');
    // Call the user's CollectionReference to add a new user
    return clients
        .doc(user!.uid.toString())
        .set(
          {
            'phoneNumber': phoneNumber,
            'uid': user.uid.toString(),
            'fullName': fullName,
            'cnicNumber': cnicNumber,
            'cnicFrontUrl': cnicFrontUrl,
            'cincBackUrl': cincBackUrl,
            'firstLogin': loginProvided,
            'userType': userType,
            'fname': fname,
            "lname": lname,
            'email': email,
            'frontNetworkUrl': frontNetworkUrl,
            'backNetworkUrl': backNetworkUrl,
            'profilePhoto': profilePhoto,
            'profilePhotoNetworkUrl': profilePhotoNetworkUrl,
          },
        )
        .then(
          (value) => log("Client Added"),
        )
        .catchError(
          (error) {
            snackbarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  Future<void> addLawyerinUser(firstloginProvided) async {
    final user = FirebaseAuth.instance.currentUser;
    log('inside');
    // Call the user's CollectionReference to add a new user
    return users
        .doc(user!.uid.toString())
        .set(
          {
            'phoneNumber': phoneNumber,
            'email': email,
            "userType": userType,
            'fullName': fullName,
            'uid': user.uid.toString(),
            'designation': designation,
            'bio': bio,
            'institution': institution,
            'degree': degree,
            'degreeYear': degreeYear,
            'practiceArea': practiceArea,
            'experience': experience,
            'availabileFrom': availabileFrom,
            'availabileTill': availabileTill,
            'startTime': startTime,
            'endTime': endTime,
            'hourlyRate': hourlyRate,
            'address': address,
            'freeConsultation': freeConsultation,
            'whatsAppNumber': whatsAppNumber,
            'noOfCases': noOfCases,
            'noOfWins': noOfWins,
            'rating': rating,
            'barFrontUrl': barCardFrontUrl,
            'barBackUrl': barCardBackUrl,
            'firstLogin': firstloginProvided,
            'frontNetworkUrl': barFrontNetworkUrl,
            'backNetworkUrl': barBackNetworkUrl,
            'profilePhoto': profilePhoto,
            'profilePhotoNetworkUrl': profilePhotoNetworkUrl,
          },
        )
        .then(
          (value) => log("Lawyer Added"),
        )
        .catchError(
          (error) {
            snackbarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  Future<void> addLawyerinLawyer(firstloginProvided) async {
    final user = FirebaseAuth.instance.currentUser;
    log('inside');
    // Call the user's CollectionReference to add a new user
    return lawyers
        .doc(user!.uid.toString())
        .set(
          {
            'phoneNumber': phoneNumber,
            'email': email,
            "userType": userType,
            'fullName': fullName,
            'uid': user.uid.toString(),
            'designation': designation,
            'bio': bio,
            'institution': institution,
            'degree': degree,
            'degreeYear': degreeYear,
            'practiceArea': practiceArea,
            'experience': experience,
            'availabileFrom': availabileFrom,
            'availabileTill': availabileTill,
            'startTime': startTime,
            'endTime': endTime,
            'hourlyRate': hourlyRate,
            'address': address,
            'freeConsultation': freeConsultation,
            'whatsAppNumber': whatsAppNumber,
            'noOfCases': noOfCases,
            'noOfWins': noOfWins,
            'rating': rating,
            'barFrontUrl': barCardFrontUrl,
            'barBackUrl': barCardBackUrl,
            'firstLogin': firstloginProvided,
            'barFrontNetworkUrl': barFrontNetworkUrl,
            'barBackNetworkUrl': barBackNetworkUrl,
            'profilePhoto': profilePhoto,
            'profilePhotoNetworkUrl': profilePhotoNetworkUrl,
          },
        )
        .then(
          (value) => log("Lawyer Added"),
        )
        .catchError(
          (error) {
            snackbarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  // Future<void> getClients() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   // log('inside');
  //   // // Call the user's CollectionReference to add a new user
  //   // return clients
  //   //     .doc(user!.uid.toString())
  //   //     .get()
  //   //     .then(
  //   //       (value) => log("Got data"),
  //   //     )
  //   //     .catchError(
  //   //   (error) {
  //   //     snackbarService.showSnackbar(
  //   //       message: error,
  //   //       title: 'Error',
  //   //       duration: const Duration(seconds: 2),
  //   //     );
  //   //   },
  //   // );
  //   return clients
  //       .doc(user!.uid.toString())
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       log('Document data: ${documentSnapshot.data()}');
  //     } else {
  //       log('Document does not exist on the database');
  //     }
  //   });
  // }
}
