address1=xxx
address2=xxx
address3=xxx
address4=xxx
address5=xxx

internet=1             # default value

while true;
do
    # %a  Day of Week, textual
    # %b  Month, textual, abbreviated
    # %d  Day, numeric
    # %r  Timestamp AM/PM
    echo $(date +"%a, %b %d, %r"\ "%H:%M:%S") "😀"
    fping -u ${address1} ${address2} ${address3} ${address4} ${address5} > /tmp/ping.$
    if [[ $? -ne 0 ]]; then
        if [[ ${internet} -eq 1 ]]; then   # edge trigger -- was up now down
            echo $(say "once or more HOST  down") # OSX Text-to-Speech
            echo "😢"
        else
            echo "🤬"
        fi
        internet=0
    else
        if [[ ${internet} -eq 0 ]]; then     # edge trigger -- was down now up
            echo $(say "HOST zzzzzzzz back up") # OSX Text-To-Speech
        fi
        internet=1
    fi
    cat /tmp/ping.$ | head -5 | tail -5 #Сколько адресов, столько и добавить в хед и таил
    sleep 5 ; # sleep 5 seconds
done
