import '/screen/get_started.dart';
import 'package:design/screen/home/home_page.dart';
import 'package:design/screen/home/patient_prescription_records.dart';
import 'package:design/screen/others_screen/medicine/add_new_medicine.dart';
import 'package:design/screen/others_screen/doctor_note_for_pcp/create_a_pcp_note.dart';
import 'package:design/screen/others_screen/lab_report/lab_report_image.dart';
import 'package:design/screen/others_screen/lab_report/lab_report.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/screen/others_screen/order_lab/order_labs_two.dart';
import 'package:design/screen/others_screen/provisional_diagnosis/give_a_diagnosis.dart';
import 'package:design/screen/others_screen/specialist_assessment/create_a_assessment.dart';
import 'package:design/screen/patient/patient_details.dart';
import 'package:design/screen/others_screen/drug_interaction.dart';
import 'package:design/screen/patient/patient_list.dart';
import 'package:design/screen/patient/patient_prescription.dart';
import 'package:design/screen/patient_datas/pcp_notes_one.dart';
import 'package:design/screen/others_screen/medicine/stop_old_medicine.dart';
import 'package:design/services/auto_log_in_service.dart';
import 'package:design/services/change_password_service.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/delete_pcp_note_service.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/doctor_note_create_service.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/given_pcp_note_list_serice.dart';
import 'package:design/services/doctor_note_for_pcp_service.dart/update_pcp_note_service.dart';
import 'package:design/services/get_full_prescription_data_service.dart';
import 'package:design/services/medicine_service/drug_interaction_service.dart';
import 'package:design/services/forgot_password_service.dart';
import 'package:design/services/lab_report_service.dart';
import 'package:design/services/order_lab_service/given_test_list_service.dart';
import 'package:design/services/order_lab_service/all_order_lab_report_name_service.dart';
import 'package:design/services/medicine_service/medicine_status_service.dart';
import 'package:design/services/prescription_submit_service.dart';
import 'package:design/services/profile_update_service.dart';
import 'package:design/services/provisinal_diagnosis_services/dafault_name_list_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_create_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_delete_by_id_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_list_by_patient_id_service.dart';
import 'package:design/services/provisinal_diagnosis_services/diagnosis_update_service.dart';
import 'package:design/services/specialist_assessment_service/assessment_create_service.dart';
import 'package:design/services/specialist_assessment_service/assessment_delete_service.dart';
import 'package:design/services/specialist_assessment_service/assessment_update_service.dart';
import 'package:design/services/specialist_assessment_service/given_assessment_list_service.dart';
import 'package:design/services/order_lab_service/store_order_lab_test_service.dart';
import 'package:design/services/order_lab_service/update_order_lab_test_service.dart';
import 'package:design/services/order_lab_service/delete_order_lab_service.dart';
import 'package:design/services/medicine_service/medicine_entry_service.dart';
import 'package:design/services/login_service.dart';
import 'package:design/services/medicine_service/medicine_list_service.dart';
import 'package:design/services/patient_details_service.dart';
import 'package:design/services/pcp_notes_list_service.dart';
import 'package:design/services/signup_service.dart';
import 'package:design/services/update_forgotten_password_service.dart';
import 'package:design/services/visit_records_service.dart';
import 'package:design/services/visit_start_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/schedule_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginService()),
          ChangeNotifierProvider(create: (_) => SignupService()),
          ChangeNotifierProvider(create: (_) => ForgotPasswordService()),
          ChangeNotifierProvider(
              create: (_) => UpdateForgottenPasswordService()),
          ChangeNotifierProvider(create: (_) => PatientDetailsService()),
          ChangeNotifierProvider(create: (_) => LabReportService()),
          ChangeNotifierProvider(create: (_) => DrugInteractionService()),
          ChangeNotifierProvider(create: (_) => MedicineListService()),
          ChangeNotifierProvider(create: (_) => PcpNotestListService()),
          ChangeNotifierProvider(create: (_) => GivenTestListService()),
          ChangeNotifierProvider(create: (_) => AllLabReportNameService()),
          ChangeNotifierProvider(create: (_) => StoreOrderLabTestService()),
          ChangeNotifierProvider(create: (_) => UpdateOrderLabTestService()),
          ChangeNotifierProvider(create: (_) => DeleteOrderLabService()),
          ChangeNotifierProvider(create: (_) => MedicineEntryService()),
          ChangeNotifierProvider(create: (_) => ScheduleService()),
          ChangeNotifierProvider(create: (_) => ProfileUpdateService()),
          ChangeNotifierProvider(create: (_) => DefaultNameListService()),
          ChangeNotifierProvider(create: (_) => DiagnosisCreateService()),
          ChangeNotifierProvider(
              create: (_) => DiagnosisListByPatientIdService()),
          ChangeNotifierProvider(create: (_) => DiagnosisUpdateService()),
          ChangeNotifierProvider(create: (_) => DiagnosisDeleteByIdService()),
          ChangeNotifierProvider(create: (_) => ChangePasswordService()),
          ChangeNotifierProvider(create: (_) => MedicineStatusService()),
          ChangeNotifierProvider(create: (_) => AssessmentCreateService()),
          ChangeNotifierProvider(create: (_) => GivenAssessmentListService()),
          ChangeNotifierProvider(create: (_) => AssessmentDeleteService()),
          ChangeNotifierProvider(create: (_) => AssessmentUpdateService()),
          ChangeNotifierProvider(create: (_) => DoctorNoteCreateService()),
          ChangeNotifierProvider(create: (_) => GivenPcpNoteListService()),
          ChangeNotifierProvider(create: (_) => DeletePcpNoteService()),
          ChangeNotifierProvider(create: (_) => UpdatePcpNoteService()),
          ChangeNotifierProvider(create: (_) => AutoLogInService()),
          ChangeNotifierProvider(create: (_) => VisitStratService()),
          ChangeNotifierProvider(
              create: (_) => GetFullPrescriptionDataService()),
          ChangeNotifierProvider(create: (_) => PrescriptionSubmitService()),
          ChangeNotifierProvider(create: (_) => VisitRecordsService()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              //PcpNotesOne(),
              //  PatientList(),
              //HomePage(),
              // SpecialistAssessment(),
              //  DrugInteraction(),
              GetStarted(),
          // AddNewMedicine(),
          // OrderLabs(),
          //  PatientDetails(),
          // ProfileUpdate(),
          routes: {
            GiveATestTwo.routeName: (ctx) => const GiveATestTwo(),
            PatientDetails.routeName: (ctx) => const PatientDetails(),
            GiveADiagnosis.routeName: (ctx) => const GiveADiagnosis(),
            CreateAAssessment.routeName: (ctx) => const CreateAAssessment(),
            CreateAPcpNote.routeName: (ctx) => const CreateAPcpNote(),
            LabReportImage.routeName: (ctx) => const LabReportImage(),
            PatientPrescription.routeName: (ctx) => const PatientPrescription(),
            PatientPrescriptionRecords.routeName: (ctx) =>
                const PatientPrescriptionRecords(),
          },
        ));
  }
}
//flutter_phone_direct_caller: ^2.1.0
//url_launcher: ^6.0.20
// <queries>
//   <!-- If your app makes calls -->
//   <intent>
//     <action android:name="android.intent.action.DIAL" />
//     <data android:scheme="tel" />
//   </intent>
// </queries>  