#!/bin/bash
runAccountAudit="false"
runPermAudit="false"

reportDir="AuditReports"


while getopts :Ap opt
do
   case "$opt" in
     A) runAccountAudit="true" ;;
     p) runPermAudit="true" ;;
     *) echo "Not a valid option."
        echo "Valid options are: -A, -p or -Ap"
        exit ;;
    esac
done

if [ $OPTIND -eq 1 ]
then
    # no options set, set all to true 
    runAccountAudit="true"
    runPermAudit="true"
fi
mkdir -p $reportDir

if [ $runAccountAudit = "true" ]
then
    echo
    echo "***** Account Audit *****"
    echo
    reportDate=$(date +%s)
    accountReport=$reportDir/AccountAudit$reportDate.rpt
 
    cat /etc/passwd | cut -d: -f7 | grep -E "(nologin|false)" | wc -l | tee $accountReport

    prevReport="$(ls -1t $reportDir/AccountAudit*.rpt | sed -n '2p')"
    if [ -z $prevReport ]
    then
    echo
    echo "No previous false/nologin report exists to compare."
    else
    echo
    echo "Previous reports's false/noloigin shells: "
    cat $prevReport
    fi
fi 

if [ $runPermAudit = "true" ]
then
    echo
    echo "***** SUID/SGID Audit *****"
    echo

    reportDate=$(date +%s)
    permReport=$reportDir/PermissionAudit$reportDate.rpt
    sudo find / - perm /6000>$permReport 2>/dev/null

    prevReport="$(ls -1t $reportDir/PermissionAudit*.rpt | sed -n '2p')"
    if [ -z $prevReport ]
    then
    echo
    echo "No previous permission report exists to compare."
    else
    echo
    echo "Diffenreces between this report and the last: "
    differences=$(diff $permReport $prevReport)
        if [ -z "$differences" ]
        then 
            echo "No diffrneces exists."
        else
            echo $differences
        fi  
    fi
fi