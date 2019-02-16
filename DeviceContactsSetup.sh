## this will convert csv file to vcf contacts and store in connect device after cleaning existing contacts from device

ADB_PATH=adb
echo "connected device :"/Users/harshverma/Documents/ContactSetup/DeviceContactsSetup.sh
$ADB_PATH devices
## This will delete all existing contacts from device
$ADB_PATH shell pm clear com.android.providers.contacts

## This will redirect device to home screen as few device appeared in contact screen after deleteing contacts
$ADB_PATH shell input keyevent 3

## enter path of createVcard.jar and contacts.csv file
## It will automatically convery it to vcf and store in the same provided path

echo "Provide jar path upto filename for csv to vcard creation"
read path1
JAR_PATH=$path1

echo "provide csv path upto filename for csv to vcard creation"
read path2
CSV_PATH=$path2

## executing jar
java -jar $JAR_PATH $CSV_PATH

echo 'file has been converted to vcf and saved to csv file directory' ${CSV_PATH%/*}
echo  'folder path :'${CSV_PATH%/*}

## push vcf file to connected device

$ADB_PATH push ${CSV_PATH%/*}/contact.vcf /data/local/tmp/

## import contacts from vcf file to device

sleep 3
$ADB_PATH shell am start -t text/x-vcard -d file:///data/local/tmp/contact.vcf -a android.intent.action.VIEW com.android.contacts
sleep 5

echo "Contacts has been updated"
