# MOXA E1260 RTDs: function 4 (Read Input Registers), address 1536, 6 words , data_type = INT16 = 4 (its 2's complement)
drvModbusAsynConfigure("$(E1260_ASYNPORT)_RTD", "$(E1260_ASYNPORT)", 0, 4, 1536, 6, 4, 500, "ioLogik")

# Load database
#dbLoadRecords("db/ioLogik_E1260.db","Sys=$(SYSNAME),Dev=$(DEV), ASYNPORT=$(E1260_ASYNPORT)")


