# Autodesk License Patcher

The contents in this repo were downloaded from AppNee with the `exe` files extracted using 7z.

The following description was taken from [`notes.txt`](./notes.txt) then processed and clarified through CodeQwen.

---

**Description:**
Autodesk License Patcher is a universal tool for patching all Autodesk products. It automates the NLM method and is open-sourced.

**Features:**
- Places and replaces necessary files.
- Edits hostname and MAC address in the license file.
- Creates a task to start licensing services at boot.
- Blocks internet traffic to Autodesk licensing files.
- Restarts licensing services in the correct way.
- Starts Network License Manager (NLM).

## How To Use:

1. **Download and Install an Autodesk Product:**
   - Download and install any Autodesk product you wish to use.

2. **Run "Autodesk License Patcher" with Administrator Rights and UAC Disabled:**
   - Run the tool with administrative privileges.
   - Disable User Account Control (UAC) if prompted or pause security if the patcher is blocked.

3. **Launch Any Installed Autodesk Product:**
   - When prompted, select "Use A Network License."

## Notes:

1. **Relaunching the Tool:**
   - If you relaunch the tool, it will first uninstall the previous version and then reinstall for a fresh installation.

2. **Uninstallation:**
   - To uninstall and revert all changes made by the tool, launch "Autodesk License Patcher Uninstaller."

3. **Compatibility:**
   - Supports any Autodesk product with ADSK licensing.

4. **Boot Process:**
   - At every boot, an automatic service starts and refreshes the ADSKService + NLM to fix any possible issue.
   - This process takes 7-10 seconds, so wait 10 seconds before running any Autodesk application.

5. **Environment Support:**
   - The patch will work in online, offline, virtual, or real environments.

6. **Product Installation Issues:**
   - If you cannot install or uninstall products, first use the "Autodesk License Patcher Uninstaller."

## Bonus Features:

1. **Internet Connection Control:**
   - Allows you to block or unblock internet traffic to Autodesk products using Windows Firewall.
  
2. **Bloatware Cleanup:**
   - Cleans up genuine service, access service, single sign-on component, network license manager, identity manager, and digital signature icons.
   - Blocks these software from running.

**Note:** Apply the cleanup process before installing the Autodesk License Patcher.

## Warning:

This tool is an automated repack intended for research purposes only! **DO NOT USE IT FOR PIRACY!** Always support developers by purchasing products you like or use.