class User {
  final String? id;
  final String imageUrl;
  final String? name;

  User({
    this.id,
    String? imageUrl,
    this.name,
  }) : imageUrl = imageUrl ??
            'https://eu.ui-avatars.com/api/?name=${name?.split('').join('+')}&size=250';
}
