CREATE PROCEDURE dbo.ERLocationScheduleGet
	@ResourceID int,
	@StartDate date,
	@EndDate date
AS
BEGIN
	DECLARE @Schedules table (ScheduleId int, [Date] date, IsActive bit)

	INSERT INTO @Schedules (
		ScheduleId,
		[Date],
		IsActive
		)
		SELECT
			schedules.ID,
			cp.[Date],
			cp.isAct
			FROM dbo.daySchedules AS schedules
			JOIN dbo.CorrectionPatterns AS cp ON cp.DayScheduleID = schedules.ID
			JOIN dbo.TimeIntervals AS ti ON ti.DayScheduleID = schedules.ID
			LEFT JOIN dbo.Dept AS cabinet ON '-' + cabinet.ID = ti.LinkedResourceID
			WHERE
				schedules.ResourceID = @ResourceID
				AND ti.Type = 1 -- 1 - Запись на приём



END


--select * from dbo.TimeIntervals where DayScheduleID = 1918
--select * from dbo.CorrectionPatterns where DayScheduleID = 1918
--select * from dbo.RecurrencePatterns where DayScheduleID = 1918


                --ScheduleWeek scheduleWeek = new ScheduleWeek() {
                --    day1 = new ScheduleSlotType[] {
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:00-09:15" },
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:15-09:30" },
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:30-09:45" },
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:45-10:00" }
                --        },
                --    day2 = new ScheduleSlotType[] {
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:00-09:15" },
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:15-09:30" },
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:30-09:45" },
                --            new ScheduleSlotType() { allowedList = this.Sources, paymentMethodList = this.PaymentList, Value = "09:45-10:00" }
                --        },
                --    start = new DateTime(2019, 6, 24),
                --    startSpecified = true
                --};

                --var week = new ScheduleWeek[] { scheduleWeek };

                --var location = new AddEditLocationRequest
                --{
                --    cabinet_number = "99",
                --    doctor_post_id = "282",
                --    doctor_name = "Чугункина Надежда Яковлевна",
                --    id = "30025",
                --    medical_specialization_id = "300", // Дерматовенерология
                --    payment_method_id = AddEditLocationRequestPayment_method_id.oms,
                --    payment_method_idSpecified = true,
                --    placeId = "1110",
                --    prefix = "042-277-335 40",

                --    reservation_time = 5,
                --    reservation_timeSpecified = true,
                --    reservation_type_id = AddEditLocationRequestReservation_type_id.single,
                --    reservation_type_idSpecified = true,
                --    schedule = week,
                --    can_write = this.Sources,
                --    service_types_ids = new string[] { "602", "608", "1016", "1017" },
                --    reserved_time_for_slot = 15,
                --    time_table_period = 5,
                --    time_table_periodSpecified = true,

                --    //comment = "Запишись ты уже",
                    
                --    doctor_post_name = "Врач-дерматовенеролог",
                --    medical_specialization_name = "Дерматовенерология"