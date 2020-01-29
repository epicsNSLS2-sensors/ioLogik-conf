#!../../bin/linux-x86_64/ioLogik

## You may have to change ioLogik to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/ioLogik.dbd",0,0)
ioLogik_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/ioLogik.db","user=softioc")

iocInit()

## Start any sequence programs
#seq sncioLogik,"user=softioc"
