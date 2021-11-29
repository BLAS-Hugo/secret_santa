import 'package:party_app/model/event/event_type.dart';
import 'package:random_string/random_string.dart' as random;

class Event {
  late String id;
  late String name;
  late EventType type;
  late DateTime date;
  late DateTime eventDate;

  Event({required String name, required EventType type, required DateTime eventDate}) {
    this.name = name;
    this.type = type;
    this.id = randomId();
    this.date = DateTime.now();
    this.eventDate = eventDate;
  }

  String randomId() {
    return random.randomString(10);
  }
}