----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
    PROCEDURE NAME          :      pr_InsertAudioFile
    PROGRAM UNIT TYPE       :      Procedure
    CREATED BY              :     Vignesh
    CREATED ON              :      11-10-2019
    PURPOSE                 :     This Procedure is to save digi audio file details in portal.    
*/
CREATE PROC pr_InsertAudioFile
(
@in_dealerId int,
@in_branchId int,
@in_transTypeId int,
@in_transTypeDesc nvarchar(20),
@in_transID bigint,
@in_audiofileName nvarchar(100),
@in_createdDate datetime
)
AS
BEGIN
	if not exists (select 1 from DP_MOBILE_AUDIO where DEALER_ID = @in_dealerId AND BRANCH_ID = @in_branchId AND TRANS_ID = @in_transID AND AUDIO_FILE_NAME = @in_audiofileName)
	BEGIN
		INSERT INTO DP_MOBILE_AUDIO
		(
			DEALER_ID,
			BRANCH_ID,
			TRANS_TYPE_ID,
			TRANS_TYPE_DESC,
			TRANS_ID,
			AUDIO_FILE_NAME,
			CREATED_DATE,
			INSERTED_DATE
		)
		VALUES
		(
			@in_dealerId,
			@in_branchId,
			@in_transTypeId,
			@in_transTypeDesc,
			@in_transID,
			@in_audiofileName,
			@in_createdDate,
			GETDATE()
		)

		select 1 AS RESULT
	END
	ELSE
	BEGIN

	SELECT 0 AS RESULT
	END
END


