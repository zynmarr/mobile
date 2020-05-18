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
  old: 20,
  imageUrl: 'assets/img/users/user1.jpg',
  online: true,
);
final User james = User(
  id: 1,
  name: 'james',
  old: 18,
  imageUrl: 'assets/img/users/user2.jpg',
  online: false,
);
final User steven = User(
  id: 2,
  name: 'steven',
  old: 22,
  imageUrl: 'assets/img/users/user3.jpg',
  online: true,
);
final User william = User(
  id: 3,
  name: 'william',
  old: 19,
  imageUrl: 'assets/img/users/user4.jpg',
  online: true,
);
final User yunul = User(
  id: 4,
  name: 'yunul',
  old: 21,
  imageUrl: 'assets/img/users/user5.jpg',
  online: false,
);
final User shopia = User(
  id: 5,
  name: 'shopia',
  old: 18,
  imageUrl: 'assets/img/users/user6.jpg',
  online: true,
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
    text: 'Lagi Ngapain?',
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
];
