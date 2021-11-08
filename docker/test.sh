#!/bin/bash

set -eo pipefail

flutter packages get
flutter test --update-goldens
