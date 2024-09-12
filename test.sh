fvm flutter test --coverage
remove_from_coverage -f coverage/lcov.info -r '\.g\.dart$'
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html