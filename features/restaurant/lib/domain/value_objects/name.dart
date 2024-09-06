class Name {
  final String fullName;
  final String initials;

  Name._(this.fullName) : initials = _extractInitials(fullName);

  factory Name.fromFullName(String fullName) {
    return Name._(fullName);
  }

  static String _extractInitials(String name) {
    if (name.isEmpty) {
      return name;
    }
    final parts = name.split(' ');

    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    } else {
      return '';
    }
  }
}
