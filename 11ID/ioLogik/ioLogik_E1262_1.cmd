# MOXA E1262 TCs: function 4 (Read Input Registers), address 2048, 8 double words , data_type = INT32_BE
drvModbusAsynConfigure("$(E1262_ASYNPORT)_TC", "$(E1262_ASYNPORT)", 0, 4, 2048, 16, 6, 500, "ioLogik")

# Load database
dbLoadRecords("db/ioLogik_E1262.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E1262_ASYNPORT)")


