Set WshShell = CreateObject("WScript.Shell")
strDesktop = WshShell.SpecialFolders("Desktop")
Set oShortcut = WshShell.CreateShortcut(strDesktop & "\MeTube Desktop.lnk")
strScriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
oShortcut.TargetPath = strScriptDir & "\run.bat"
oShortcut.WorkingDirectory = strScriptDir
oShortcut.WindowStyle = 1
oShortcut.Description = "MeTube Desktop Client"
oShortcut.Save
