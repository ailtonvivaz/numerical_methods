class MenuItem {
  String name;
  List<MenuItem> subMenu;
  Function onPressed;

  MenuItem({this.name, this.subMenu, this.onPressed});
}
