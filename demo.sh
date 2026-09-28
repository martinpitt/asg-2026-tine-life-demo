view BUCK
tine/bin/tine buck run :duf
view BUCK
tine/bin/tine buck run :demo-vm
#
git checkout main
git show
tine/bin/tine importer import-upstream --sha 6000fbe4244f3b8a684bf9fc8726c28185587497 setup fedora rawhide
tine/bin/tine importer import-upstream acl fedora rawhide

git log upstream-rpm

git log

tine/bin/tine importer import setup
tine/bin/tine importer import acl
tine/bin/tine importer list
tine/bin/tine buck build packages/fedora/rawhide:setup --show-output
ls -l buck-out/v2/art/root/c9a087c801b7839e/packages/fedora/rawhide/__setup__/rpms/
#
tine/bin/tine buck build :demo[sbom][cyclonedx] --out /tmp/sbom.json
view /tmp/sbom.json
#
vi packages/fedora/rawhide/setup/setup.sysusers.conf
tine/bin/tine buck run :demo-vm
git commit -a -m "setup: hack"
tine/bin/tine importer list
#
tine/bin/tine importer update-upstreams
tine/bin/tine importer list
tine/bin/tine importer update-all
git log
tine/bin/tine importer diff setup
