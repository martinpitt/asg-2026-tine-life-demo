load("@tine//box:defs.bzl", "box")
load("@tine//git:defs.bzl", "git")
load("@tine//go:defs.bzl", "go")
load("@tine//image:defs.bzl", "image")

# Build environment for our Go projects; never reaches the image
box.new(
    name = "go.box",
    packages = ["golang"],
    release = "tine//catalog:fedora.rawhide.release",
)

# A pinned external Go project
git.fetch(
    name = "duf.git",
    repo = "https://github.com/muesli/duf",
    rev = "4636deb4a7b707a9f04c602db033f9837e50b3f6",
)

go.package(
    name = "duf",
    box = ":go.box",
    src = ":duf.git",
)

image.bootable_disk(
    name = "demo",
    package_manager = "tine//catalog:fedora.rawhide.package-manager",
    definitions = image.DEFAULT_USR_VERITY_PARTITIONS,
    version = "0.0.0",
    package_sets = ["bootable"],
    packages = ["bash", "setup"],
    ops = [
        image.copy(":duf[duf]", "/usr/bin/duf"),
    ],
)

image.vm(
    name = "demo-vm",
    autologin = "root",
    # re-using tine's rawhide box which has all of QEMU etc. installed
    box = "tine//catalog:fedora.rawhide.box",
    image = ":demo",
    credentials = {
        "firstboot.timezone": "UTC",
    }
)
