#!/bin/bash

# Run tests with coverage
flutter test --coverage

# Exclude unwanted files
lcov --remove coverage/lcov.info \
  'lib/core/constants/*' \
  'lib/core/data/models/*' \
  'lib/core/domain/entities/*' \
  'lib/core/error/*' \
  'lib/core/extensions/context_ext.dart' \
  'lib/core/failure/*' \
  'lib/core/usecases/*' \
  'lib/l10n/*' \
  -o coverage/lcov_filtered.info

# Generate HTML report
genhtml coverage/lcov_filtered.info -o coverage/html

# Open report
open coverage/html/index.html
