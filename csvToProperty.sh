## Script to create property file from csv file and push to device

ADB_PATH=adb
echo "connected device :"
$ADB_PATH devices
## enter path of csvToProperty.jar and contacts.csv file
## It will automatically convert it to property file and store in the same provided path

echo "Provide csvToProperties file converter jar path upto filename"
read path1
JAR_PATH=$path1

echo "provide csv path upto filename"
read path2
CSV_PATH=$path2

## execute the jar
java -jar $JAR_PATH $CSV_PATH

echo 'file has been converted to properties file and saved to csv file directory' ${CSV_PATH%/*}
echo  'folder path :'${CSV_PATH%/*}

## push properties file in device

$ADB_PATH push ${CSV_PATH%/*}/contact.properties /data/local/tmp/

echo "Contacts.properies has been pushed to device successfully"
