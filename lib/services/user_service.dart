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
  String? practiceArea;
  String? address;
  String? freeConsultation;
  String? whatsAppNumber;
  String? noOfCases;
  String? noOfWins;
  String? rating;
  bool? firstLogin;
  String? fname;
  String? lname;

  final snackbarService = locator<SnackbarService>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addClient(firstLogin) async {
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
            'firstLogin': firstLogin,
            'userType': userType,
            'fname': fname,
            "lname": lname,
            'email': email,
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

  Future<void> addLawyer(firstlogin) async {
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
            'firstLogin': firstLogin,
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
