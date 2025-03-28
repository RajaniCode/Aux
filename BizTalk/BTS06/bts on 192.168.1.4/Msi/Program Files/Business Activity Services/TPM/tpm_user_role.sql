/*******************************************************************************
* Copyright (c) Microsoft Corporation.  All rights reserved.
* 
* THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
* WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
* WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
* THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
* AND INFORMATION REMAINS WITH THE USER.
********************************************************************************/
GRANT  EXECUTE  ON [dbo].[IsTemplate]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ClassDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ClsAttrib]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ColDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[CommerceServerCatalogs]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[AddressObject]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[ContactObject]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[Group]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[GroupMem]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MemAttrib]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MemberDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[Partner]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[RelDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SourceAttrib]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[SourceDef]  TO [tpm_user]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TableDef]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAddendumSendPorts]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetNonInheritedActorAgreements]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileCustomProps]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileMemAttrs]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileSources]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetRoles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_IsInRole]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAgreementList]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAgreementsFromTemplate]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_CreateBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelDataMember]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileGroupHelper]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileHelper]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfilePropHelper]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DeleteProfileRelationships]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetBizTalkRegistrationList]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetDataSourceDepends]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetDataSourceInfo]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileCatalogInfo]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileCatalogs]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileDomains]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileInfo]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileMember]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetProfileProps]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetRelatedProfiles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_RelateProfiles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UnrelateProfiles]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdateBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdateOutboxReceiveLocationUriQuery]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAgreementLegalText]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAgreementName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveProcessRole]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelDataObject]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfile]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileGroup]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileProperty]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DeleteBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DeployPartner]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetBizTalkRegistrationByPartner]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_GetPartnersFromBizTalkRegistration]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UndeployPartner]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteSendPort]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetActorAgreements]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetInheritedActorAgreements]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetPartnerEnlistments]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetPartnerSendPorts]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetSendPortsByGlobalPortName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAddendum]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAddendumRole]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveSendPort]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[UpdateSendPort]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_UpdateSendPortsQuery]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelDataSource]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[DeleteAgreement]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetAgreement]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetParameterValue]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[GetStructuredParameterValue]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAddendumName]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveLegalText]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveParameter]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[ShallowDeleteAgreement]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[sp_DelProfileCatalog]  TO [tpm_user]
GO

GRANT  EXECUTE  ON [dbo].[SaveAgreement]  TO [tpm_user]
GO
