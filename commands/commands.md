### text edition:
	nl <- like cat but with numbers of lines
	sed <- find and replace
	more, less
	
### network:
	ifconfig
	iwconfig
	iwlist wlan0 scan
	nmcli
	aircrack-ng
	hciconfig <- bluetooth
    netstat
    ss

### DNS:
    dig <- gather dns information  
    /etc/resolv.conf <- change to edit DNS
 
### file permisions: 
    chown <- change owner  
    chgrp <- change group  
    chmod <- change permisions  
  
 
### processes:
    ps -aux  
    top 
    nice <- increase value of niceness (smaller the nice value bigger the priority)  
    renice <- set absolute value of niceness  
    kill  
    & <- add to run process in background  
    fg <- move process to he forground  
    pstree

### environment variables:
    env <- display system variables
    set <- display all variables
    export <varieble name> = <value>
    unset <variable name> <- delete variable
 
 ### boot
     efibootmgr -v  <-display sumary of boot configuration  
 
### other:
    lsblk <- list block devices
    lsusb
    df <- info about dicsks

    shred <- Overwrite the specified FILE(s) repeatedly, in order to make it harder for even very expensive hardware probing to recover the data.  
    
    proxychains (kali linux)<- run proxychains service
    
    uname -a <- check kernel vesion
    sysctl -a <- list parameres
    sysctl -w <- tune kernel ( to make it pernametn edit /etc/sysctl.conf)
    
    modules
    lsmod <- list installed kernel modules
    inmod <- install module
    rmmod <- rmove module
    
    modprobe <= loads module with dependencies
    modinfo <module name>

    journalctl <- query the systemd journal.  

### tmux:
    tmux <- starts new tmux session
    ctrl + B, D <- detach from session 
    tmux a <- attach to session
    tmux ls <- list sessions
    tmux kill-session -t <name>

    ctrl + B, % <- new pane (vertically)
    ctrl + B, " <- new pane (horizontally)

    ctrl + B, q <- displays pane index
    ctrl + B, arrows <- navigation
    ctrl + B, ctrl + arrow <- change pane size
    ctrl + B, alt + 1,2,3,4,5 <- change pane layout

    ctrl + B, C <- new window
    ctrl + B, N <- move through windows
    ctrl + B, W <- get windows list

    tmux kill-server

### oneliners:

list all commands, and open man  ( have some problems on zsh)
```bash
compgen -c | fzf | xargs man
```   

find files with a) owned by root b) SUID is set to 4, with means that file will be executed with rights of file owner (in this case root) 
```bash
find / -user root -perm -4000
``` 

```bash
sudo arp-scan --interface=eth0 --localnet
``` 

show devices in wifi network
```bash
bettercap -iface wlan0
net.probe on
net.show
``` 

send output of commend to file continuously
```bash
<command> 2>&1 | tee -a fileName.log
``` 

tail over ssh
```bash
 ssh user@host -f tail -f fileName.log
 ``` 