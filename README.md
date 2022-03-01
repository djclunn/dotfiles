# dotfiles

personal configuration files and software install script

## Instructions

For setting up a new machine, clone the dotfiles repo and put in C:\code.
Open dotfiles directory.
Open a powershell as administrator and type ./start_windows.ps1.

last time wsl --install command got error

## Windows

Right click start menu. Click Windows PowerShell (Admin)
--- OR ---
In dotfile directory, click File->Powershell->Admin

Select start of line, hit shift and then END then CTRL-C:
'''
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
'''
Paste into powershell and press enter.

### Installs

choco install googlechrome -y
choco install firefox -y
choco install notepadplusplus -y
choco install 7zip -y
choco install python -y
choco install vscode -y
choco install vim -y
choco install everything -y
choco install windirstat -y
choco install github-desktop -y
choco install pycharm-community -y
choco install obsidian -y
choco install git -y --params="'/NoShellIntegration'"
choco install irfanview-she
# no option to remove context menus for vlc in chocolatey
# portable vlc installed in C:\ProgramData\chocolatey\bin\vlc.exe
choco install vlc.portable -yllextension -y
# work associated apps
choco install slack -y
choco install imagej -y
choco install vnc-viewer -y
choco install winscp -y
# irfanview, irfanview-shellextension
