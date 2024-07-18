# ova2qcow2

Just a simple bash script to convert .vmdk image files inside a .ova file into .qcow image files suitable for use with UTM or QEMU.

Thanks to the folks in this discussion for explaining how to do this: https://github.com/utmapp/UTM/discussions/2521

## How to run a .ova VM in [UTM]

- Convert the .ova to .qcow images: `ova2qcow2.sh file.ova`
- Create a new UTM VM
  - Choose "Emulate" if running on Apple Silicon
  - Choose "(Custom) Other"
- Once the VM is created, edit it
  - Under QEMU, uncheck "UEFI Boot"
  - Under Drives, choose "New..."
  - Import the converted .qcow file(s)
  - Drag the .qcow drives in the correct order, before any other drives
  - Save and run your VM


[UTM]: https://mac.getutm.app
