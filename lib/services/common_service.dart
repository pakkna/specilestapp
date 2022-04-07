import 'package:intl/intl.dart';

class CommonService {
  getDate(value) {
    final f = DateFormat('yyyy-MM-dd');
    var d = f.format(value);
    return d;
  }

  getTime(value) {
    final f = DateFormat('hh:mm a');
    var d = f.format(value);
    return d;
  }
}
