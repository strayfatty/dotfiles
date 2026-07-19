#!/usr/bin/env sh

# required package extra/qt6-declarative
find . -type f -name '*.qml' -print0\
    | xargs -0 -r /usr/lib/qt6/bin/qmlformat \
    --inplace \
    --normalize \
    --sort-imports \
    --objects-spacing \
    --single-line-empty-objects
