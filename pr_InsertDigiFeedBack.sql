-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
    PROCEDURE NAME          :      pr_InsertDigiFeedBack
    PROGRAM UNIT TYPE       :      Procedure
    CREATED BY              :     Vignesh
    CREATED ON              :      11-10-2019
    PURPOSE                 :     This Procedure is to save the digi app performance feedback.    
*/
CREATE PROCEDURE pr_InsertDigiFeedBack
(
@in_dealerId int,
@in_branchId int,
@in_EmpId int = NULL,
@in_answer1 int,
@in_answer2 int,
@in_answer3 nvarchar(max)
)
AS
BEGIN
       INSERT INTO DP_DMS_DIGI_FEEDBACK
       (
              DEALER_ID,
              BRANCH_ID,
              EMPLOYEE_ID,
              ANSWER_1,
              ANSWER_2,
              ANSWER_3,
              CREATED_ON
       )
       VALUES
       (
              @in_dealerId,
              @in_branchId,
              @in_EmpId,
              @in_answer1,
              @in_answer2,
              @in_answer3,
              GETDATE()
       )
       SELECT 1 AS RESULT
END

