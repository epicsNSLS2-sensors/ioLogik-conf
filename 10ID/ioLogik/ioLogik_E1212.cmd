# MOXA E12xx DIs (if NOT counter mode) : function 2 (Read Discrete Inputs), address 0x0, length 6, data_type = UINT16 = 0, 
# pollMsec = for read func, waits XXX msecs
drvModbusAsynConfigure("$(E12xx_ASYNPORT)_DI", "$(E12xx_ASYNPORT)", 0, 2, 0, 8, 0, 100, "ioLogik")

# MOXA E12xx DOs: function 5 (Write Single Coil), base_address 0, length 8, data_type = UINT16 = 0, 
# pollMsec = for write func (4,..) any non-zero val to read first
drvModbusAsynConfigure("$(E12xx_ASYNPORT)_DO", "$(E12xx_ASYNPORT)", 0, 5, 0, 8, 0, 1, "ioLogik")

# MOXA E12xx DOs: function 1 (Read Coils), address 0, length 6, data_type = UINT16 = 0, 
# pollMsec = for read func, waits XXX msecs
drvModbusAsynConfigure("$(E12xx_ASYNPORT)_DO_RBV", "$(E12xx_ASYNPORT)", 0, 1, 0, 8, 0, 100, "ioLogik")

## Load record instances
#dbLoadRecords("db/ioLogik_E1212.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(E12xx_ASYNPORT)")


