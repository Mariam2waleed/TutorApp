

class Members {
  String id;
  String name;
  String address;
  String urlphoto;
  String pos;

  Members(this.id, this.name, this.address, this.urlphoto, this.pos);
}

List<Members> members = [
  Members('1', "kayla", "Champs-Élysées \nactor,\nparis, france.",
      "Assets/images/kayla.png", "wife"),
  Members('2', "Alex", "sartouville \n teacher ,\nparis, france.",
      "Assets/images/alex.png", "father"),
  Members('3', "Andria", "Saint-Denis \n banker,\nparis, france.",
      "Assets/images/andrea.png", "son"),
  Members('4', "Patrick", "patrickjohn1020 \nInstructor,\nCanada,Toronto.",
      "Assets/images/patrik.png", "uncle")
];
