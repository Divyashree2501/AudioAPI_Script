
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
    PROCEDURE NAME          :    pr_InsertDigiimageFile
    PROGRAM UNIT TYPE       :    Procedure
    CREATED BY              :    Vignesh
    CREATED ON              :    11-10-2019
    PURPOSE                 :    This Procedure is to save the jobcard image details to portal.    
*/
CREATE PROC pr_SaveMaterialProcessDetail
(
    @iInspectionLot VARCHAR(50) NULL,
    @iInspectionDate  date Null,
    @iPlantName  VARCHAR(50) NULL,
    @iShop VARCHAR(50) NULL,
    @iDepartment VARCHAR(50) NULL,
    @iMaterialNo  VARCHAR(50) NULL,
    @iGroupNo VARCHAR(50) NULL,
    @iVersion VARCHAR(50) NULL,
    @iProdLine VARCHAR(20) NULL,
    @iProdLineDesc VARCHAR(20) NULL,
    @iEmpno VARCHAR(50) NULL,
    @iEmpName VARCHAR(20) NULL,
    @iEngineNo VARCHAR(30) NULL,
    @iFrameNo VARCHAR(30) NULL,
    @iOPN  VARCHAR(30) NULL,
    @iOPNDesc VARCHAR(100) NULL,
    @iStatus VARCHAR(20) NULL,
    @iObservation VARCHAR(100) NULL,
    @iImageFile1Name VARCHAR(200) NULL,
    @iImageFile1Path VARCHAR(300) NULL,
    @iImageFile2Name VARCHAR(200) NULL,
    @iImageFile2Path VARCHAR(300) NULL,
    @iOperatorName VARCHAR(50) NOT NULL,
    @iRemark VARCHAR(500) NOT NULL,
    @iRespEmpNo VARCHAR(100) NOT NULL,
    @iTeamLeader VARCHAR(100) NOT NULL,
    @iCreatedDate DATETIME NULL)
AS
BEGIN
	if not exists (select 1 from MaterialHandlingInspectionDetails where InspectionLot = @iInspectionLot and Plant = @iPlant and PlantName = @iPlantName
          and Shop = @iShop and Department = @iDepartment and MaterialNo = @iMaterialNo)
	BEGIN
		INSERT INTO MaterialHandlingInspectionDetails
		(
			DEALER_ID,
			BRANCH_ID,
			TRANS_TYPE_ID,
			TRANS_TYPE_DESC,
			TRANS_ID,
			IMAGE_FILE_NAME,
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
			@in_imagefileName,
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


