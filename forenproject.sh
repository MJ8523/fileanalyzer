#!/bin/bash


function Downloads()
{

echo "File analyzer"
sleep 1.0
echo "We'll start with Downloads"
sudo wget -nc  -q downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip#unzip volatility_2.6_lin64_standalone.zip
sudo apt-get install  cmatrix

}
Downloads




function START()
{
        read -p  "insert the sort of file (mem or hdd): " file
                if [[ $file = mem ]]
                then
 		        MEM

                elif [[ $file = hdd ]]
                then
                HDD

                else
                echo "wrong file"
		START
		fi
}

START

function MEM()
{
                read -p "insert the MEM path: " path

	       cd /home/kali/volatility_2.6_lin64_standalone
	       mv volatility_2.6_lin64_standalone volatility
               ./volatility  -f $path imageinfo
	       echo "write your profile"
	       read profile
	       echo "your command"
	       read command
	       echo "enter the name of your output file"
	       read  file
               ./volatility -f $path --profile=$profile $command --output-file=$file

}


function HDD()
{
        read -p "insert the HDD path: " path
        echo " what the name of your output file"
        read file
                bulk_extractor -o $file $path
                foremost $path -o $file
                binwalk $path -o $file
}



START
