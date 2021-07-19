CREATE SCHEMA RAW.CRUMBL;

CREATE TABLE 
    DELIVERIES_MERIDIAN 
    ( 
        _LINE        NUMBER(38,0), 
        RECORD_TYPE  VARCHAR(256), 
        DRIVER_NAME  VARCHAR(256), 
        DRIVER_PHONE VARCHAR(256), 
        RECEIPT_ID   VARCHAR(256), 
        CREATED_AT   NUMBER(38,0), 
        COMPLETE_BEFORE TIMESTAMP_TZ(9), 
        COMPLETE_AFTER TIMESTAMP_TZ(9), 
        TARGET_TIME TIMESTAMP_TZ(9), 
        DELIVERED_AT TIMESTAMP_TZ(9), 
        MINUTES_LATE       FLOAT, 
        DOOR_DASH_DELIVERY BOOLEAN, 
        DELIVERY_MILES     VARCHAR(256), 
        ORDER_ORIGINATION  VARCHAR(256), 
        TIP                DECIMAL(18,2), 
        TAX                DECIMAL(18,2), 
        TOTAL_COLLECTED    DECIMAL(18,2), 
        STRIPE_FEE         DECIMAL(18,2), 
        SERVICE_FEE        DECIMAL(18,2), 
        DELIVERY_FEE       DECIMAL(18,2),  
        DELIVERY_TASK_ID   VARCHAR(256), 
        DRIVER_ID          VARCHAR(256), 
        _FIVETRAN_SYNCED TIMESTAMP_TZ(9), 
        PRIMARY KEY (_LINE) 
    );

CREATE TABLE 
    DELIVERIES_AVONDALE
    ( 
        _LINE        NUMBER(38,0), 
        RECORD_TYPE  VARCHAR(256), 
        DRIVER_NAME  VARCHAR(256), 
        DRIVER_PHONE VARCHAR(256), 
        RECEIPT_ID   VARCHAR(256), 
        CREATED_AT   NUMBER(38,0), 
        COMPLETE_BEFORE TIMESTAMP_TZ(9), 
        COMPLETE_AFTER TIMESTAMP_TZ(9), 
        TARGET_TIME TIMESTAMP_TZ(9), 
        DELIVERED_AT TIMESTAMP_TZ(9), 
        MINUTES_LATE       FLOAT, 
        DOOR_DASH_DELIVERY BOOLEAN, 
        DELIVERY_MILES     VARCHAR(256), 
        ORDER_ORIGINATION  VARCHAR(256), 
        TIP                DECIMAL(18,2), 
        TAX                DECIMAL(18,2), 
        TOTAL_COLLECTED    DECIMAL(18,2), 
        STRIPE_FEE         DECIMAL(18,2), 
        SERVICE_FEE        DECIMAL(18,2), 
        DELIVERY_FEE       DECIMAL(18,2),  
        DELIVERY_TASK_ID   VARCHAR(256), 
        DRIVER_ID          VARCHAR(256), 
        _FIVETRAN_SYNCED TIMESTAMP_TZ(9), 
        PRIMARY KEY (_LINE) 
    );

CREATE TABLE 
    DELIVERIES_GLENDALE
    ( 
        _LINE        NUMBER(38,0), 
        RECORD_TYPE  VARCHAR(256), 
        DRIVER_NAME  VARCHAR(256), 
        DRIVER_PHONE VARCHAR(256), 
        RECEIPT_ID   VARCHAR(256), 
        CREATED_AT   NUMBER(38,0), 
        COMPLETE_BEFORE TIMESTAMP_TZ(9), 
        COMPLETE_AFTER TIMESTAMP_TZ(9), 
        TARGET_TIME TIMESTAMP_TZ(9), 
        DELIVERED_AT TIMESTAMP_TZ(9), 
        MINUTES_LATE       FLOAT, 
        DOOR_DASH_DELIVERY BOOLEAN, 
        DELIVERY_MILES     VARCHAR(256), 
        ORDER_ORIGINATION  VARCHAR(256), 
        TIP                DECIMAL(18,2), 
        TAX                DECIMAL(18,2), 
        TOTAL_COLLECTED    DECIMAL(18,2), 
        STRIPE_FEE         DECIMAL(18,2), 
        SERVICE_FEE        DECIMAL(18,2), 
        DELIVERY_FEE       DECIMAL(18,2),  
        DELIVERY_TASK_ID   VARCHAR(256), 
        DRIVER_ID          VARCHAR(256), 
        _FIVETRAN_SYNCED TIMESTAMP_TZ(9), 
        PRIMARY KEY (_LINE) 
    );

CREATE TABLE 
    DELIVERIES_GOODYEAR
    ( 
        _LINE        NUMBER(38,0), 
        RECORD_TYPE  VARCHAR(256), 
        DRIVER_NAME  VARCHAR(256), 
        DRIVER_PHONE VARCHAR(256), 
        RECEIPT_ID   VARCHAR(256), 
        CREATED_AT   NUMBER(38,0), 
        COMPLETE_BEFORE TIMESTAMP_TZ(9), 
        COMPLETE_AFTER TIMESTAMP_TZ(9), 
        TARGET_TIME TIMESTAMP_TZ(9), 
        DELIVERED_AT TIMESTAMP_TZ(9), 
        MINUTES_LATE       FLOAT, 
        DOOR_DASH_DELIVERY BOOLEAN, 
        DELIVERY_MILES     VARCHAR(256), 
        ORDER_ORIGINATION  VARCHAR(256), 
        TIP                DECIMAL(18,2), 
        TAX                DECIMAL(18,2), 
        TOTAL_COLLECTED    DECIMAL(18,2), 
        STRIPE_FEE         DECIMAL(18,2), 
        SERVICE_FEE        DECIMAL(18,2), 
        DELIVERY_FEE       DECIMAL(18,2),  
        DELIVERY_TASK_ID   VARCHAR(256), 
        DRIVER_ID          VARCHAR(256), 
        _FIVETRAN_SYNCED TIMESTAMP_TZ(9), 
        PRIMARY KEY (_LINE) 
    );

CREATE TABLE 
    DELIVERIES_NAMPA
    ( 
        _LINE        NUMBER(38,0), 
        RECORD_TYPE  VARCHAR(256), 
        DRIVER_NAME  VARCHAR(256), 
        DRIVER_PHONE VARCHAR(256), 
        RECEIPT_ID   VARCHAR(256), 
        CREATED_AT   NUMBER(38,0), 
        COMPLETE_BEFORE TIMESTAMP_TZ(9), 
        COMPLETE_AFTER TIMESTAMP_TZ(9), 
        TARGET_TIME TIMESTAMP_TZ(9), 
        DELIVERED_AT TIMESTAMP_TZ(9), 
        MINUTES_LATE       FLOAT, 
        DOOR_DASH_DELIVERY BOOLEAN, 
        DELIVERY_MILES     VARCHAR(256), 
        ORDER_ORIGINATION  VARCHAR(256), 
        TIP                DECIMAL(18,2), 
        TAX                DECIMAL(18,2), 
        TOTAL_COLLECTED    DECIMAL(18,2), 
        STRIPE_FEE         DECIMAL(18,2), 
        SERVICE_FEE        DECIMAL(18,2), 
        DELIVERY_FEE       DECIMAL(18,2),  
        DELIVERY_TASK_ID   VARCHAR(256), 
        DRIVER_ID          VARCHAR(256), 
        _FIVETRAN_SYNCED TIMESTAMP_TZ(9), 
        PRIMARY KEY (_LINE) 
    );

CREATE TABLE 
    DELIVERIES_SOUTH_MOUNTAIN
    ( 
        _LINE        NUMBER(38,0), 
        RECORD_TYPE  VARCHAR(256), 
        DRIVER_NAME  VARCHAR(256), 
        DRIVER_PHONE VARCHAR(256), 
        RECEIPT_ID   VARCHAR(256), 
        CREATED_AT   NUMBER(38,0), 
        COMPLETE_BEFORE TIMESTAMP_TZ(9), 
        COMPLETE_AFTER TIMESTAMP_TZ(9), 
        TARGET_TIME TIMESTAMP_TZ(9), 
        DELIVERED_AT TIMESTAMP_TZ(9), 
        MINUTES_LATE       FLOAT, 
        DOOR_DASH_DELIVERY BOOLEAN, 
        DELIVERY_MILES     VARCHAR(256), 
        ORDER_ORIGINATION  VARCHAR(256), 
        TIP                DECIMAL(18,2), 
        TAX                DECIMAL(18,2), 
        TOTAL_COLLECTED    DECIMAL(18,2), 
        STRIPE_FEE         DECIMAL(18,2), 
        SERVICE_FEE        DECIMAL(18,2), 
        DELIVERY_FEE       DECIMAL(18,2),  
        DELIVERY_TASK_ID   VARCHAR(256), 
        DRIVER_ID          VARCHAR(256), 
        _FIVETRAN_SYNCED TIMESTAMP_TZ(9), 
        PRIMARY KEY (_LINE) 
    );