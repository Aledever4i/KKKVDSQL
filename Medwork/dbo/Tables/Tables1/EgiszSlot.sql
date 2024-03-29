﻿CREATE TABLE [dbo].[EgiszSlot] (
    [ID]                                              INT            NOT NULL,
    [MsgID]                                           NVARCHAR (100) NULL,
    [MsgDate]                                         DATETIME       NULL,
    [XML]                                             NTEXT          NULL,
    [created-at]                                      DATETIME       NULL,
    [updated-at]                                      DATETIME       NULL,
    [unique-key]                                      NVARCHAR (100) NULL,
    [client]                                          NVARCHAR (100) NULL,
    [date]                                            DATETIME       NULL,
    [time]                                            DATETIME       NULL,
    [name]                                            NVARCHAR (100) NULL,
    [surname]                                         NVARCHAR (100) NULL,
    [patronymic]                                      NVARCHAR (100) NULL,
    [phone]                                           NVARCHAR (100) NULL,
    [queue-number]                                    NVARCHAR (100) NULL,
    [status]                                          NVARCHAR (100) NULL,
    [location_id]                                     NVARCHAR (100) NULL,
    [location_waiting-list-available]                 NVARCHAR (100) NULL,
    [location_active]                                 NVARCHAR (100) NULL,
    [location_prefix]                                 NVARCHAR (100) NULL,
    [location_cabinet-number]                         NVARCHAR (100) NULL,
    [location_provider]                               NVARCHAR (100) NULL,
    [location_reservation-time]                       NVARCHAR (100) NULL,
    [location_reserved-time-for-slot]                 INT            NULL,
    [location_time-table-period]                      NVARCHAR (100) NULL,
    [location_has-rules]                              NVARCHAR (100) NULL,
    [location_place_method]                           NVARCHAR (100) NULL,
    [location_place_rel]                              NVARCHAR (100) NULL,
    [location_place_type]                             NVARCHAR (100) NULL,
    [location_place_href]                             NVARCHAR (100) NULL,
    [location_place_id]                               NVARCHAR (100) NULL,
    [location_place_name]                             NVARCHAR (100) NULL,
    [location_place_service-types_service-type_id]    NVARCHAR (100) NULL,
    [location_place_service-types_service-type_name]  NVARCHAR (100) NULL,
    [location_place_service-types_service-type_recid] NVARCHAR (100) NULL,
    [location_place_service-types_service-type_code]  NVARCHAR (100) NULL,
    [location_place_address_region_name]              NVARCHAR (100) NULL,
    [location_place_address_region_kladr-id]          NVARCHAR (100) NULL,
    [location_place_address_house]                    NVARCHAR (100) NULL,
    [location_place_phone]                            NVARCHAR (100) NULL,
    [location_place_description]                      NVARCHAR (100) NULL,
    [location_place_prefix]                           NVARCHAR (100) NULL,
    [location_place_latitude]                         NVARCHAR (100) NULL,
    [location_place_longitude]                        NVARCHAR (100) NULL,
    [location_place_provider]                         NVARCHAR (100) NULL,
    [location_medical-specialization_id]              NVARCHAR (100) NULL,
    [location_medical-specialization_name]            NVARCHAR (100) NULL,
    [location_payment-method_id]                      NVARCHAR (100) NULL,
    [location_payment-method_name]                    NVARCHAR (100) NULL,
    [location_payment-method_default]                 NVARCHAR (100) NULL,
    [location_service-types_service-type_id]          NVARCHAR (100) NULL,
    [location_service-types_service-type_name]        NVARCHAR (100) NULL,
    [location_service-types_service-type_recid]       NVARCHAR (100) NULL,
    [location_service-types_service-type_code]        NVARCHAR (100) NULL,
    [location_reservation-type_id]                    NVARCHAR (100) NULL,
    [location_reservation-type_name]                  NVARCHAR (100) NULL,
    [location_reservation-type_code]                  NVARCHAR (100) NULL,
    [service-type_id]                                 NVARCHAR (100) NULL,
    [service-type_name]                               NVARCHAR (100) NULL,
    [service-type_recid]                              NVARCHAR (100) NULL,
    [service-type_code]                               NVARCHAR (100) NULL,
    CONSTRAINT [EgiszSlotPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idxEgiszSlotDate]
    ON [dbo].[EgiszSlot]([date] ASC);


GO
CREATE NONCLUSTERED INDEX [idxEgiszSlotUniqueKeyUpdatedAt]
    ON [dbo].[EgiszSlot]([unique-key] ASC, [updated-at] ASC);

