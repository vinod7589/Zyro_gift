String formatDateString(String inputDate) {
  List<String> parts = inputDate.split(' ');

  List<String> dateParts = parts[0].split('/');
  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  return '$day/$month/$year';
}
