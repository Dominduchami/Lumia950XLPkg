# WIP EDK2 UEFI Implementation for LG Nexus 5X (based on [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg))

## Support Status
 - EDK2 boots fully!
 - Display works (although the current implementation could probably be improved)

## TODO
 - Adapt ACPI for Nexus 5X (tables are currently mostly unmodified)
 (note : linux dts for bullhead states that it's firmware has no PSCI support)
 - Make USB work in EDK2
 - Fix buttons

## Run

Stock bootloader on Nexus 5X is aarch64, so it's possible to flash uefi to boot or recovery partition and load it as a kernel.
This implementation reuses PrePi from [SurfaceDuoPkg](https://github.com/WOA-Project/SurfaceDuoPkg). The reason for it is that
the stock bootloader loads uefi at the kernel load adress, which isn't really suitable. Surface Duo's PrePi implements relocation
to copy the payload to the right space.

## Windows Notes

Windows Boot Manager boots fine, however booting Windows is unsupported as of now. ACPI tables will have to be adapted to make it possible. It's worth noting also that builds higher than 19041.1 will not boot on the device. The hyp CVE that is used by Lumia950XLPkg to enable booting of newer versions was patched by Google (thanks to Gustave Monce for the information).

## Linux notes

Mainline linux boots with framebuffer working, but kernel panics. Cause is not identified yet.

## Framebuffer notes

The bootloader on Nexus 5X disables refresh, so a function to enable it again had to be implemented

## WSL Build Notes

If you checked out the EDK2 repository under Windows and build it using WSL, you will have trouble locating BaseTools Python classes due to [file case sensitive behavior changes](https://blogs.msdn.microsoft.com/commandline/2018/02/28/per-directory-case-sensitivity-and-wsl/) in WSL. Run the following PowerShell script under EDK2 directory prior to build:

	Get-ChildItem .\BaseTools\ -Directory -Recurse | Foreach-Object { fsutil.exe file setCaseSensitiveInfo $_.FullName }

You only need to run it once.

## Acknowledgements

- [WOA-Project](https://github.com/WOA-Project) for creating Lumia950XLPkg
- Gustave Monce for all the explanation and providing ACPI samples
- Minecrell for explaining how the lk2nd framebuffer refresh code worked
- Imbushuo for all the blog posts about running Windows on ARM 
- [EFIDroid Project](http://efidroid.org)
- Andrei Warkentin and his [RaspberryPiPkg](https://github.com/andreiw/RaspberryPiPkg)
- Sarah Purohit
- [Googulator](https://github.com/Googulator/)

## License

All code except drivers in `GPLDriver` and DT in device-specific directories
are licensed under BSD 2-Clause. GPL Drivers are licensed under GPLv2 license.