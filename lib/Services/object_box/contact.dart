import 'package:objectbox/objectbox.dart';

@Entity()
class Contact {
  @Id()
  int id = 0;

  String uid;
  String username;
  String email;
  bool infected = false;

  // Contact();

  Contact({this.id, this.uid, this.username, this.email, this.infected});
  Contact.withoutId(this.uid, this.username, this.email, this.infected) : id = 0;

  String getInfected() {
    if (infected) {
      return "Infected";
    }
    return "Not Infected";
  }

  toString() => 'username: $username, \nemail: $email, \n$getInfected()';
}
