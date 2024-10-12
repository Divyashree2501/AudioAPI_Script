-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
    PROCEDURE NAME          : pr_getEnquiryFeedBackExists
    PROGRAM UNIT TYPE       : Procedure
    CREATED BY              : Vignesh
    CREATED ON              : 11-10-2019
    PURPOSE                 : This Procedure is to check enquiry feedback exists or not.    
*/
CREATE PROC pr_getEnquiryFeedBackExists
(
@in_dealerId int,
@in_branchId int,
@in_enquiryId bigint
)
AS
BEGIN
IF EXISTS (SELECT 1 FROM DP_ENQ_EXECUTIVE_CUSTOMER_FEEDBACK WITH(NOLOCK) WHERE DEALER_ID = @in_dealerId AND BRANCH_ID = @in_branchId AND ENQUIRY_ID = @in_enquiryId)
SELECT 1 AS RESULT
ELSE
SELECT 0 AS RESULT
END




