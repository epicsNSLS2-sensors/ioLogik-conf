#!bin/linux-x86_64/ioLogik

# Location and contact information
epicsEnvSet("ENGINEER",  "kgofron x5283")
epicsEnvSet("LOCATION",  "740 IXS Hutch-D")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.10.0.255")

## Register all support components
dbLoadDatabase "dbd/ioLogik.dbd"
ioLogik_registerRecordDeviceDriver pdbbase

#epicsEnvSet("SYSNAME","XF:11IDB-ES")
#epicsEnvSet("CTSYS","XF:11IDB-CT")
epicsEnvSet("SYSNAME","XF:10ID-ES")
epicsEnvSet("CTSYS","XF:10ID-CT")

#######################################################################
# set ASYN port name variable ('RIO' + last_byte_of_IP_address)

# ### E1241 (4AO) ###
epicsEnvSet("E1241_ASYN1","E1241_1")
# ### E1214 (6DI, 6DO) ###
epicsEnvSet("E1214_ASYN1","E1214_1")
# ### E1260 (6RTD) ###
epicsEnvSet("E1260_ASYN1","E1260_1")
# ### E1262 ( 8TC) ###
epicsEnvSet("E1262_ASYN1","E1262_1")
# ### E1212 (68I, 8DO) ###
epicsEnvSet("E1212_ASYN1","E1212_1")

# ### E1241 (4AO) ###
epicsEnvSet("E1241_ASYN2","E1241_2")
# ### E12410 (8AI) ###
epicsEnvSet("E1240_ASYN1","E1240_1")


#drvAsynIPPortConfigure("$(E1241_ASYN1)", "10.11.130.111:502", 0, 0, 1)
drvAsynIPPortConfigure("$(E1214_ASYN1)", "10.10.3.42:502", 0, 0, 1)
#drvAsynIPPortConfigure("$(E1260_ASYN1)", "10.11.130.113:502", 0, 0, 1)
drvAsynIPPortConfigure("$(E1262_ASYN1)", "10.10.3.43:502", 0, 0, 1)
#drvAsynIPPortConfigure("$(E1212_ASYN1)", "10.11.2.53:502", 0, 0, 1)	# CHX moved to 10.10.3.41-46 range
#drvAsynIPPortConfigure("$(E1212_ASYN1)", "192.168.1.53:502", 0, 0, 1) 	# CHX mobile system
drvAsynIPPortConfigure("$(E1212_ASYN1)", "10.10.3.41:502", 0, 0, 1)

#drvAsynIPPortConfigure("$(E1241_ASYN2)", "10.11.130.115:502", 0, 0, 1)
#drvAsynIPPortConfigure("$(E1240_ASYN1)", "10.11.130.116:502", 0, 0, 1)

#######################################################################
# modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType, .... Modbus link layer type: 0 = TCP/IP , 1 = RTU, 2 = ASCII
#                      int timeoutMsec, 
#                      int writeDelayMsec)
#modbusInterposeConfig("$(E1241_ASYN1)", 0, 2000, 0)
modbusInterposeConfig("$(E1214_ASYN1)", 0, 2000, 0)
#modbusInterposeConfig("$(E1260_ASYN1)", 0, 2000, 0)
modbusInterposeConfig("$(E1262_ASYN1)", 0, 2000, 0)
modbusInterposeConfig("$(E1212_ASYN1)", 0, 2000, 0)

#modbusInterposeConfig("$(E1241_ASYN2)", 0, 2000, 0)
#modbusInterposeConfig("$(E1240_ASYN1)", 0, 2000, 0)

#######################################################################
# modbus port driver is created with the following command:
#drvModbusAsynConfigure(portName, 
#                        tcpPortName,
#                        slaveAddress, 
#                        modbusFunction, 
#                        modbusStartAddress, 
#                        modbusLength,
#                        dataType,
#                        pollMsec, 
#                        plcType);
#######################################################################

##Modbus functions
#Function name                          Function code
#Read Discrete Inputs                    2
#Read Coils                              1
#Write Single Coil                       5
#Write Multiple Coils                   15
#Read Input Registers                    4
#Read Holding Registers                  3
#Write Single Register                   6
#Write Multiple Registers               16
#Read/Write Multiple Registers          23
#Mask Write Register                    22
#Read FIFO Queue                        24
#Read File Record                       20
#Write File Record                      21
#Read Exception Status                   7
#Diagnostic                              8
#Get Com Event Counter                  11
#Get Com Event Log                      12
#Report Slave ID                        17
#Read Device Identification             43
#Encapsulated Interface Transport       43
#
#######################################################################

#######################################################################
#Supported Modbus data types
#modbusDataType value 	drvUser field 	Description
#0 	UINT16 	Unsigned 16-bit binary integers
#1 	INT16SM 	16-bit binary integers, sign and magnitude format. In this format bit 15 is the sign bit, and bits 0-14 are the absolute value of the magnitude of the number. 
#			This is one of the formats used, for example, by Koyo PLCs for numbers such as ADC conversions.
#2 	BCD_UNSIGNED 	Binary coded decimal (BCD), unsigned. This data type is for a 16-bit number consisting of 4 4-bit nibbles, each of which encodes a decimal number from 0-9. 
#			A BCD number can thus store numbers from 0 to 9999. Many PLCs store some numbers in BCD format.
#3 	BCD_SIGNED 	4-digit binary coded decimal (BCD), signed. This data type is for a 16-bit number consisting of 3 4-bit nibbles, and one 3-bit nibble. 
#			Bit 15 is a sign bit. Signed BCD numbers can hold values from -7999 to +7999. This is one of the formats used by Koyo PLCs for numbers such as ADC conversions.
#4 	INT16 		16-bit signed (2's complement) integers. This data type extends the sign bit when converting to epicsInt32.
#5 	INT32_LE 	32-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1)
#6 	INT32_BE 	32-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1)
#7 	FLOAT32_LE 	32-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1)
#8 	FLOAT32_BE 	32-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1)
#9 	FLOAT64_LE 	64-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3)
#10 	FLOAT64_BE 	64-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3)
#######################################################################


#epicsEnvSet("E12xx_ASYNPORT","$(E1241_ASYN1)")
#epicsEnvSet("DEV", "{IO"}
#< ioLogik_E1241.cmd
# Load database
#dbLoadRecords("db/ioLogik_E1241_1.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E12xx_ASYNPORT)")

epicsEnvSet("E12xx_ASYNPORT","$(E1214_ASYN1)")
epicsEnvSet("DEV", "{IO}")
< ioLogik_E1214.cmd
# Load database
dbLoadRecords("db/ioLogik_E1214_1.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E12xx_ASYNPORT)")

#epicsEnvSet("E1260_ASYNPORT","$(E1260_ASYN1)")
#epicsEnvSet("DEV", "{IO:RTD"}
#< ioLogik_E1260.cmd
# Load database
#dbLoadRecords("db/ioLogik_E1260_1.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E1260_ASYNPORT)")

epicsEnvSet("E12xx_ASYNPORT","$(E1262_ASYN1)")
epicsEnvSet("DEV", "{IO:TC}")
< ioLogik_E1262.cmd
# Load database
dbLoadRecords("db/ioLogik_E1262_1.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E12xx_ASYNPORT)")

epicsEnvSet("E12xx_ASYNPORT","$(E1212_ASYN1)")
epicsEnvSet("DEV", "{IO:1}")
< ioLogik_E1212.cmd
# Load database
dbLoadRecords("db/ioLogik_E1212_1.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E12xx_ASYNPORT)")


#epicsEnvSet("E12xx_ASYNPORT","$(E1241_ASYN2)")
#epicsEnvSet("DEV", "{IO}")
#< ioLogik_E1241.cmd
# Load database
#dbLoadRecords("db/ioLogik_E1241_2.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E12xx_ASYNPORT)")

#epicsEnvSet("E12xx_ASYNPORT","$(E1240_ASYN1)")
#epicsEnvSet("DEV", "{IO"}
#< ioLogik_E1240.cmd
# Load database
#dbLoadRecords("db/ioLogik_E1240_1.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E12xx_ASYNPORT)")

dbLoadRecords("db/iocAdminSoft.db", "IOC=$(CTSYS){IOC:IO}")
iocInit

#E1212 DI
dbpf XF:10ID-ES{IO:1}DI:1-Sts.DESC "DI Channel 1"
dbpf XF:10ID-ES{IO:1}DI:2-Sts.DESC "DI Channel 2"
dbpf XF:10ID-ES{IO:1}DI:3-Sts.DESC "DI Channel 3"
dbpf XF:10ID-ES{IO:1}DI:4-Sts.DESC "DI Channel 4"
dbpf XF:10ID-ES{IO:1}DI:5-Sts.DESC "DI Channel 5"
dbpf XF:10ID-ES{IO:1}DI:6-Sts.DESC "DI Channel 6"
dbpf XF:10ID-ES{IO:1}DI:7-Sts.DESC "DI Channel 7"
dbpf XF:10ID-ES{IO:1}DI:8-Sts.DESC "DI Channel 8"
#E1212 DO
dbpf XF:10ID-ES{IO:1}DO:1-Cmd.DESC "DO Channel 1"
dbpf XF:10ID-ES{IO:1}DO:2-Cmd.DESC "DO Channel 2"
dbpf XF:10ID-ES{IO:1}DO:3-Cmd.DESC "DO Channel 3"
dbpf XF:10ID-ES{IO:1}DO:4-Cmd.DESC "DO Channel 4"
dbpf XF:10ID-ES{IO:1}DO:5-Cmd.DESC "DO Channel 5"
dbpf XF:10ID-ES{IO:1}DO:6-Cmd.DESC "DO Channel 6"
dbpf XF:10ID-ES{IO:1}DO:7-Cmd.DESC "DO Channel 7"
dbpf XF:10ID-ES{IO:1}DO:8-Cmd.DESC "DO Channel 8"

#E1214 DI
dbpf XF:10ID-ES{IO}DI:1-Sts.DESC "DI Channel 1"
dbpf XF:10ID-ES{IO}DI:2-Sts.DESC "DI Channel 2"
dbpf XF:10ID-ES{IO}DI:3-Sts.DESC "DI Channel 3"
dbpf XF:10ID-ES{IO}DI:4-Sts.DESC "DI Channel 4"
dbpf XF:10ID-ES{IO}DI:5-Sts.DESC "DI Channel 5"
dbpf XF:10ID-ES{IO}DI:6-Sts.DESC "DI Channel 6"
#E1214 DO
dbpf XF:10ID-ES{IO}DO:1-Cmd.DESC "Relay Channel 1"
dbpf XF:10ID-ES{IO}DO:2-Cmd.DESC "Relay Channel 2"
dbpf XF:10ID-ES{IO}DO:3-Cmd.DESC "Relay Channel 3"
dbpf XF:10ID-ES{IO}DO:4-Cmd.DESC "Relay Channel 4"
dbpf XF:10ID-ES{IO}DO:5-Cmd.DESC "Relay Channel 5"
dbpf XF:10ID-ES{IO}DO:6-Cmd.DESC "Relay Channel 6"

#E1262
dbpf XF:10ID-ES{IO:TC}T:1-I.DESC "TC Channel 1"
dbpf XF:10ID-ES{IO:TC}T:2-I.DESC "TC Channel 2"
dbpf XF:10ID-ES{IO:TC}T:3-I.DESC "TC Channel 3"
dbpf XF:10ID-ES{IO:TC}T:4-I.DESC "TC Channel 4"
dbpf XF:10ID-ES{IO:TC}T:5-I.DESC "TC Channel 5"
dbpf XF:10ID-ES{IO:TC}T:6-I.DESC "TC Channel 6"
dbpf XF:10ID-ES{IO:TC}T:7-I.DESC "TC Channel 7"
dbpf XF:10ID-ES{IO:TC}T:8-I.DESC "TC Channel 8"
