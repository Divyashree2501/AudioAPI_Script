---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
    PROCEDURE NAME          :      pr_createEnquirySalesExecutiveFeedback
    PROGRAM UNIT TYPE       :      Procedure
    CREATED BY              :     Vignesh
    CREATED ON              :      11-10-2019
    PURPOSE                 :     This Procedure is to save Enquiry sales customer executive feedback.    
*/
CREATE proc pr_createEnquirySalesExecutiveFeedback
(
       @in_dealerId int,
       @in_branchId int,
       @in_enquiryId bigint,
       @in_enquiryDate datetime,
       @in_empId int,
       @in_empName varchar(100),
       @in_custName varchar(100),
       @in_product varchar(100),
       @in_understandingofNeeds int,
       @in_seekinginfo int,
       @in_evaluationofoption int,
       @in_decisionMaking int,
       @in_postPurchase int,
       @in_isBought int,
       @in_remarks nvarchar(max) = NULL,
       @in_isOnline int
)
AS
BEGIN
IF NOT EXISTS(SELECT 1 FROM DP_ENQ_EXECUTIVE_CUSTOMER_FEEDBACK WHERE DEALER_ID = @in_dealerId AND BRANCH_ID = @in_branchId AND ENQUIRY_ID = @in_enquiryId)
BEGIN
       INSERT INTO DP_ENQ_EXECUTIVE_CUSTOMER_FEEDBACK
                     (
                           DEALER_ID
                           ,BRANCH_ID
                           ,ENQUIRY_ID
                           ,ENQUIRY_DATE
                           ,EMP_ID
                           ,SALES_EXECUTIVE
                           ,CUST_NAME
                           ,PRODUCT_ENQUIRED
                           ,UNDERSTANDING_OF_NEEDS
                           ,SEEKING_INFORMATION
                           ,EVALUATION_OF_OPTION
                           ,DECISION_MAKING
                           ,POST_PURCHASE
                           ,IS_BOUGHT
                           ,REMARKS
                           ,CREATED_ON
                           ,IS_ONLINE
                     )
              VALUES
                     (
                           @in_dealerId
                           ,@in_branchId
                           ,@in_enquiryId
                           ,@in_enquiryDate
                           ,@in_empId
                           ,@in_empName
                           ,@in_custName
                           ,@in_product
                           ,@in_understandingofNeeds
                           ,@in_seekinginfo
                           ,@in_evaluationofoption
                           ,@in_decisionMaking
                           ,@in_postPurchase
                           ,@in_isBought
                           ,@in_remarks
                           ,GETDATE()
                           ,@in_isOnline
                     )
              SELECT 1 AS RESULT
END
ELSE
SELECT 0 AS RESULT
END

