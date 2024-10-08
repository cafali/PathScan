![371765341-2c0fd8c9-e659-40e8-87cc-773028b2d379](https://github.com/user-attachments/assets/e39c54d8-1672-4eb5-a6b6-64bfd6764735)

# PathScan

PathScan is a script designed to export information about the contents of directories and hard drives. With a single click, users can create a complete list of all files and paths within a specific folder or across an entire hard drive.

### Key Features:
- **🔍 Scan Drives or Folders:** Quickly get a **FULL LIST** of **ALL FILES** and **FOLDERS** on your PC.
- **📝 File List:** The file paths are saved in a text file in a "PathScan" folder on your Desktop.
- **⚡ Find Any File:** Easily locate **ANY FILE** on your PC in **SECONDS** using the **PathScan File Analyzer**.

![PathScan](https://github.com/user-attachments/assets/687fc754-ee13-4bcf-8491-78380091c350)

```
Note: May differ from the current version
```

# How To Use PathScan

1. Download & copy the PathScan folder to your DESKTOP.
2. Copy PathScan.bat to the folder you want to scan, or start it directly from your Desktop if you are only interested in scanning entire drives.
3. Select a scan option: cd for a current directory scan or C-Z to scan an entire drive.
4. Once the scan is complete, PathScan will notify you that the process is finished.
5. An output file will be generated in the PathScan folder on your Desktop, containing the paths to all files, folders, and subfolders.

**Example of the Output File**
```
MY-PC 2024-09-27 10-15-30
Start Directory: C:\Users\Username\Documents\ExampleFolder

C:\Users\Username\Documents\ExampleFolder\file1.txt
C:\Users\Username\Documents\ExampleFolder\subfolder1
C:\Users\Username\Documents\ExampleFolder\subfolder1\file2.txt
C:\Users\Username\Documents\ExampleFolder\subfolder2
C:\Users\Username\Documents\ExampleFolder\subfolder2\file3.txt
C:\Users\Username\Documents\ExampleFolder\file4.docx
```
# Analyze PathScan Output Files

### Steps to Analyze Output:
1. **Run Script:** Execute PathScan. Select "Analyze Output File" (`an`).
2. **Select Output File:** Enter the name of the `.txt` file generated by a previous directory/hard drive scan.
3. **Enter Keyword:** Input a keyword or file type (pdf, mp4, png, ...) to search within the file paths.
4. **View Results:** The script shows matching paths in real-time and saves them to `export\%keyword%_output_paths.txt`.
5. **Completion:** After analysis, press any key to return to the menu.


# PathScan: Use Cases and Scenarios

The PathScan script can be used in a variety of scenarios, especially where you need to gather information about files and directories on a Windows system. Here are some specific use cases:

### 1. **Backup Preparation**
   - **Backup Planning**: Before performing backups, you can use the script to gather a list of all files and directories that need to be backed up, ensuring that nothing is missed.

### 2. **Troubleshooting and Maintenance**
   - **System Cleanup**: Identify unnecessary files and folders for cleanup by running the script.
   - **Configuration Verification**: Check if specific applications or files are installed correctly by scanning the relevant directories.

### 3. **Development and Testing**
   - **File Structure Verification**: Developers can use the script to verify that a project’s directory structure is as expected, particularly after cloning repositories or deploying applications.
   - **Testing Environments**: In testing scenarios, you can document the state of a directory before and after tests to ensure that tests are not leaving unwanted artifacts behind.

### 4. **Data Migration**
   - **Before Migration**: When migrating data to a new server or storage solution, run the script to generate a complete list of files and directories that will be moved.
   - **Post-Migration Verification**: After migration, use the script again to verify that all intended files and directories have been successfully transferred.

### 5. **Forensic Analysis**
   - **Data Recovery**: In forensic scenarios, you can use the script to list files and folders on a system before and after data recovery efforts, helping to identify what has been restored.
   - **Investigating Anomalies**: If there are suspicious files or directories, the script can help document the structure and contents for further analysis.
