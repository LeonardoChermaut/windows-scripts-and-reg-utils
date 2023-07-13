# Windows Photo Viewer Activation Script

This script enables the Windows Photo Viewer in Windows 10 by modifying the Registry settings and setting it as the default app for specific file extensions. By running this script, you can regain access to the classic Windows Photo Viewer for image viewing.

## Prerequisites

- Windows 10 operating system

## Usage

1. Run the script as an administrator:
   - Right-click on the script file.
   - Select "Run as administrator" from the context menu.

2. The script will automatically enable the Windows Photo Viewer and set it as the default app for the following file extensions:
   - .bmp
   - .dib
   - .gif
   - .jfif
   - .jpe
   - .jpeg
   - .jpg
   - .jxr
   - .png

3. Once the script completes, a message will be displayed confirming that Windows Photo Viewer has been enabled.

4. You can now open images with Windows Photo Viewer by double-clicking on them or using the "Open with" option.

## Important Note

- Modifying the Registry settings should be done with caution. Make sure to create a backup of your Registry before running this script.
- This script requires administrative privileges to make changes to the system settings. If prompted, grant the script elevated permissions.

## Troubleshooting

If you encounter any issues or want to revert the changes made by this script, follow these steps:

1. Open the Registry Editor:
   - Press **Win + R** to open the Run dialog.
   - Type `regedit` and press **Enter**.

2. Navigate to the following Registry key:

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations` 


3. Delete the string values associated with the file extensions mentioned above.

4. Open the Settings app, go to **System > Default apps**, and set the desired default app for the file extensions you want to handle differently.

## Disclaimer

- Use this script at your own risk. The author and the organization behind this script are not responsible for any damage or issues that may arise from its usage.

