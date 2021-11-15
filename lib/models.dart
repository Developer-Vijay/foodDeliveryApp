class ChatModel {
  var name;
  var subtitle;
  var timing;
  int id;

  ChatModel({this.name,this.id, this.subtitle, this.timing});
}

List<ChatModel> chat = [
  ChatModel(
    name: "Sumit",
    id: 1,
    subtitle: "Hi Vijay",
    timing: "10:20 AM",
  ),
  ChatModel(
    name: "Shivam",
    id: 2,
    subtitle: "Hi Vijay",
    timing: "10:00 AM",
  ),
  ChatModel(
    name: "Satyam",
    subtitle: "Hi Vijay",
    id: 3,
    timing: "11:00 AM",
  ),
  ChatModel(
    name: "Prakash",
    subtitle: "Hi Vijay",
    id: 4,
    timing: "11:30 AM",
  ),
];
