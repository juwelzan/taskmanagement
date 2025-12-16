// ignore_for_file: non_constant_identifier_names

class Urls {
  static String baseUrl = "https://task.teamrabbil.com/api/v1";
  static String RegistrationUrl() => "$baseUrl/registration";
  static String LoginUrl() => "$baseUrl/login";
  static String NewTaskGetUrl() => "$baseUrl/listTaskByStatus/New";
  static String ProgressTaskGetUrl() => "$baseUrl/listTaskByStatus/Progress";
  static String CompletedTaskGetUrl() => "$baseUrl/listTaskByStatus/Completed";
  static String CanceledTaskGetUrl() => "$baseUrl/listTaskByStatus/Canceled";
  static String DeleteTaskUrl(String taskId) => "$baseUrl/deleteTask/$taskId";
}
