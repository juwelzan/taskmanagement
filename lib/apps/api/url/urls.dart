// ignore_for_file: non_constant_identifier_names

class Urls {
  static String baseUrl = "http://35.73.30.144:2005/api/v1";
  static String RegistrationUrl() => "$baseUrl/Registration";
  static String LoginUrl() => "$baseUrl/Login";
  static String NewTaskGetUrl() => "$baseUrl/listTaskByStatus/New";
  static String ProgressTaskGetUrl() => "$baseUrl/listTaskByStatus/Progress";
  static String CompletedTaskGetUrl() => "$baseUrl/listTaskByStatus/Completed";
  static String CanceledTaskGetUrl() => "$baseUrl/listTaskByStatus/Canceled";
  static String DeleteTaskUrl(String taskId) => "$baseUrl/deleteTask/$taskId";
  static String AddNewTaskUrl() => "$baseUrl/createTask";
  static String ProfileUpdateUrl() => "$baseUrl/ProfileUpdate";
  static String ProfileDetailsUrl() => "$baseUrl/ProfileDetails";
  static String UpdateTaskStatusUrl({
    required String taskID,
    required String status,
  }) => "$baseUrl/updateTaskStatus/$taskID/$status";
  static String EmaiOTPSendUrl(String email) =>
      "$baseUrl/RecoverVerifyEmail/$email";
  static String OTPVerifyUrl(String email, otp) =>
      "$baseUrl/RecoverVerifyOtp/$email/$otp";
  static String ResetPasswordyUrl() => "$baseUrl/RecoverResetPassword";
}
