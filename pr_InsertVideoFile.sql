/* 
    PROCEDURE NAME          : pr_InsertVideoFile
    PROGRAM UNIT TYPE       : Procedure 
    CREATED BY              : Vignesh 
    CREATED ON              : 22-07-2020
    PURPOSE                 : This Procedure is to insert the video file name and complaint for PDI     
*/ 
create PROC pr_InsertVideoFile
(
@in_dealerId int,
@in_branchId int,
@in_jobCardID int,
@in_complaint nvarchar(260),
@in_fileName nvarchar(100),
@in_fileLink nvarchar(max)
)
AS
BEGIN
	if not exists (select 1 from DP_PDI_MOBILE_VIDEO where DEALER_ID = @in_dealerId AND BRANCH_ID = @in_branchId AND JOB_CARD_ID = @in_jobCardID AND FILE_NAME = @in_fileName)
	BEGIN
		INSERT INTO DP_PDI_MOBILE_VIDEO
		(
			DEALER_ID,
			BRANCH_ID,
			JOB_CARD_ID,
			CRITICAL_COMPLAINT,
			FILE_NAME,
			FILE_LINK,
			CREATED_DATE
		)
		VALUES
		(
			@in_dealerId,
			@in_branchId,
			@in_jobCardID,
			@in_complaint,
			@in_fileName,
			@in_fileLink,
			GETDATE()
		)

		select 1 AS RESULT
	END
	ELSE
	BEGIN

	SELECT 0 AS RESULT
	END
END
