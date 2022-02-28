#!/bin/bash -e

#<------------ Importing Scripts ------------>

# Declaration of the Paths of other scripts in the Script_PATH variables

Script_PATH1="~/LizardFS-Ubuntu/Ubuntu/Master.sh"
Script_PATH2="~/LizardFS-Ubuntu/Ubuntu/Chunk.sh"
Script_PATH3="~/LizardFS-Ubuntu/Ubuntu/Chunk_MetaLogger.sh"
Script_PATH4="~/LizardFS-Ubuntu/Ubuntu/Shadow.sh"
Script_PATH5="~/LizardFS-Ubuntu/Ubuntu/Client.sh"

#<------------ Calls declared Variables ------------>

#   Declaration of the new variables which will have the name of the scripts which will have been retrieved via the variables above

Master=$"$Script_PATH1"
Chunk=$"$Script_PATH2"
Chunk_MetaLogger=$"$Script_PATH3"
Shadow=$"$Script_PATH4"
Client=$"$Script_PATH5"


#<------------ Calls up Functions ------------------->

function main {  #   Main function: This will declare the other functions to make the scripts work
function main {
    hostname
    pre-requis
    host
    list_install
    choix_list_install
}

function pre-requis {  #   Pre-requisite function: It will aim at gathering the necessary installation
    echo "Launching the installation script 👌"  # We say we run the script
    sleep 1 # Wait a second
    echo "Installation of the prerequisites 🎈" # We say we install the prerequisites
    sleep 1 # Wait a second
    sudo apt-get install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip #  We install the packages we need
    sudo apt-get update -y && sudo apt-get upgrade -y # We update and upgrade the bone system
    echo "deb [trusted=yes] http://packages.lizardfs.com/ubuntu/$(lsb_release -sc) $(lsb_release -sc) main" > sudo /etc/apt/sources.list.d/lizardfs.list
    echo "deb-src http://packages.lizardfs.com/ubuntu$(lsb_release -sc) $(lsb_release -sc) main" >> sudo /etc/apt/sources.list.d/lizardfs.list
    sudo apt-get -y update # We update the system
    sleep 1 # Wait a second
    echo "Installed prerequisites 😊" # Echo 3: The prerequisites are said to be installed
}

function hostname { #   Hostname function: It aims to set the hostname according to the user's choice
    read -p "Choose the name of the machine ? :" name   #   Read: The user is asked to give the name of the machine and this value will be stored in the variable $Name
    hostname set-hostname $name #   The hostname is given and on system restart the name will be saved
    hostname $name  #   The hostname will be applied temporarily
}


function host {     #Function host: The purpose of this function is to put the IPs and the host name we have chosen in the hosts file
    Config_host=True    #   Variable Config_host: it takes the true value
    while [ $Config_host ]; do  #   Loop: If the value of $Config_host is true then ⬇️
        echo -e "Configuration du fichier hôte 🤠\n"  # Echo 1: We say we're going to set up the host file
        read -n3 -p "You want to set up the Host File ?" rep # Read 1: We ask the user if he wants to set up the host file and the answer is that the value given will go into the variable $rep
        if [ "$rep" = "yes" ] || [ "$rep" = "y" ]; then #  Condition : If the value of $rep is yes/y then
            echo -e "\n" # Echo 2: A line break
            read -p "Please enter the IP and hostname: " rep2 #  Read 2: The user is asked to give IP and Hostname, so the values given will go into the variable $rep2
            echo -e "\n$rep2">>/etc/hosts  #  Echo 3: The value given in $rep2 will go into the host file
            sleep 1 #   Wait a second
            echo -e "\nModified Hosts file 😝"  #  Echo 4: It is said that the File has been modified
            sleep 2 #   Wait for 2 seconds
            echo -e "\nBack to the Hosts File Setup Menu 😶"    #  Echo 5: The user is told to return to the host file configuration menu
            sleep 1 #   Wait a second
            clear   #   We delete all the messages from before
        else    #   Otherwise, if the user has chosen something other than yes/y, then see the line below
            echo -e "\n" # Echo 6: A line break
            echo "You leave the Hosts File Setup Menu !!!😨😨"  # Echo 7: The user leaving the configuration menu is told
            sleep 2 #   Wait a 2 seconds
            exit  #  Exit the host file configuration menu
        fi # End to Condition
    done # End to script
}

function list_install {  #   ListInstall function: It aims to give a list, like a menu
    echo -e "\nInstallation sur ? :"
    echo -e "1) Master"
    echo -e "2) Chunk"
    echo -e "3) Metalogger"
    echo -e "4) Shadow"
    echo -e "5) Client"
    echo -e "6) Exit\n"
}

function choix_list_install {   #   ChoixListInstall function: It is intended to allow the selection of the installation option from thelist
    read -n1 -p "Choose option (1-5) : " Action_main #   Read 4 : The user is asked to choose an option and the value given will be taken by the Action_main variable
    if [ "$Action_main" == "1" ]; then  #   Condition : If the user chooses 1 then it echoes $master
       echo $Master     #   Echo 1 : it will return what is in the variable $Master that is to say the script Master.sh
    elif [ "$Action_main" == "2" ]  # Elif 1 : If the user chooses 2 then it echoes $Chunk
        echo $Chunk     #   Echo 2 : it will return what is in the variable $Chunk that is to say the script Chunk.sh
    elif [ "$Action_main" == "3" ]  # Elif 2 : If the user chooses 3 then it echoes $Chunk_MetaLogger
        echo $Chunk_MetaLogger    #   Echo 3 : it will return what is in the variable $Chunk_MetaLogger that is to say the script Chunk_MetaLogger.sh
    elif [ "$Action_main" == "4" ]  # Elif 3 : If the user chooses 4 then it echoes $Shadow
        echo $Shadow    #   Echo 4 : it will return what is in the variable $Shadow that is to say the script Shadow.sh
    elif [ "$Action_main" == "5" ]  # Elif 4 : If the user chooses 5 then it echoes $Client
        echo $Client    #   Echo 5 : it will return what is in the variable $Client that is to say the script Client.sh
    elif [ "$Action_main" == "6" ]  # Elif 5 : If the user chooses 6 then go to exit
        exit     # It comes out of the script
    else # Else : The user is mistaken so we will return an echo
    echo "Incorrect,Retry 😓!" # Echo 6 : He says it is incorrect !!
        choisir_categorie_main #    Use of the choisir_categorie_main
    fi # End of Condition
}

# <------------ Running the script ------------>

main # Utility function to run the script
