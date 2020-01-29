!#/bin/bash

cp caput.sh caputIO.sh
sed -i 's/XF:11BMB-ES/XF:11IDB-ES/g' caputIO.sh
cp caputIO.sh dbpfIO.sh
sed -i 's/dbpf/caput/g' caputIO.sh

