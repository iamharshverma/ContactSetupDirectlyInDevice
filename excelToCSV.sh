## Script to create a csv file from excel file
## provide excel file path

ADB_PATH=adb
$ADB_PATH devices
## enter path of excelToCSV.jar
## It will automatically convert it to property file and store in the same provided path

echo "Provide jar path upto filename"
read path1
JAR_PATH=$path1

echo "provide excel path upto filename"
read path2
EXCEL_PATH=$path2

java -jar $JAR_PATH $EXCEL_PATH

echo 'file has been converted to properties file and saved to csv file directory' ${EXCEL_PATH%/*}
echo  'folder path :'${EXCEL_PATH%/*}


echo "contacts.csv has been create to same folder"
