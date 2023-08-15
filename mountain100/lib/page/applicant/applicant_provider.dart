import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/data/model/applicant/applicant_model.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

abstract class ApplicantPageProviderInterface {
  setApplicant();
  setSouvState(bool? value);
  setCertState(bool? value);
}

final applicantProvider =
    Provider<ApplicantPageProvider>((ref) => ApplicantPageProvider(ref: ref));
final applicantCheckSouvenirProvider = StateProvider<bool>((ref) => false);
final applicantCheckCertificationProvider = StateProvider<bool>((ref) => false);
final applicantNameTextControllerProvider =
StateProvider<TextEditingController>((ref) => TextEditingController());
final applicantAddressTextControllerProvider =
StateProvider<TextEditingController>((ref) => TextEditingController());
final applicantAddressDetailTextControllerProvider =
StateProvider<TextEditingController>((ref) => TextEditingController());
final applicantTelTextControllerProvider =
StateProvider<TextEditingController>((ref) => TextEditingController(
  text:ref.read(userInfoProvider)!.userInfo.tel,
));

class ApplicantPageProvider with ApplicantPageProviderInterface {
  final ProviderRef ref;

  ApplicantPageProvider({required this.ref});

  @override
  setApplicant() async {
    final applicantSouvenirCheck = await FirebaseFirestore.instance.collection('Souv').doc(ref.read(userInfoProvider)!.userInfo.nickname).get();
    final applicantCertificationCheck = await FirebaseFirestore.instance.collection('Cert').doc(ref.read(userInfoProvider)!.userInfo.nickname).get();
    if (ref.read(applicantCheckSouvenirProvider)) {
      if (applicantSouvenirCheck.data()==null){
        ApplicantSouvenirModel model = ApplicantSouvenirModel(
            name: ref.read(applicantNameTextControllerProvider).text,
            address:
            "${ref.read(applicantAddressTextControllerProvider).text} ${ref.read(applicantAddressDetailTextControllerProvider).text}",
            info: "신청함",
            tel: ref.read(applicantTelTextControllerProvider).text,
            nickname: ref.read(userInfoProvider)!.userInfo.nickname,
            waybill: "");
        await FirebaseFirestore.instance
            .collection('Souv')
            .doc(ref.read(userInfoProvider)!.userInfo.nickname)
            .set(model.toJson());
      }
    }

    if (ref.read(applicantCheckCertificationProvider)) {
      if (applicantCertificationCheck.data()==null){
        ApplicantCertificationModel model = ApplicantCertificationModel(
            nickname: ref.read(userInfoProvider)!.userInfo.nickname,
            name: ref.read(applicantNameTextControllerProvider).text,
            date: DateTime.now(),
            grade: ref.read(userInfoProvider)!.userInfo.rank,
            state: '미완료');
        await FirebaseFirestore.instance
            .collection('Cert')
            .doc(ref.read(userInfoProvider)!.userInfo.nickname)
            .set(model.toJson());
      }
    }

    navigatorKey.currentState!.pop();
  }

  @override
  setCertState(bool? value) {
    ref.read(applicantCheckCertificationProvider.notifier).state=value!;
  }

  @override
  setSouvState(bool? value) {
    ref.read(applicantCheckSouvenirProvider.notifier).state=value!;
  }
}
