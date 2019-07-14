#Copyright 2019 Andrei Khodko
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License

#!/bin/sh

./notifyThenKill.sh $(basename -- "$0") $$

FILEPATH=$(./etc/trik/log_manager.sh --all)
SIZE=$(expr length "$FILEPATH")

cp -fLr $FILEPATH ../

cat << EOF
HTTP/1.1 201 Modified
Connection: close
Content-Type: text/plain, charset=us-ascii
Content-length: ${SIZE}

EOF

echo "$FILEPATH"

