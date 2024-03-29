# saveWindowsLogonImage

## What is the project for?

The script saves the current Windows logon image to your desktop by calling a bash script on WSL.

## What are the system requirements?

* Windows 10 or 11
* WSL 1 or 2, see also https://learn.microsoft.com/en-us/windows/wsl/install

## How to configure and install it

1. Save the saveWindowsLogonImage.bat to your Windows desktop

2. Click on Start and open your bash on Ubuntu on Windows (resp. any other distro that you have selected during the WSL installation) and make a directory called bin if not done yet and change to that folder
```
mkdir bin && cd $_
```

3. Save the saveWindowsLogonImage.sh to the $HOME/bin folder
```
curl -LOs https://raw.githubusercontent.com/jonelo/saveWindowsLogonImage/master/saveWindowsLogonImage.sh
```

4. Add execute permissions on the script
```
chmod u+x ./saveWindowsLogonImage.sh
```

## How to use it or get it running

### On Windows

Logon on Windows and double click the saveWindowsLogonImage.bat on your desktop. The current Windows logon image will be saved to your desktop.

### On WSL

Logon on Windows and open your bash on Windows, call
```
~/bin/saveWindowsLogonImage.sh
```
and the current Windows logon image will be saved to your desktop.

## Troubleshooting

### Windows Logon Image doesn't change anymore

If the Windows Logon Image doesn't change anymore, you can fix it by the WindowsLogonImageFix.bat that is part of this project.

## The license

The license that the project is offered under is the [Apache 2.0 license](http://choosealicense.com/licenses/apache-2.0/).
