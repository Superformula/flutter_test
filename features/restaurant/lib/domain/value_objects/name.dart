class Name {
  final String fullName;
  final String initials;

  Name(this.fullName) : initials = _extractInitials(fullName);

  static String _extractInitials(String name) {
    // Dividindo o nome completo em partes
    final parts = name.split(' ');

    // Capturando as iniciais do primeiro e segundo nome, se existirem
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    } else {
      return '';
    }
  }
}
