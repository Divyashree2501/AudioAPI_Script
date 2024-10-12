/* 
    PROCEDURE NAME          : pr_getPdiVideofiledetails
    PROGRAM UNIT TYPE       : Procedure 
    CREATED BY              : Vignesh 
    CREATED ON              : 22-07-2020
    PURPOSE                 : This Procedure is to get the pdi video file details     
*/ 
create proc pr_getPdiVideofiledetails
(
@in_dealerID int,
@in_branchID int,
@in_jobCardID bigint
)
AS
BEGIN
	SELECT 
		DEALER_ID
		,BRANCH_ID
		,JOB_CARD_ID
		,CRITICAL_COMPLAINT
		,FILE_NAME
		,FILE_LINK
	FROM 
		DP_PDI_MOBILE_VIDEO
	WHERE
		DEALER_ID = @in_dealerID
		AND BRANCH_ID = @in_branchID
		AND JOB_CARD_ID = @in_jobCardID
END