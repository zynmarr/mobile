import 'package:mita_apps/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool unread;
  final String relation;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
    this.relation,
  });
}

final User currentUser = User(
  id: 0,
  name: 'Current User',
  gender: 'Laki-Laki',
  old: 20,
  jobs: 'App Design',
  imageUrl: 'assets/img/users/user1.jpg',
  online: true,
  verified: true,
  location: 'Indonesia, Aceh, Aceh Besar',
);
final User james = User(
  id: 1,
  name: 'james',
  gender: 'Laki-Laki',
  old: 18,
  about: "Jadilah pribadi yang menantang masa depan, bukan pengecut yang aman di zona nyaman",
  jobs: 'Web Developer',
  imageUrl: 'assets/img/users/user2.jpg',
  online: false,
  verified: true,
  location: 'Indonesa, Medan',
);
final User steven = User(
  id: 2,
  name: 'steven',
  gender: 'Laki-Laki',
  old: 22,
  jobs: 'Universitas Abulyatama',
  imageUrl: 'assets/img/users/user3.jpg',
  online: true,
  verified: true,
  location: 'Indonesia, Jawa barat',
);
final User william = User(
  id: 3,
  name: 'william',
  gender: 'Laki-Laki',
  about: "Bila gagal, ya coba lagi! Sampai kapan? Sampai sukses!",
  old: 19,
  jobs: 'Digital Marketing',
  imageUrl: 'assets/img/users/user4.jpg',
  online: true,
  verified: false,
  location: 'Indonesia, Jakarta, Jakarta Pusat'
);
final User yunul = User(
  id: 4,
  name: 'yunul',
  gender: 'Laki-Laki',
  old: 21,
  about: "Jadilah pribadi yang menantang masa depan, bukan pengecut yang aman di zona nyaman",
  jobs: 'App Developer',
  imageUrl: 'assets/img/users/user5.jpg',
  online: false,
  verified: false,
  location: 'Malaysia, pinang',
);
final User shopia = User(
  id: 5,
  name: 'shopia',
  gender: 'Perempuan',
  old: 18,
  about: "Kegagalan adalah sebuah proses menuju kesuksesan",
  jobs: 'Universitas UIN Raniry',
  imageUrl: 'assets/img/users/user6.jpg',
  online: true,
  verified: true,
  location: 'Amerika Serikat, San Diego'
);

List<User> users = [james,william,shopia,yunul,steven];

List<User> likes = [james,william,shopia,yunul,steven];

List<Message> chats = [
  Message(
    sender: shopia,
    time: '2:30 AM',
    text: 'I like you',
    unread: true,
  ),
  Message(
    sender: yunul,
    time: '5:30 AM',
    text: 'Hey How Are you?',
    unread: true,
  ),
  Message(
    sender: james,
    time: '8:30 AM',
    text: 'Hi',
    unread: false,
  ),
  Message(
    sender: steven,
    time: '22:30 AM',
    text: 'Where You from?',
    unread: false,
  ),
];

List<Message> messages = [
  Message(
    sender: currentUser,
    time: '04.00 PM',
    text: 'Hallo Apa kabar?',
    unread: true,
    relation: 'shopia',
  ),
  Message(
    sender: shopia,
    time: '04.02 PM',
    text: 'Sehat selalu',
    unread: true,
    relation: 'Current User'
  ),
  Message(
    sender: currentUser,
    time: '04.10 PM',
    text: 'Do cillum nisi est ut exercitation dolor duis.',
    unread: true,
    relation: 'shopia',
  ),
  Message(
    sender: shopia,
    time: '04.15 PM',
    text: 'Lagi duduk ajaa',
    unread: true,
    relation: 'Current User'
  ),
  Message(
    sender: shopia,
    time: '04.15 PM',
    text: 'And Youu??',
    unread: true,
    relation: 'Current User'
  ),
  Message(
    sender: currentUser,
    time: '04.10 PM',
    text: 'Jadilah pribadi yang menantang masa depan, bukan pengecut yang aman di zona nyaman',
    unread: false,
    relation: 'shopia',
  ),
];
