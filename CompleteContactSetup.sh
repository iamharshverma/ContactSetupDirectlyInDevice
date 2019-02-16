## This script does the following task :
## 1. Pick Hike contacts from Excel file and convert to contacts.csv file
## 2. Convert created contact.csv file to contact.properties file
## Path 1 : Convert contact.properties file to contact.vcf
## 4. Push the create contact.vcf file to device storage
## 5. Delete all existing device contacts.
## 6. Import and sync contacts in device from contact.vcf file.
## path 2 : Push created contact.properties file to device storage that will be used to set hike contact numbers in HikeConstant file



## 1 : provide excel file path
## this will set adb path in  bash

ADB_PATH=adb

## Display connected device
echo "Display connected devices"
$ADB_PATH devices

## enter path of excelToCSV.jar
## It will automatically convert it to property file and store in the same provided path of excel file

echo "Provide jar path to convert excel to contacts.csv upto filename"
read path1
JAR_PATH=$path1

echo "provide excel file path upto filename"
read path2
EXCEL_PATH=$path2

## execute jar
java -jar $JAR_PATH $EXCEL_PATH

echo 'file has been converted to properties file and saved to csv file directory' ${EXCEL_PATH%/*}
echo  'folder path :'${EXCEL_PATH%/*}

echo "contacts.csv has been create to same folder"

## Creating contact.properties file from provided csv file and pushing it to connected device

chmod a+x "${EXCEL_PATH%/*}/csvToProperty.sh"
sh ${EXCEL_PATH%/*}/csvToProperty.sh

## Creating vcf file from given csv file and pushing desired contact to device after cleaning existing device contacts

sh ${EXCEL_PATH%/*}/DeviceContactsSetup.sh

echo "Device complete contact setup completed"