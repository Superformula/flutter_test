import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/domain/value_objects/name.dart';

void main() {
  group('Name Value Object', () {
    test(
        'Given a full name, when the Name object is created, then it should store the full name and generate correct initials',
        () {
      final name = Name.fromFullName('John Doe');

      expect(name.fullName, 'John Doe');
      expect(name.initials, 'JD');
    });

    test(
        'Given a single name, when the Name object is created, then it should store the full name and use only the first initial',
        () {
      final name = Name.fromFullName('John');

      expect(name.fullName, 'John');
      expect(name.initials, 'J');
    });

    test(
        'Given a name with more than two parts, when the Name object is created, then it should store the full name and take only the first and second parts for initials',
        () {
      final name = Name.fromFullName('Alice Mary Johnson');

      expect(name.fullName, 'Alice Mary Johnson');
      expect(name.initials, 'AM');
    });

    test(
        'Given an empty name, when the Name object is created, then it should store an empty full name and return empty initials',
        () {
      final name = Name.fromFullName('');

      expect(name.fullName, '');
      expect(name.initials, '');
    });
  });
}
