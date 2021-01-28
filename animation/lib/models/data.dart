class Item {
  String title;
  String imageurl;

  Item({this.title, this.imageurl});
}

class AllItems {
  List<Item> _userList = [
    Item(title: 'Bangladesh', imageurl: 'images/first.jpg'),
    Item(title: 'Pakisthan', imageurl: 'images/second.jpg'),
    Item(title: 'India', imageurl: 'images/third.jpg'),
    Item(title: 'Indoneshia', imageurl: 'images/fourth.jpg'),
    Item(title: 'Afganisthan', imageurl: 'images/fifth.jpg'),
  ];

  List<Item> get getUserList {
    return [..._userList];
  }
}
