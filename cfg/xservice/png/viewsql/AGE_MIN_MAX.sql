REPLACE VIEW MDM.AGE_MIN_MAX
AS
LOCKING ROW FOR ACCESS
SEL A.MINAGE MIN_AGE,B.MAXAGE MAX_AGE, A.COUNTRY FROM
(SELECT
CHI.AV_DESCRIPTION MINAGE, PAR.AV_SHORT_NAME COUNTRY, CHI.AV_CODE AGECODE
FROM
MDM.ATTRIBUTE_VALUES PAR, MDM.ATTRIBUTE_VALUES_HIERARCHY HI, MDM.ATTRIBUTE_VALUES CHI
WHERE
CHI.AV_CODE IN ('MIN') AND
PAR.AV_ID = HI.AV_ID_PARENT AND
HI.AV_ID_CHILD = CHI.AV_ID
) A,
(SELECT
CHI.AV_DESCRIPTION MAXAGE, PAR.AV_SHORT_NAME COUNTRY, CHI.AV_CODE AGECODE
FROM
MDM.ATTRIBUTE_VALUES PAR, MDM.ATTRIBUTE_VALUES_HIERARCHY HI, MDM.ATTRIBUTE_VALUES CHI
WHERE
CHI.AV_CODE IN ('MAX') AND
PAR.AV_ID = HI.AV_ID_PARENT AND
HI.AV_ID_CHILD = CHI.AV_ID
) B WHERE A.COUNTRY=B.COUNTRY;