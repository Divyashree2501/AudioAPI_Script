CREATE TABLE DP_MOBILE_AUDIO(
	DEALER_ID int NULL,
	BRANCH_ID int NULL,
	TRANS_TYPE_ID int NULL,
	TRANS_TYPE_DESC nvarchar(20) NULL,
	TRANS_ID bigint NULL,
	AUDIO_FILE_NAME nvarchar(100) NULL,
	CREATED_DATE datetime NULL,
	INSERTED_DATE datetime NULL
)