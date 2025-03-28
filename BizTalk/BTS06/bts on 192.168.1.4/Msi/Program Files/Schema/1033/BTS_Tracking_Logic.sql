--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

--/--------------------------------------------------------------------------------------------------------------------
--//	Remove stored procedures that create the static health monitoring views
--/--------------------------------------------------------------------------------------------------------------------
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_CreateServiceFactsView]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_CreateServiceFactsView]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_CreateMessageFactsFindMsgViews]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_CreateMessageFactsFindMsgViews]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_CreateRealNamesView]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_CreateRealNamesView]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_DropViews]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_DropViews]

-- Stored procs for compiler
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetCube]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetCube]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_CreateCube]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_CreateCube]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_CreateItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_CreateItem]

-- Stored procs for service
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_InsertService]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_InsertService]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetHostId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetHostId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetMessageBoxId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetMessageBoxId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_ServiceBegin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_ServiceBegin]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_ServiceEnd]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_ServiceEnd]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_ServiceInsert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_ServiceInsert]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_ServiceException]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_ServiceException]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_ServiceError]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_ServiceError]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_ServiceTerminate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_ServiceTerminate]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_InsertServiceInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_InsertServiceInstance]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_CtxBegin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_CtxBegin]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_CtxEnd]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_CtxEnd]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_CtxInsert]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_CtxInsert]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_InsertCallChain]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_InsertCallChain]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_InsertMessageInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_InsertMessageInstance]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_InsertMessageEvent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_InsertMessageEvent]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_UpdateMessageEvent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_UpdateMessageEvent]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_MsgIn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_MsgIn]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_MsgOut]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_MsgOut]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetFieldNameId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetFieldNameId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetSchemaId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetSchemaId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetAdapterId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetAdapterId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetSigningSubjectId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetSigningSubjectId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetDecryptionSubjectId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetDecryptionSubjectId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetPartyId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetPartyId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetPortId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetPortId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetUrlId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetUrlId]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_InsertMessageField]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_InsertMessageField]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetServiceInstanceRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetServiceInstanceRecord]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_GetMessageInstanceRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_GetMessageInstanceRecord]

-- Stored procs for Admin
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[adm_RegisterGroupInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [adm_RegisterGroupInfo]
IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[adm_ChangeHostTrackingPrivilege]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [adm_ChangeHostTrackingPrivilege]

-- Stored procs for BRMA
if exists (select * from sysobjects where id = object_id(N'[dtasp_FindNamespaceWithID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_FindNamespaceWithID]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetCubeNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetCubeNames]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetCubeName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetCubeName]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetPartitionName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetPartitionName]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetServiceInstanceInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetServiceInstanceInfo]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetServiceInstanceMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetServiceInstanceMessages]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetMessageInstanceServices]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetMessageInstanceServices]

if exists (select * from sysobjects where id = object_id(N'[dtasp_GetMessageListForServiceInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetMessageListForServiceInstance]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetActivityId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetActivityId]

if exists (select * from sysobjects where id = object_id(N'[dtasp_GetSvcInstMsgBoxInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetSvcInstMsgBoxInfo]
if exists (select * from sysobjects where id = object_id(N'[dtasp_LoadServiceInstanceInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_LoadServiceInstanceInfo]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetServiceActions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_GetServiceActions]
if exists (select * from sysobjects where id = object_id(N'[dtasp_LocalCallParentServiceInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_LocalCallParentServiceInfo]
if exists (select * from sysobjects where id = object_id(N'[dtasp_LocalCallParentServiceActions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_LocalCallParentServiceActions]
if exists (select * from sysobjects where id = object_id(N'[dtasp_LocalCallLoopCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_LocalCallLoopCount]
if exists (select * from sysobjects where id = object_id(N'[dtasp_LocalCallGetActions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_LocalCallGetActions]
if exists (select * from sysobjects where id = object_id(N'[dtasp_LocalCallGetChildServiceSequence]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dtasp_LocalCallGetChildServiceSequence]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetMessageProperties]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetMessageProperties]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetSchemaNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetSchemaNames]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetPortNamesBySchemaName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetPortNamesBySchemaName]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetPartyNamesBySchemaName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetPartyNamesBySchemaName]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetMessageFieldNamesBySchemaName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetMessageFieldNamesBySchemaName]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetExceptionsInfoForSvcInst]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetExceptionsInfoForSvcInst]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetExceptionsCountForSvcInst]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetExceptionsCountForSvcInst]

-- Stored procs for Controls\HatDbHelpers.cs
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetServiceXsymBySvcId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetServiceXsymBySvcId]

-- Stored procs for testing
if exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dtasp_CleanHMData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dtasp_CleanHMData]
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetServiceXsymBySvcName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetServiceXsymBySvcName]

-- Stored procs for TPE
if exists (select * from sysobjects where id = object_id(N'[dtasp_GetServiceXsymByName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_GetServiceXsymByName]

-- Stored procs for Operations OM
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_GetRoutingDetails]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_GetRoutingDetails]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_GetServiceInstanceMessages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_GetServiceInstanceMessages]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_CountServiceInstanceActivities]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_CountServiceInstanceActivities]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_GetServiceInstanceActivity]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_GetServiceInstanceActivity]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_GetInstance]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ops_GetInstance]

-- stored procs for the archive and purge functionality
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_PurgeTrackingDatabase]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_PurgeTrackingDatabase]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_PurgeTrackingDatabase_Internal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_PurgeTrackingDatabase_Internal]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_PurgeAllCompletedTrackingData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) drop procedure [dbo].[dtasp_PurgeAllCompletedTrackingData]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_DropViews]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dbo].[dtasp_DropViews]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_BackupAndPurgeTrackingDatabase]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dbo].[dtasp_BackupAndPurgeTrackingDatabase]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_BackupTrackingDatabase]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dbo].[dtasp_BackupTrackingDatabase]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_ArchiveSuccessfull]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dbo].[dtasp_ArchiveSuccessfull]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_ArchiveFailed]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dbo].[dtasp_ArchiveFailed]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_GetLastArchiveLocation]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dbo].[dtasp_GetLastArchiveLocation]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtasp_TrimArchiveHistory]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1) DROP PROCEDURE [dbo].[dtasp_TrimArchiveHistory]
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtafn_ShouldArchiveDatabase]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1) drop function [dbo].[dtafn_ShouldArchiveDatabase]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtasp_RebuildIndexes]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dtasp_RebuildIndexes]
GO


--/===================================================================================/--
--/======= Create SQL role to control access to Health Monitoring stored procs =======/--
--/===================================================================================/--

if not exists (select * from dbo.sysusers where name = N'HM_EVENT_WRITER' and issqlrole = 1)
	EXEC dbo.sp_addrole N'HM_EVENT_WRITER'
GO


--========== Tracking stored procedures ==========--

/******we will drop the views up front and recreate at the end. We drop upfront so that it works the second time. The first time this would be a noop **/

CREATE PROCEDURE [dbo].[dtasp_DropViews]
AS
	--/--------------------------------------------------------------------------------------------------------
	--/	Remove health monitoring related static views
	--/--------------------------------------------------------------------------------------------------------
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_MessageFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_MessageFacts]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_FindMessageFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_FindMessageFacts]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_ServiceFacts]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_ServiceFacts]
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtav_RealNames]') and OBJECTPROPERTY(id, N'IsView') = 1) drop view [dbo].[dtav_RealNames]
GO
exec dtasp_DropViews
GO

--/--------------------------------------------------------------------------------------------------------
--	STORED PROCEDURE: dtasp_CreateServiceFactsView
--	VIEW: dtav_ServiceFacts
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_CreateServiceFactsView]
AS
	declare @sqlStatement nvarchar(4000)

	declare @nonlocalized_string_service nvarchar(50)
	set @nonlocalized_string_service = N'Service'

	declare @nonlocalized_string_service_instance nvarchar(50)
	set @nonlocalized_string_service_instance = N'ServiceInstance'

	declare @nonlocalized_string_name nvarchar(50)
	set @nonlocalized_string_name = N'Name'

	declare @nonlocalized_string_type nvarchar(50)
	set @nonlocalized_string_type = N'Type'

	declare @nonlocalized_string_state nvarchar(50)
	set @nonlocalized_string_state = N'State'

	declare @nonlocalized_string_exit_code nvarchar(50)
	set @nonlocalized_string_exit_code = N'ExitCode'

	declare @nonlocalized_string_error_info nvarchar(50)
	set @nonlocalized_string_error_info = N'ErrorInfo'

	declare @nonlocalized_string_start_time nvarchar(50)
	set @nonlocalized_string_start_time = N'StartTime'

	declare @nonlocalized_string_end_time nvarchar(50)
	set @nonlocalized_string_end_time = N'EndTime'

	declare @nonlocalized_string_duration nvarchar(50)
	set @nonlocalized_string_duration = N'Duration'

	declare @nonlocalized_string_host nvarchar(50)
	set @nonlocalized_string_host = N'Host'

	declare @nonlocalized_string_assembly_name nvarchar(50)
	set @nonlocalized_string_assembly_name = N'AssemblyName'

	declare @nonlocalized_string_assembly_version nvarchar(50)
	set @nonlocalized_string_assembly_version = N'AssemblyVersion'

	declare @nonlocalized_string_deployment_time nvarchar(50)
	set @nonlocalized_string_deployment_time = N'DeploymentTime'

	declare @nonlocalized_string_activity_id nvarchar(50)
	set @nonlocalized_string_activity_id = N'ActivityID'

	declare @nonlocalized_string_instance_id nvarchar(50)
	set @nonlocalized_string_instance_id = N'InstanceID'

	declare @nonlocalized_string_version_guid nvarchar(50)
	set @nonlocalized_string_version_guid = N'VersionGUID'

	declare @nonlocalized_string_service_guid nvarchar(50)
	set @nonlocalized_string_service_guid = N'ServiceGUID'

	declare @nonlocalized_string_service_class_guid nvarchar(50)
	set @nonlocalized_string_service_class_guid = N'ServiceClassGUID'

	declare @nonlocalized_string_default nvarchar(50)
	set @nonlocalized_string_default = N'<DEFAULT>'

	set @sqlStatement = N'CREATE VIEW [dbo].[dtav_ServiceFacts] WITH SCHEMABINDING'+ NCHAR(13) + 'AS' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'SELECT	[srv].[strServiceName]			AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_name + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srv].[strServiceType]			AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_type + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvS].[strState]				AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_state + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvI].[HRESULT]				AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_exit_code + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvI].[ErrorInfo]				AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_error_info + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvI].[dtStartTime]			AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_start_time + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvI].[dtEndTime]				AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_end_time + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	case when (DATEDIFF(second, srvI.dtStartTime, srvI.dtEndTime) > 2147483 )' + NCHAR(13) -- @maxDiffSeconds - 24 days, 20 hours, 31 minutes and 23.647 seconds
	set @sqlStatement = @sqlStatement + N'		then 2147483000' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		else DATEDIFF(millisecond, srvI.dtStartTime, srvI.dtEndTime)' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	end AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_duration + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[host].[strHostName]			AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_host + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srv].[strAssemblyName]			AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_assembly_name + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srv].[strAssemblyVersion]		AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_assembly_version + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srv].[dtDeploymentTime]		AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_deployment_time + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvI].[uidActivityId]			AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_activity_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvI].[uidServiceInstanceId]	AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_instance_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srv].[uidServiceId]			AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_version_guid + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srv].[uidNonVersionId]			AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_service_guid + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'	[srvI].[uidServiceClassId]		AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_service_class_guid + N']' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'FROM	[dbo].[dta_ServiceInstances] srvI ' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'WITH	(READPAST) ' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_Services] srv ON srvI.uidServiceId = srv.uidServiceId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_ServiceState] srvS ON srvI.nServiceStateId = srvS.nServiceStateId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_Host] host ON srvI.nHostId = host.nHostId' + NCHAR(13)

	exec(@sqlStatement)
	exec(N'GRANT SELECT ON [dbo].[dtav_ServiceFacts] TO BTS_ADMIN_USERS')
	exec(N'GRANT SELECT ON [dbo].[dtav_ServiceFacts] TO BTS_OPERATORS')
GO

--/--------------------------------------------------------------------------------------------------------
--	STORED PROCEDURE: dtasp_CreateMessageFactsView
--	VIEW: dtav_MessageFacts
--	VIEW: dtav_FindMessageFacts
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_CreateMessageFactsFindMsgViews]
AS
	declare @sqlStatement nvarchar(4000)

	declare @nonlocalized_string_event nvarchar(50)
	set @nonlocalized_string_event = N'Event'

	declare @nonlocalized_string_message_instance nvarchar(50)
	set @nonlocalized_string_message_instance = N'MessageInstance'

	declare @nonlocalized_string_service_instance nvarchar(50)
	set @nonlocalized_string_service_instance = N'ServiceInstance'

	declare @nonlocalized_string_service nvarchar(50)
	set @nonlocalized_string_service = N'Service'

	declare @nonlocalized_string_service_class_id nvarchar(50)
	set @nonlocalized_string_service_class_id = N'ServiceClassGUID'

	declare @nonlocalized_string_schema_name nvarchar(50)
	set @nonlocalized_string_schema_name = N'SchemaName'

	declare @nonlocalized_string_direction nvarchar(50)
	set @nonlocalized_string_direction = N'Direction'

	declare @nonlocalized_string_timestamp nvarchar(50)
	set @nonlocalized_string_timestamp = N'Timestamp'

	declare @nonlocalized_string_adapter nvarchar(50)
	set @nonlocalized_string_adapter = N'Adapter'

	declare @nonlocalized_string_url nvarchar(50)
	set @nonlocalized_string_url = N'URL'

	declare @nonlocalized_string_decryption_certificate nvarchar(50)
	set @nonlocalized_string_decryption_certificate = N'DecryptionCertificate'

	declare @nonlocalized_string_signature nvarchar(50)
	set @nonlocalized_string_signature = N'Signature'

	declare @nonlocalized_string_activity_id nvarchar(50)
	set @nonlocalized_string_activity_id = N'ActivityID'

	declare @nonlocalized_string_instance_id nvarchar(50)
	set @nonlocalized_string_instance_id = N'InstanceID'

	declare @nonlocalized_string_event_id nvarchar(50)
	set @nonlocalized_string_event_id = N'EventID'

	declare @nonlocalized_string_part_count nvarchar(50)
	set @nonlocalized_string_part_count = N'PartCount'

	declare @nonlocalized_string_size nvarchar(50)
	set @nonlocalized_string_size = N'Size'

	declare @nonlocalized_string_party nvarchar(50)
	set @nonlocalized_string_party = N'Party'

	declare @nonlocalized_string_port nvarchar(50)
	set @nonlocalized_string_port = N'Port'

	declare @nonlocalized_string_service_name nvarchar(50)
	set @nonlocalized_string_service_name = N'ServiceName'

	declare @nonlocalized_string_default nvarchar(50)
	set @nonlocalized_string_default = N'<DEFAULT>'

	set @sqlStatement = N'CREATE VIEW [dbo].[dtav_MessageFacts] WITH SCHEMABINDING' + NCHAR(13) + N'AS' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'SELECT	[dsn].[strSchemaName]			AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_schema_name + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[st].[strStatus]				AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_direction + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[evt].[dtTimestamp]				AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_timestamp + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[tr].[strAdapter]				AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_adapter + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[evt].[strUrl]					AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_url + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[ds].[strDecryptionSubject]		AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_decryption_certificate + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[ss].[strSigningSubject]		AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_signature + '],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[srvI].[uidActivityId]			AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_activity_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[srvI].[uidServiceInstanceId]	AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_instance_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[evt].[uidMessageInstanceId]	AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_instance_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[evt].[nEventId]				AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_event_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N' 		[evt].[nPartCount]				AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_part_count + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[evt].[nMessageSize]			AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_size + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[pn].[strPartyName]				AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_party + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[po].[strPortName]				AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_port + N']' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'FROM	[dbo].[dta_MessageInOutEvents] evt' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'WITH	(READPAST)' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_ServiceInstances] srvI ON evt.uidActivityId = srvI.uidActivityId AND evt.uidServiceInstanceId = srvI.uidServiceInstanceId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_MessageStatus] st ON st.nMessageStatusId = evt.nStatus' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_Adapter] tr ON tr.nAdapterId = evt.nAdapterId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_SchemaName] dsn ON dsn.nSchemaId = evt.nSchemaId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_SigningSubject] ss ON ss.nSigningSubjectId = evt.nSigningSubjectId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_DecryptionSubject] ds ON ds.nDecryptionSubjectId = evt.nDecryptionSubjectId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_PartyName] pn ON pn.nPartyId = evt.nPartyId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_PortName] po ON po.nPortId = evt.nPortId' + NCHAR(13)

	exec(@sqlStatement)
	exec(N'GRANT SELECT ON [dbo].[dtav_MessageFacts] TO BTS_ADMIN_USERS')
	exec(N'GRANT SELECT ON [dbo].[dtav_MessageFacts] TO BTS_OPERATORS')

	set @sqlStatement = N'CREATE VIEW [dbo].[dtav_FindMessageFacts] WITH SCHEMABINDING'  + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'AS' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'SELECT 	[mioe].[uidMessageInstanceId]	AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_instance_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[mioe].[uidServiceInstanceId]   AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_instance_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[mioe].[uidActivityId]			AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_activity_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[si].[uidServiceClassId]		AS [' + @nonlocalized_string_service + N'/' + @nonlocalized_string_service_class_id + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[sn].[strSchemaName]            AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_schema_name + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[ms].[strStatus]                AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_direction + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[po].[strPortName]            	AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_port + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[mioe].[dtTimestamp]			AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_timestamp + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[mioe].[nPartCount]               AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_part_count + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[mioe].[nMessageSize]             AS [' + @nonlocalized_string_message_instance + N'/' + @nonlocalized_string_size + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[tr].[strAdapter]               AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_adapter + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[ds].[strDecryptionSubject]     AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_decryption_certificate + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[ss].[strSigningSubject]        AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_signature + '],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[mioe].[strUrl]                  AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_url + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[pn].[strPartyName]          	AS [' + @nonlocalized_string_event + N'/' + @nonlocalized_string_party + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[svcs].[strServiceName]        	AS [' + @nonlocalized_string_service_instance + N'/' + @nonlocalized_string_service_name + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[mfv].[vtValue]	                AS [FieldValue],' + NCHAR(13) -- These values are not seen by the user.
	set @sqlStatement = @sqlStatement + N'		[mf].[nMessageFieldsId]         AS [FieldId]' + NCHAR(13)   -- These values are not seen by the user.
	set @sqlStatement = @sqlStatement + N'FROM	[dbo].[dta_MessageInOutEvents] mioe' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'WITH (READPAST)' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_Adapter] tr 			ON tr.nAdapterId = mioe.nAdapterId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_SchemaName] sn 		ON sn.nSchemaId = mioe.nSchemaId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_MessageFieldValues] mfv 	ON mfv.uidMessageInstanceId = mioe.uidMessageInstanceId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_MessageFields] mf            ON mf.nMessageFieldsId = mfv.nMessageFieldsId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_MessageStatus] ms		ON mioe.nStatus = ms.nMessageStatusId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_DecryptionSubject] ds        ON ds.nDecryptionSubjectId = mioe.nDecryptionSubjectId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_SigningSubject] ss 		ON ss.nSigningSubjectId = mioe.nSigningSubjectId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_PartyName] pn 		ON pn.nPartyId = mioe.nPartyId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_ServiceInstances] si 	ON mioe.uidActivityId = si.uidActivityId AND mioe.uidServiceInstanceId = si.uidServiceInstanceId' + CHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_Services] svcs 	        ON si.uidServiceId = svcs.uidServiceId' + CHAR(13)
	set @sqlStatement = @sqlStatement + N'LEFT JOIN [dbo].[dta_PortName] po 		ON po.nPortId = mioe.nPortId' + NCHAR(13)

	exec(@sqlStatement)
	exec(N'GRANT SELECT ON [dbo].[dtav_FindMessageFacts] TO BTS_ADMIN_USERS')

GO


--/--------------------------------------------------------------------------------------------------------
--/--
--	Both Health Monitoring and Business Related Views
--/--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
--	STORED PROCEDURE: dtasp_CreateRealNamesView
--	VIEW: dtav_RealNames
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_CreateRealNamesView]
AS
	declare @sqlStatement nvarchar(4000)

	declare @nonlocalized_string_item nvarchar(50)
	set @nonlocalized_string_item = N'Item'

	-- Localization Warning: Below, the term cube is the term used in Analysis Manager
	declare @nonlocalized_string_cube nvarchar(50)
	set @nonlocalized_string_cube = N'Cube'

	declare @nonlocalized_string_comment nvarchar(50)
	set @nonlocalized_string_comment = N'Comment'

	declare @nonlocalized_string_type nvarchar(50)
	set @nonlocalized_string_type = N'Type'

	declare @nonlocalized_string_real_name nvarchar(50)
	set @nonlocalized_string_real_name = N'RealName'

	set @sqlStatement = N'CREATE VIEW [dbo].[dtav_RealNames] WITH SCHEMABINDING' + NCHAR(13) + N'AS' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'SELECT	[it].[strFriendlyName]	AS [' + @nonlocalized_string_item + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[c].[strName]			AS [' + @nonlocalized_string_cube + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[c].[strComment]		AS [' + @nonlocalized_string_comment + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[itt].[strType]			AS [' + @nonlocalized_string_type + N'],' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'		[it].[strItemId]		AS [' + @nonlocalized_string_real_name + N']' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'FROM	[dbo].[dta_Items] it' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'WITH	(READPAST)' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'INNER JOIN [dbo].[dta_ItemTypes] itt ON it.nItemTypeId = itt.nItemTypeId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'INNER JOIN [dbo].[dta_Cubes] c ON c.nCubeId = it.nCubeId' + NCHAR(13)
	set @sqlStatement = @sqlStatement + N'WHERE it.nItemTypeId <> 6 -- No stored procedures in the view' + NCHAR(13)

	exec(@sqlStatement)
	exec(N'GRANT SELECT ON [dbo].[dtav_RealNames] TO BTS_ADMIN_USERS')
GO


--/--------------------------------------------------------------------------------------------------------
--
-- Stored procs for compiler, or reporting
--
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetCube
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetCube]
@strName	nvarchar(256)
AS
	SELECT	nCubeId,
			uidCubeId,
			strName,
			strComment,
			dtDeploymentTime,
			nCheckSum
	FROM	dta_Cubes
	WHERE	@strName = strName
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_InsertService
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_InsertService]
@uidServiceID		uniqueidentifier,
@uidNonVersionID	uniqueidentifier,
@strServiceName		nvarchar(256),
@strServiceType		nvarchar(256),
@strAssemblyName	nvarchar(1024),
@strAssemblyVersion	nvarchar(256),
@txtSymbol			ntext
AS
	declare @localized_string_orchestration_service_class AS nvarchar(256)
	declare @localized_string_pipeline_service_class AS nvarchar(256)
	declare @localized_string_msmqt_service_class AS nvarchar(256)
	declare @localized_string_messaging_service_class AS nvarchar(256)

	set @localized_string_orchestration_service_class  = N'Orchestration'
	set @localized_string_pipeline_service_class  = N'Pipeline'
	set @localized_string_msmqt_service_class  = N'MSMQT'
	set @localized_string_messaging_service_class  = N'Messaging'

	-- Set flag to determine whether to insert dta_ServiceSymbols record	
	declare @bInsertSymbol AS bit
	IF ( @strServiceType = N'HardCoded Service Class: Orchestration' )
		set @bInsertSymbol = 1
	ELSE
		set @bInsertSymbol = 0

	select @strServiceType = 
	case	@strServiceType
		when N'HardCoded Service Class: Orchestration' then @localized_string_orchestration_service_class
		when N'HardCoded Service Class: Pipeline' then @localized_string_pipeline_service_class
		when N'HardCoded Service Class: MSMQT' then @localized_string_msmqt_service_class
		when N'HardCoded Service Class: Messaging' then @localized_string_messaging_service_class
		else @strServiceType
	end

	-- Get deployment time		
	declare @dtDeploymentTime as datetime
	SET @dtDeploymentTime = GETUTCDATE()

	-- Update XSYM in dta_Services table
	UPDATE	dta_Services
	set		txtSymbol = @txtSymbol, dtDeploymentTime = @dtDeploymentTime
	WHERE	uidServiceId = @uidServiceID

	IF (@@ROWCOUNT = 0)
	BEGIN
		INSERT INTO dta_Services (
			uidServiceId,
			uidNonVersionId,
			strServiceName,
			strServiceType,
			strAssemblyName,
			strAssemblyVersion,
			dtDeploymentTime,
			txtSymbol
		)
		VALUES (
			@uidServiceID,
			@uidNonVersionID,
			@strServiceName,
			@strServiceType,
			@strAssemblyName,
			@strAssemblyVersion,
			@dtDeploymentTime,
			@txtSymbol
		)
	END
	
	-- Insert Symbols info into separate table	
	IF ( @bInsertSymbol = 1 )
	BEGIN
		INSERT INTO dta_ServiceSymbols (
			uidServiceId,
			txtSymbol,
			dtDeploymentTime
		)
		VALUES (
			@uidServiceID,
			@txtSymbol,
			@dtDeploymentTime
		)
	END

	declare @localized_string_neutral_assembly AS nvarchar(256)
	set @localized_string_neutral_assembly = N'None'

	-- Insert the version independent information
	IF (NOT EXISTS (SELECT TOP 1 uidServiceId FROM dta_Services WHERE uidServiceId = @uidNonVersionID))
	BEGIN
		INSERT INTO dta_Services (
			uidServiceId,
			uidNonVersionId,
			strServiceName,
			strServiceType,
			strAssemblyName,
			strAssemblyVersion,
			dtDeploymentTime,
			txtSymbol
		)
		VALUES (
			@uidNonVersionID,
			@uidNonVersionID,
			@strServiceName,
			@strServiceType,
			@localized_string_neutral_assembly,
			@localized_string_neutral_assembly,
			@dtDeploymentTime,
			null
		)
	END
GO
GRANT EXEC ON [dbo].[dtasp_InsertService] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_InsertCallChain
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_InsertCallChain]
@uidServiceInstanceId		uniqueidentifier,
@vtCallersActionId		nvarchar(60), -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@uidCallersServiceId		uniqueidentifier,
@nCallersServiceSequence	int,
@uidCalleesServiceId		uniqueidentifier,
@nCalleesServiceSequence	int,
@dtTimeStamp			datetime
AS

	INSERT INTO dta_CallChain (
		uidServiceInstanceId,
		vtCallersActionId,
		uidCallersServiceId,
		nCallersServiceSequence,
		uidCalleesServiceId,
		nCalleesServiceSequence,
		dtTimeStamp
	)
	VALUES
	(
		@uidServiceInstanceId,
		@vtCallersActionId,
		@uidCallersServiceId,
		@nCallersServiceSequence,
		@uidCalleesServiceId,
		@nCalleesServiceSequence,
		@dtTimeStamp
	)
GO
GRANT EXEC ON [dbo].[dtasp_InsertCallChain] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetHostId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetHostId]
@strHostName		nvarchar(256),
@nHostId			int out
AS
SET @nHostId = 0
IF (@strHostName IS NULL)
	RETURN

SELECT	@nHostId = nHostId
FROM	dta_Host
WITH	(NOLOCK)
WHERE	@strHostName = strHostName

IF (@nHostId <> 0)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strHostName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strHostName
	FROM	dta_Host
	WITH	(NOLOCK)
	WHERE 	@checksum = nHostId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_Host (nHostId, strHostName) values (@checksum, @strHostName)
		SET @nHostId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetHostId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetMessageBoxId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetMessageBoxId]
@strDBServer			nvarchar(63),
@strDBName				nvarchar(128),
@nMessageBoxId			int out
AS
SET @nMessageBoxId = 0
IF (@strDBServer IS NULL) OR (@strDBName IS NULL)
	RETURN

SELECT	@nMessageBoxId = nMessageBoxId
FROM	dta_MessageBox
WITH	(NOLOCK)
WHERE	(@strDBServer = strDBServer) AND (@strDBName = strDBName)

IF (@nMessageBoxId <> 0)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strDBServer, @strDBName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strDBServer
	FROM	dta_MessageBox
	WITH	(NOLOCK)
	WHERE 	@checksum = nMessageBoxId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_MessageBox (nMessageBoxId, strDBServer, strDBName) values (@checksum, @strDBServer, @strDBName)
		SET @nMessageBoxId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetMessageBoxId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_InsertServiceInstance
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_InsertServiceInstance]
@uidServiceInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@uidServiceID			uniqueidentifier,
@uidAgentSrvId			uniqueidentifier,
@uidServiceClassId		uniqueidentifier,
@dtStartTime			datetime,
@dtEndTime				datetime,
@strHostName			nvarchar(256),
@strDBServer			nvarchar(256),
@strDBName				nvarchar(256),
@nServiceStateId		int,
@nErrorCode				bigint,
@txtErrorInfo			ntext,
@bExceptionsOccurred	int
AS
	DECLARE @dtSTime datetime
	SET		@dtSTime = CONVERT(datetime, @dtStartTime, 101)

	DECLARE @dtETime datetime
	SET		@dtETime = CONVERT(datetime, @dtEndTime, 101)

	-- Get the application id
	DECLARE @nHostId int
	EXEC dtasp_GetHostId @strHostName, @nHostId out

	-- Get the message box id
	DECLARE @nMessageBoxId int
	EXEC dtasp_GetMessageBoxId @strDBServer, @strDBName, @nMessageBoxId out

	INSERT INTO dta_ServiceInstances
	(
		uidServiceInstanceId,
		uidActivityId,
		uidServiceId,
		uidAgentSrvId,
		uidServiceClassId,
		dtStartTime,
		dtEndTime,
		HRESULT,
		ErrorInfo,
		nHostId,
		nMessageBoxId,
		nGroupId,
		nServiceStateId,
		bExceptionsOccurred
	)
	VALUES
	(
		@uidServiceInstanceId,
		@uidActivityId,
		@uidServiceID,
		@uidAgentSrvId,
		@uidServiceClassId,
		@dtSTime,
		@dtETime,
		@nErrorCode,
		@txtErrorInfo,
		@nHostId,
		@nMessageBoxId,
		1,
		@nServiceStateId,
		@bExceptionsOccurred
	)
GO
GRANT EXEC ON [dbo].[dtasp_InsertServiceInstance] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_ServiceBegin
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_ServiceBegin]
@uidServiceInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@uidServiceId			uniqueidentifier,
@uidAgentSrvId			uniqueidentifier,
@uidServiceClassId		uniqueidentifier,
@nServiceSequence		int,
@dtStartTime			datetime,
@strHostName			nvarchar(256),
@strDBServer			nvarchar(256),
@strDBName				nvarchar(256),
@uidParentServiceId		uniqueidentifier,
@vtParentActionId		nvarchar(60), -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@nParentServiceSequence	int
AS
	IF (@uidParentServiceId is not null)
	BEGIN
		EXEC dtasp_InsertCallChain @uidServiceInstanceId, @vtParentActionId, @uidParentServiceId, @nParentServiceSequence, @uidServiceId, @nServiceSequence, @dtStartTime
	END

	IF EXISTS (SELECT TOP 1 uidServiceInstanceId FROM dta_ServiceInstances WHERE @uidActivityId = uidActivityId AND uidServiceInstanceId = @uidServiceInstanceId)
	BEGIN
		-- If this was a service which has terminated before due to some reason 
		-- and suspended itself, and now the message is resumed, we just
		-- reset some necessary values
		UPDATE	dta_ServiceInstances			-- Do not change the start time. This is still the previous instance
		SET		dtEndTime = null,				-- End Time of the instance: not ended in this case
				HRESULT = 0,					-- No error occured yet
				ErrorInfo = null,				-- No error string
				nServiceStateId = 1,			-- Service State: Started
				bExceptionsOccurred = 0			-- No exceptions occured
		WHERE	@uidActivityId = uidActivityId AND uidServiceInstanceId = @uidServiceInstanceId

		-- For orchestrations, there can be a top level exception recorded from the
		-- previous instance. These need to be removed.
		DELETE FROM dta_ServiceInstanceExceptions
		WHERE	uidServiceInstanceId = @uidServiceInstanceId AND
			@uidActivityId = uidActivityId AND
			0 <> bTopLevelException
	END
	ELSE
	BEGIN
		IF (@uidParentServiceId is null)
		BEGIN
			EXEC dtasp_InsertServiceInstance
				@uidServiceInstanceId,	-- Service Instance Id
				@uidActivityId,			-- Activity Id
				@uidServiceId,			-- Service Id
				@uidAgentSrvId,			-- Service Id used by the Agent
				@uidServiceClassId,		-- Service Class Id
				@dtStartTime,			-- Start Time of the instance (Conversion is made in the dtasp_InsertServiceInstance stored procedure)
				null,					-- End Time of the instance: not ended in this case
				@strHostName,			-- Host Name
				@strDBServer,			-- Message Box Database Server Name
				@strDBName,				-- Message Box Database Name
				1,						-- Service State: Started
				0,						-- No error occured yet
				null,					-- No error string
				0						-- No exceptions occured
		END
	END
GO
GRANT EXEC ON [dbo].[dtasp_ServiceBegin] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_ServiceEnd
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_ServiceEnd]
@uidInstanceId	uniqueidentifier,	-- All delayed SPs generate this
@uidActivityId	uniqueidentifier,
@dtEndTime		datetime
AS
	DECLARE	@dtTime datetime
	SET		@dtTime = CONVERT(datetime, @dtEndTime, 101)

	UPDATE	dta_ServiceInstances
	SET		dtEndTime = @dtTime,	-- End Time of the Instance
			dtInsertionTimeStamp = GetUTCDate(), --update the insertion timestamp to make sure we get this information in a backup
			nServiceStateId = 2,	-- Service State: Completed
			HRESULT = 0				-- Instance Completed successfully
	WHERE	uidServiceInstanceId = @uidInstanceId AND
		@uidActivityId = uidActivityId AND
		nServiceStateId <> 3	-- Instance has not terminated before. XLang/s sends
					-- an extra Service End event after termination. That
					-- shouldn't update the service state as completed.
GO
GRANT EXEC ON [dbo].[dtasp_ServiceEnd] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_ServiceInsert
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_ServiceInsert]
@uidServiceInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@uidServiceId			uniqueidentifier,
@uidAgentSrvId			uniqueidentifier,
@uidServiceClassId		uniqueidentifier,
@nServiceSequence		int,
@dtStartTime			datetime,
@dtEndTime			datetime,
@strHostName			nvarchar(256),
@strDBServer			nvarchar(256),
@strDBName				nvarchar(256),
@uidParentServiceId		uniqueidentifier,
@vtParentActionId		nvarchar(60), -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@nParentServiceSequence	int
AS

	declare @nServiceStateId int
	set @nServiceStateId = 2 --completed

	if (@dtEndTime <= 0)
	BEGIN
		set @dtEndTime = null
		set @nServiceStateId = 1 --started
	END

	IF (@uidParentServiceId is not null)
	BEGIN
		EXEC dtasp_InsertCallChain @uidServiceInstanceId, @vtParentActionId, @uidParentServiceId, @nParentServiceSequence, @uidServiceId, @nServiceSequence, @dtStartTime
	END
	ELSE IF EXISTS (SELECT TOP 1 uidServiceInstanceId FROM dta_ServiceInstances WHERE @uidActivityId = uidActivityId AND uidServiceInstanceId = @uidServiceInstanceId)
	BEGIN
		-- If this was a service which has terminated before due to some reason 
		-- and suspended itself, and now the message is resumed, we just
		-- reset some necessary values
		UPDATE	dta_ServiceInstances			-- Do not change the start time. This is still the previous instance
		SET	dtEndTime = @dtEndTime,			
			HRESULT = 0,				-- No error occured yet
			ErrorInfo = null,			-- No error string
			nServiceStateId = @nServiceStateId, 	-- Service State
			bExceptionsOccurred = 0			-- No exceptions occured
		WHERE	@uidActivityId = uidActivityId AND uidServiceInstanceId = @uidServiceInstanceId
	END
	ELSE	
	BEGIN
		EXEC dtasp_InsertServiceInstance
			@uidServiceInstanceId,		-- Service Instance Id
			@uidActivityId,			-- Activity Id
			@uidServiceId,			-- Service Id
			@uidAgentSrvId,			-- Service Id used by the Agent
			@uidServiceClassId,		-- Service Class Id
			@dtStartTime,			-- Start Time of the instance (Conversion is made in the dtasp_InsertServiceInstance stored procedure)
			@dtEndTime,			-- End Time of the instance
			@strHostName,			-- Host Name
			@strDBServer,			-- Message Box Database Server Name
			@strDBName,			-- Message Box Database Name
			@nServiceStateId,		-- Service State
			0,				-- No error occured yet
			null,				-- No error string
			0				-- No exceptions occured
	END
GO
GRANT EXEC ON [dbo].[dtasp_ServiceInsert] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_CtxBegin
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_CtxBegin]
@uidServiceInstanceId	uniqueidentifier,
@uidServiceId			uniqueidentifier,
@vtInstructionId		nvarchar(60), -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@nServiceSequence		int,
@nInternalSequence		int,
@dtStartTime			datetime,
@vtContext			sql_variant
AS
	INSERT INTO dta_DebugTrace
	(
		uidServiceInstanceId,
		vtInstructionId,
		nServiceSequence,
		nBeginInternalSequence,
		dtBeginTimeStamp
	)
	VALUES
	(
		@uidServiceInstanceId,
		@vtInstructionId,
		@nServiceSequence,
		@nInternalSequence,
		CONVERT(datetime, @dtStartTime, 101)
	)

GO
GRANT EXEC ON [dbo].[dtasp_CtxBegin] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_CtxEnd
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_CtxEnd]
@uidServiceInstanceId	uniqueidentifier,
@uidServiceId			uniqueidentifier,
@vtInstructionId		nvarchar(60), -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@nServiceSequence		int,
@nInternalSequence		int,
@dtEndTime			datetime,
@vtContext			sql_variant
AS

   	UPDATE dta_DebugTrace SET nEndInternalSequence = @nInternalSequence, dtEndTimeStamp = CONVERT(datetime, @dtEndTime, 101), dtInsertionTimeStamp = GetUTCDate()
	FROM dta_DebugTrace d WITH (INDEX(dta_DebugTrace_index_uidInstanceId)),
		( SELECT TOP 1 nDebugTraceId, uidServiceInstanceId, nServiceSequence
		  FROM dta_DebugTrace WITH (INDEX(dta_DebugTrace_index_uidInstanceId))
		  WHERE uidServiceInstanceId = @uidServiceInstanceId AND
			nServiceSequence = @nServiceSequence AND
			vtInstructionId = @vtInstructionId AND
			dtEndTimeStamp IS NULL
		  ORDER BY nBeginInternalSequence DESC
		) as t1
	WHERE d.uidServiceInstanceId = t1.uidServiceInstanceId AND
		d.nServiceSequence = t1.nServiceSequence AND
		d.nDebugTraceId = t1.nDebugTraceId

GO
GRANT EXEC ON [dbo].[dtasp_CtxEnd] TO HM_EVENT_WRITER
GO

CREATE PROCEDURE [dbo].[dtasp_CtxInsert] 
@uidServiceInstanceId	uniqueidentifier,
@vtInstructionId	nvarchar(60), -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@nServiceSequence	int,
@nInternalStartSequence	int,
@nInternalEndSequence	int,
@dtStartTime		datetime,
@dtEndTime		datetime
AS

INSERT INTO dta_DebugTrace
	(
		uidServiceInstanceId,
		vtInstructionId,
		nServiceSequence,
		nBeginInternalSequence,
		nEndInternalSequence,
		dtBeginTimeStamp,
		dtEndTimeStamp
	)
	VALUES
	(
		@uidServiceInstanceId,
		@vtInstructionId,
		@nServiceSequence,
		@nInternalStartSequence,
		@nInternalEndSequence,
		CONVERT(datetime, @dtStartTime, 101),
		CONVERT(datetime, @dtEndTime, 101)
	)
GO
GRANT EXEC ON [dbo].[dtasp_CtxInsert] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_ServiceError
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_ServiceError]
@uidServiceInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@nHResult				bigint,
@txtErrorInfo			ntext
AS
	UPDATE	dta_ServiceInstances
	SET	nServiceStateId = 1,			-- Service State: Started (if it failed, it cant be done)
		HRESULT = @nHResult,			-- Error Code
		ErrorInfo = @txtErrorInfo,		-- Error Information
		dtEndTime = null			-- If failure happened on routing, we marked this briefly as done so remove that mark
	WHERE	uidServiceInstanceId = @uidServiceInstanceId AND
		uidActivityId = @uidActivityId
GO
GRANT EXEC ON [dbo].[dtasp_ServiceError] TO HM_EVENT_WRITER
GO


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_ServiceException
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_ServiceException]
@uidServiceInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@uidServiceId			uniqueidentifier,
@uidAgentSrvId			uniqueidentifier,
@uidServiceClassId		uniqueidentifier,
@strHostName			nvarchar(256),
@dtEndTime				datetime,
@strDBServer			nvarchar(63),
@strDBName				nvarchar(128),
@txtErrorInfo			ntext,
@bTopLevelException		int
AS
    IF (0 <> @bTopLevelException)
		BEGIN
			UPDATE	dta_ServiceInstances
			SET		bExceptionsOccurred = 1,
					HRESULT = 0x80004005,	-- E_FAIL
					ErrorInfo = @txtErrorInfo
			WHERE	uidServiceInstanceId = @uidServiceInstanceId AND
				uidActivityId = @uidActivityId
			IF (@@ROWCOUNT = 0)
				BEGIN
					EXEC dtasp_InsertServiceInstance
						@uidServiceInstanceId,	-- Service Instance Id
						@uidActivityId,			-- Activity Id
						@uidServiceId,			-- Service Id
						@uidAgentSrvId,			-- Service Id used by the agent
						@uidServiceClassId,		-- Service Class Id
						@dtEndTime,			-- Start Time of the instance
						null,				-- End Time of the instance: No end time in this case
						@strHostName,			-- Host Name
						@strDBServer,			-- Message Box Database Server Name
						@strDBName,			-- Message Box Database Name
						1,				-- Service State: Started
						0x80004005,			-- Error Code
						@txtErrorInfo,			-- Error Information
						1				-- Exceptions occured
				END
		END
    ELSE
		BEGIN
			UPDATE	dta_ServiceInstances
			set		bExceptionsOccurred = 1
			WHERE	uidServiceInstanceId = @uidServiceInstanceId AND
				uidActivityId = @uidActivityId
			IF (@@ROWCOUNT = 0)
				BEGIN
					EXEC dtasp_InsertServiceInstance
						@uidServiceInstanceId,		-- Service Instance Id
						@uidActivityId,			-- Activity Id
						@uidServiceId,			-- Service Id
						@uidAgentSrvId,			-- Service Id used by the agent
						@uidServiceClassId,		-- Service Class Id
						@dtEndTime,			-- Start Time of the instance
						null,				-- End Time of the instance: No end time in this case
						@strHostName,			-- Host Name
						@strDBServer,			-- Message Box Database Server Name
						@strDBName,			-- Message Box Database Name
						1,				-- Service State: Started (It has not terminated yet)
						0,				-- Error Code
						null,				-- Error Information (Since this isn't top level exception, error code and error info are empty for the service level)
						1				-- Exceptions Occured
				END
		END
	
	INSERT INTO [dta_ServiceInstanceExceptions] (uidServiceInstanceId, uidActivityId, bTopLevelException, txtErrorInfo) 
	                                     VALUES (@uidServiceInstanceId, @uidActivityId, @bTopLevelException, @txtErrorInfo)
GO
GRANT EXEC ON [dbo].[dtasp_ServiceException] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_ServiceTerminate
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_ServiceTerminate]
@uidServiceInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@uidServiceId			uniqueidentifier,
@uidAgentSrvId			uniqueidentifier,
@uidServiceClassId		uniqueidentifier,
@strHostName			nvarchar(256),
@dtEndTime				datetime,
@strDBServer			nvarchar(256),
@strDBName				nvarchar(256),
@nErrorCode				bigint,
@txtErrorInfo			ntext
AS
	DECLARE @dtTime datetime
	SET		@dtTime = CONVERT(datetime, @dtEndTime, 101)

	IF (NOT EXISTS(SELECT TOP 1 uidServiceInstanceId FROM dta_ServiceInstances WHERE uidServiceInstanceId = @uidServiceInstanceId)) -- There is no service by that id
	BEGIN
		-- Check the service id
		IF @uidServiceId IS null
			SET @uidServiceId = @uidAgentSrvId

		EXEC dtasp_InsertServiceInstance
			@uidServiceInstanceId,	-- Service Instance Id
			@uidActivityId,			-- Activity Id
			@uidServiceId,			-- Service Id
			@uidAgentSrvId,			-- Service Id used by the agent
			@uidServiceClassId,		-- Service Class Id
			@dtEndTime,				-- Start Time of the instance
			@dtEndTime,				-- End Time of the instance
			@strHostName,			-- Host Name
			@strDBServer,			-- Message Box Database Server Name
			@strDBName,				-- Message Box Database Name
			3,						-- Terminated
			@nErrorCode,			-- Error Code
			@txtErrorInfo,			-- Error Information
			0						-- No exceptions occured
	END
		ELSE
	BEGIN
		-- Agent cannot send activity id, it can only send instance id
		-- The same instance can have multiple activities (MSMQT, HTTP Request Response)
		

		-- For Services that are already terminated, we will simply update the timestamp
		UPDATE	dta_ServiceInstances
		SET	dtEndTime = @dtTime		-- Termination time of the instance
		WHERE	(uidServiceInstanceId = @uidServiceInstanceId) AND (nServiceStateId = 3)

		-- Therefore, we are getting the instance id, looking at the uncompleted ones and
		-- put them in the terminated state
		UPDATE	dta_ServiceInstances
		SET		nServiceStateId = 3,		-- Terminated
				dtEndTime = @dtTime,		-- Termination time of the instance
				HRESULT = @nErrorCode,		-- Error code, if the instance has terminated due to an error, 0 otherwise
				ErrorInfo = @txtErrorInfo	-- Error info, if the instance has terminated due to an error, nothing otherwise
		WHERE	(uidServiceInstanceId = @uidServiceInstanceId) AND (nServiceStateId = 1)
	END

GO
GRANT EXEC ON [dbo].[dtasp_ServiceTerminate] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetSchemaId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetSchemaId]
@strName	nvarchar(256),
@nId		bigint out
AS
SET @nId = NULL
IF (@strName IS NULL) 
	RETURN

SELECT	@nId = nSchemaId
FROM	dta_SchemaName
WITH	(NOLOCK)
WHERE	@strName = strSchemaName

IF (@nId IS NOT NULL)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strSchemaName
	FROM	dta_SchemaName
	WITH	(NOLOCK)
	WHERE 	@checksum = nSchemaId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_SchemaName (nSchemaId, strSchemaName) values (@checksum, @strName)
		SET @nId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetSchemaId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetFieldNameId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetFieldNameId]
@strName		nvarchar(256),
@nType			int,
@strSchemaName	nvarchar(256),
@nId			bigint out,
@nSchemaId		bigint out
AS
SET @nId = null
SET @nSchemaId = null

EXEC dtasp_GetSchemaId @strSchemaName, @nSchemaId OUT
IF (@strName IS NULL) OR (@nType IS NULL)
	RETURN

SELECT	@nId = nMessageFieldsId,
		@nSchemaId = nSchemaId
FROM	dta_MessageFields
WITH	(NOLOCK)
WHERE	@nSchemaId = nSchemaId
		AND @strName = strFieldName 
		AND @nType = nFieldType

IF (@nId <> 0)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@nSchemaId, @strName, @nType)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strFieldName
	FROM	dta_MessageFields
	WITH	(NOLOCK)
	WHERE 	@checksum = nMessageFieldsId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_MessageFields (nMessageFieldsId, strFieldName, nSchemaId, nFieldType) VALUES (@checksum, @strName, @nSchemaId, @nType)
		SET @nId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetFieldNameId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetAdapterId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetAdapterId]
@strName	nvarchar(256),
@nId		bigint out
AS
SET @nId = NULL
IF (@strName IS NULL)
	RETURN

SELECT	@nId = nAdapterId
FROM	dta_Adapter
WITH	(NOLOCK)
WHERE	@strName = strAdapter

IF (@nId IS NOT NULL)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strAdapter
	FROM	dta_Adapter
	WITH	(NOLOCK)
	WHERE 	@checksum = nAdapterId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_Adapter (nAdapterId, strAdapter) values (@checksum, @strName)
		SET @nId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetAdapterId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetSigningSubjectId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetSigningSubjectId]
@strName	nvarchar(256),
@nId		bigint out
AS
SET @nId = NULL
IF (@strName IS NULL)
	RETURN

SELECT	@nId = nSigningSubjectId
FROM	dta_SigningSubject
WITH	(NOLOCK)
WHERE	@strName = strSigningSubject

IF (@nId IS NOT NULL)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strSigningSubject
	FROM	dta_SigningSubject
	WITH	(NOLOCK)
	WHERE 	@checksum = nSigningSubjectId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_SigningSubject (nSigningSubjectId, strSigningSubject) values (@checksum, @strName)
		SET @nId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetSigningSubjectId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetDecryptionSubjectId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetDecryptionSubjectId]
@strName	nvarchar(256),
@nId		bigint out
AS
SET @nId = NULL
IF (@strName IS NULL)
	RETURN

SELECT	@nId = nDecryptionSubjectId
FROM	dta_DecryptionSubject
WITH	(NOLOCK)
WHERE	@strName = strDecryptionSubject

IF (@nId IS NOT NULL)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strDecryptionSubject
	FROM	dta_DecryptionSubject
	WITH	(NOLOCK)
	WHERE 	@checksum = nDecryptionSubjectId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_DecryptionSubject (nDecryptionSubjectId, strDecryptionSubject) values (@checksum, @strName)
		SET @nId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetDecryptionSubjectId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetPartyId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetPartyId]
@strName	nvarchar(1024),
@nId		bigint out
AS
SET @nId = NULL
IF (@strName IS NULL)
	RETURN

SELECT	@nId = nPartyId
FROM	dta_PartyName
WITH	(NOLOCK)
WHERE	@strName = strPartyName

IF (@nId IS NOT NULL)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strPartyName
	FROM	dta_PartyName
	WITH	(NOLOCK)
	WHERE 	@checksum = nPartyId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_PartyName (nPartyId, strPartyName) values (@checksum, @strName)
		SET @nId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetPartyId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetPortId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetPortId]
@strName	nvarchar(256),
@nId		bigint out
AS
SET @nId = NULL
IF (@strName IS NULL)
	RETURN

SELECT	@nId = nPortId
FROM	dta_PortName
WITH	(NOLOCK)
WHERE	@strName = strPortName

IF (@nId IS NOT NULL)
	RETURN

DECLARE @checksum int
SET @checksum = CHECKSUM(@strName)

DECLARE @control int
SET @control = @checksum - 1

WHILE (@checksum <> @control)
BEGIN
	DECLARE @strTemp nvarchar(256)
	SET @strTemp = null

	SELECT	@strTemp = strPortName
	FROM	dta_PortName
	WITH	(NOLOCK)
	WHERE 	@checksum = nPortId

	IF (@strTemp IS null)
	BEGIN
		INSERT INTO dta_PortName (nPortId, strPortName) values (@checksum, @strName)
		SET @nId = @checksum
		RETURN
	END

	SET @checksum = (@checksum + 1) % cast(power(2.0, 31.0) - 1 AS int)
END
GO
GRANT EXEC ON [dbo].[dtasp_GetPortId] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_InsertMessageField
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dtasp_InsertMessageField
@uidServiceInstanceId	uniqueidentifier,
@uidMessageInstanceId	uniqueidentifier,
@strSchemaName			nvarchar(256),
@strName				nvarchar(256),
@nType					int,
@vtValue				sql_variant
AS
	DECLARE @nFieldId bigint
	DECLARE @nSchemaId bigint

	EXEC dtasp_GetFieldNameId @strName, @nType, @strSchemaName, @nFieldId OUT, @nSchemaId OUT

	IF (NOT EXISTS (SELECT TOP 1 nMessageFieldsId FROM dta_MessageFieldValues WITH (NOLOCK) WHERE nMessageFieldsId = @nFieldId AND uidMessageInstanceId = @uidMessageInstanceId))
	BEGIN
		IF (@nType = 0) SET @vtValue = @vtValue
		IF (@nType = 1) SET @vtValue = CAST(@vtValue AS bigint)
		IF (@nType = 2) SET @vtValue = CAST(@vtValue AS float)
		IF (@nType = 3) SET @vtValue = CAST(@vtValue AS datetime)
		IF (@nType = 4) SET @vtValue = CAST(@vtValue AS bit)
		IF (@nType = 5) SET @vtValue = CAST(@vtValue AS decimal(38,9))
		IF (@nType = 6) SET @vtValue = CAST(@vtValue AS real)

		INSERT INTO dta_MessageFieldValues (
			uidMessageInstanceId,
			nMessageFieldsId,
			nSchemaId,
			vtValue,
			nValueIndex
		)
		VALUES (
			@uidMessageInstanceId,
			@nFieldId,
			@nSchemaId,
			@vtValue,
			CHECKSUM(@vtValue)
		)
	END
GO
GRANT EXEC ON [dbo].[dtasp_InsertMessageField] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_InsertMessageEvent   
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_InsertMessageEvent]
@uidServiceInstanceId	uniqueidentifier,
@uidMessageInstanceId	uniqueidentifier,
@strSchemaName		nvarchar(256),
@nPartCount             int,
@nMessageSize           bigint,
@uidActivityId		uniqueidentifier,
@dtTimestamp		datetime,
@nStatus		int,
@strAdapter		nvarchar(256),
@strSigningSubject	nvarchar(256),
@strDecryptionSubject	nvarchar(256),
@strCorrelationToken	nvarchar(60),
@strURL			nvarchar(1024),
@strPartyName		nvarchar(256),
@strPortName            nvarchar(256)
AS
	DECLARE @nAdapterId bigint
	EXEC dtasp_GetAdapterId @strAdapter, @nAdapterId OUT

	DECLARE @nSigningSubjectId int
	EXEC dtasp_GetSigningSubjectId @strSigningSubject, @nSigningSubjectId OUT

	DECLARE @nDecryptionSubjectId int
	EXEC dtasp_GetDecryptionSubjectId @strDecryptionSubject, @nDecryptionSubjectId OUT

	DECLARE @nPartyId bigint
	EXEC dtasp_GetPartyId @strPartyName, @nPartyId OUT

	DECLARE @nPortId bigint
	EXEC dtasp_GetPortId @strPortName, @nPortId OUT
	
	DECLARE @nSchemaId bigint
	EXEC dtasp_GetSchemaId @strSchemaName, @nSchemaId OUT

	IF (@nMessageSize = -1)
		SET @nMessageSize = NULL

	INSERT INTO dta_MessageInOutEvents
	(
		uidServiceInstanceId,
		uidMessageInstanceId,
		nSchemaId,
		nPartCount,
		nMessageSize,
		uidActivityId,
		nAdapterId,
		nDecryptionSubjectId,
		nSigningSubjectId,
		strUrl,
		nPartyId,
		nPortId,
		dtTimestamp,
		nStatus
	)
	VALUES
	(
		@uidServiceInstanceId,
		@uidMessageInstanceId,
		@nSchemaId,
		@nPartCount,
		@nMessageSize,
		@uidActivityId,
		@nAdapterId,
		@nDecryptionSubjectId,
		@nSigningSubjectId,
		@strURL,
		@nPartyId,
		@nPortId,
		CONVERT(datetime, @dtTimestamp, 101), -- Insert it always as US
		@nStatus
	)
GO
GRANT EXEC ON [dbo].[dtasp_InsertMessageEvent] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_UpdateMessageEvent
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_UpdateMessageEvent]
@uidInstanceId			uniqueidentifier,
@uidMessageInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@dtTimestamp			datetime,
@nStatus				int
AS
	UPDATE	dta_MessageInOutEvents
	SET		dtTimestamp = CONVERT(datetime, @dtTimestamp, 101),
			nStatus = @nStatus
	FROM dta_MessageInOutEvents WITH (INDEX(dta_MessageInOutEvents_index_ActivityId))
	WHERE	(uidServiceInstanceId = @uidInstanceId AND uidActivityId = @uidActivityId)
		AND	(uidMessageInstanceId = @uidMessageInstanceId)
		AND (dtTimestamp = (SELECT MAX(dtTimestamp) FROM dta_MessageInOutEvents WHERE (uidServiceInstanceId = @uidInstanceId AND uidActivityId = @uidActivityId AND uidMessageInstanceId = @uidMessageInstanceId)))

	-- If this is MSMQT and the transmission is failing, the message id
	-- won't match, so nothing will be updated above. Special handle that case.
	IF ((@@ROWCOUNT = 0) AND (@nStatus = 5))
	BEGIN
	UPDATE	dta_MessageInOutEvents
	SET		dtTimestamp = CONVERT(datetime, @dtTimestamp, 101),
			nStatus = @nStatus
	FROM dta_MessageInOutEvents WITH (INDEX(dta_MessageInOutEvents_index_ActivityId))
	WHERE	(uidServiceInstanceId = @uidInstanceId AND uidActivityId = @uidActivityId) 
		AND (nStatus = 1)
		AND (dtTimestamp = (SELECT MAX(dtTimestamp) FROM dta_MessageInOutEvents WHERE (uidServiceInstanceId = @uidInstanceId AND uidActivityId = @uidActivityId)))
	END
GO
GRANT EXEC ON [dbo].[dtasp_UpdateMessageEvent] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_MsgIn
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_MsgIn]
@uidServiceInstanceId	uniqueidentifier,
@uidMessageInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@strCorrelationToken	nvarchar(60),
@strAdapter				nvarchar(256),
@strSchemaName			nvarchar(256),
@strURL					nvarchar(1024),
@strDecryptionSubject	nvarchar(256),
@strSigningSubject		nvarchar(256),
@dtTimestamp			datetime,
@strPartyName           nvarchar(256),
@strPortName            nvarchar(256),
@nPartCount             int,
@nMessageSize           bigint
AS

	EXEC dtasp_InsertMessageEvent
		@uidServiceInstanceId,
		@uidMessageInstanceId,
		@strSchemaName,
		@nPartCount,
		@nMessageSize,
		@uidActivityId,
		@dtTimestamp,
		0,	-- Receive
		@strAdapter,
		@strSigningSubject,
		@strDecryptionSubject,
		@strCorrelationToken,
		@strURL,
		@strPartyName,
		@strPortName
GO
GRANT EXEC ON [dbo].[dtasp_MsgIn] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_MsgOut
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_MsgOut]
@uidServiceInstanceId	uniqueidentifier,
@uidMessageInstanceId	uniqueidentifier,
@uidActivityId			uniqueidentifier,
@strCorrelationToken	nvarchar(60),
@strAdapter				nvarchar(256),
@strSchemaName			nvarchar(256),
@strURL					nvarchar(1024),
@strDecryptionSubject	nvarchar(256),
@strSigningSubject		nvarchar(256),
@dtTimestamp			datetime,
@strPartyName           nvarchar(256),
@strPortName            nvarchar(256),
@nPartCount             int,
@nMessageSize           bigint
AS


	EXEC dtasp_InsertMessageEvent
		@uidServiceInstanceId,
		@uidMessageInstanceId,
		@strSchemaName,
		@nPartCount,
		@nMessageSize,
		@uidActivityId,
		@dtTimestamp,
		1,	-- Send
		@strAdapter,
		@strSigningSubject,
		@strDecryptionSubject,
		@strCorrelationToken,
		@strURL,
		@strPartyName,
		@strPortName
GO
GRANT EXEC ON [dbo].[dtasp_MsgOut] TO HM_EVENT_WRITER
GO

--/--------------------------------------------------------------------------------------------------------
--/
--/	Reporting Related Stored Procedures
--/
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetServiceInstanceRecord
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetServiceInstanceRecord]
@uidServiceInstanceId	nvarchar(50)
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT *
	FROM dtav_ServiceFacts sf
	WHERE sf.[ServiceInstance/InstanceID] = @uidServiceInstanceId
GO
GRANT EXEC ON [dbo].[dtasp_GetServiceInstanceRecord] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetMessageInstanceRecord
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetMessageInstanceRecord]
@uidMessageInstanceId	nvarchar(50),
@strDirection			nvarchar(50)
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT *
	FROM dtav_MessageFacts mf
	WHERE mf.[MessageInstance/InstanceID] = @uidMessageInstanceId and mf.[Event/Direction] = @strDirection
GO
GRANT EXEC ON [dbo].[dtasp_GetMessageInstanceRecord] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
--/
--/ Administration Related Stored Procedures
--/
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: adm_RegisterGroupInfo
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[adm_RegisterGroupInfo]
@GroupName nvarchar(256)
AS
	-- Insert a new record to group table
	insert into dta_Group
	values (@GroupName)
GO
GRANT EXEC ON [dbo].[adm_RegisterGroupInfo] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: adm_GrantHostTrackingPrivilege
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[adm_ChangeHostTrackingPrivilege]
@ApplicationAccount nvarchar(128),
@ProtectType nvarchar(10) -- GRANT/DENY/REVOKE
AS
	declare @ErrCode as int
	set @ErrCode = 0

	exec @ErrCode = adm_ChangeRolePrivForUser 'BAM_EVENT_WRITER', @ApplicationAccount, @ProtectType
	if(@ErrCode != 0)
		return @ErrCode

	exec @ErrCode = adm_ChangeRolePrivForUser 'HM_EVENT_WRITER', @ApplicationAccount, @ProtectType
	if(@ErrCode != 0)
		return @ErrCode


GO
GRANT EXEC ON [dbo].[adm_ChangeHostTrackingPrivilege] TO BTS_ADMIN_USERS
GO


--/--------------------------------------------------------------------------------------------------------
--/
--/ Stored procs for HAT
--/
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetCubeNames
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetCubeNames]
AS
	set NOCOUNT ON
	set XACT_ABORT ON

	SET DEADLOCK_PRIORITY LOW

	SELECT	strItemId, 
			strFriendlyName 
	FROM	dta_Items
	WITH	(READPAST)
	WHERE	nItemTypeId = 5
GO
GRANT EXEC ON [dbo].[dtasp_GetCubeNames] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[dtasp_GetCubeNames] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetCubeName
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetCubeName]
	@nCubeId 	bigint
AS
    set NOCOUNT ON
    set XACT_ABORT ON

	SET DEADLOCK_PRIORITY LOW

	SELECT 	strItemId, 
			strFriendlyName 
	FROM 	dta_Items
	WITH	(READPAST)
	WHERE 	nCubeId = @nCubeId and nItemTypeId = 5
GO
GRANT EXEC ON [dbo].[dtasp_GetCubeName] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetServiceInstanceInfo
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetServiceInstanceInfo]
@uidInstanceId uniqueidentifier,
@activityId uniqueidentifier
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT *
	FROM dtav_ServiceFacts sf
	WHERE sf.[ServiceInstance/InstanceID] = @uidInstanceId AND sf.[ServiceInstance/ActivityID] = @activityId
GO
GRANT EXEC ON [dbo].[dtasp_GetServiceInstanceInfo] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[dtasp_GetServiceInstanceInfo] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetMessageListForServiceInstance
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetMessageListForServiceInstance]
	@instanceId		uniqueidentifier,
	@activityId		uniqueidentifier,
	@direction		int = -1
AS
	SET DEADLOCK_PRIORITY LOW

	IF (@direction = -1)
	BEGIN
		SELECT	* 
		FROM	dtav_MessageFacts mf
		WITH	(READPAST)
		INNER JOIN dta_MessageStatus ms on mf.[Event/Direction] = ms.strStatus
		WHERE	[ServiceInstance/ActivityID] = @activityId AND [ServiceInstance/InstanceID] = @instanceId
		ORDER BY mf.[Event/Timestamp] ASC, ms.nMessageStatusId ASC
	END
	ELSE
	BEGIN
		SELECT	* 
		FROM	dtav_MessageFacts mf
		WITH	(READPAST)
		INNER JOIN dta_MessageStatus ms on mf.[Event/Direction] = ms.strStatus
		INNER JOIN dta_MessageInOutEvents mioe ON mioe.uidActivityId = mf.[ServiceInstance/ActivityID] AND mioe.uidServiceInstanceId = mf.[ServiceInstance/InstanceID]
		WHERE	(mf.[ServiceInstance/ActivityID] = @activityId) AND (mf.[ServiceInstance/InstanceID] = @instanceId) AND (mf.[MessageInstance/InstanceID] = mioe.uidMessageInstanceId)
		ORDER BY mf.[Event/Timestamp] ASC, ms.nMessageStatusId ASC
	END
GO
GRANT EXEC ON [dbo].[dtasp_GetMessageListForServiceInstance] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[dtasp_GetMessageListForServiceInstance] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetServiceInstanceMessages
--	This stored procedure is used to get the tracked message information
--	for message body tracking
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetServiceInstanceMessages]
@uidServiceInstanceId	uniqueidentifier,
@uidActivityId uniqueidentifier
AS
	SET DEADLOCK_PRIORITY LOW

	IF (@uidActivityId IS NOT NULL)
	BEGIN
		SELECT	moe.uidServiceInstanceId,
			moe.uidMessageInstanceId,
			moe.nMessageSize
		FROM	dta_MessageInOutEvents moe
		WITH	(READPAST)
		WHERE	moe.uidServiceInstanceId = @uidServiceInstanceId AND moe.uidActivityId = @uidActivityId
		ORDER BY moe.dtTimestamp ASC, moe.nStatus
	END
	ELSE
	BEGIN	
		SELECT	moe.uidServiceInstanceId,
			moe.uidMessageInstanceId,
			moe.nMessageSize
		FROM	dta_MessageInOutEvents moe
		WITH	(READPAST)
		WHERE	moe.uidServiceInstanceId = @uidServiceInstanceId
		ORDER BY moe.dtTimestamp ASC, moe.nStatus
	END
GO
GRANT EXEC ON [dbo].[dtasp_GetServiceInstanceMessages] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
--/ STORED PROCEDURE: dtasp_GetMessageInstanceServices
--/
--/ It accepts the following parameters
--/		message id  
--/		the activity id of the instance that has processed
--/		direction (optional)
--/
--/ Returns
--/		All the services related to this message except for the source instance
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetMessageInstanceServices]
	@uidServiceInstanceId   uniqueidentifier,
	@uidMessageInstanceid	uniqueidentifier,
	@uidSourceActivityId	uniqueidentifier,
	@direction				int = -1
AS
	SET DEADLOCK_PRIORITY LOW

	IF (@direction = 0)
	BEGIN
		SELECT	sf.* 
		FROM	dtav_ServiceFacts as sf 
		WITH	(READPAST)
		INNER JOIN dta_MessageInOutEvents mioe ON sf.[ServiceInstance/ActivityID] = mioe.uidActivityId AND sf.[ServiceInstance/InstanceID] = mioe.uidServiceInstanceId
		WHERE	mioe.uidMessageInstanceId = @uidMessageInstanceid 
			AND mioe.nStatus = 0
			AND mioe.uidActivityId <> @uidSourceActivityId
		ORDER BY mioe.dtTimestamp ASC, mioe.nStatus ASC
	END
	ELSE
	BEGIN
		SELECT	sf.* 
		FROM	dtav_ServiceFacts as sf 
		WITH	(READPAST)
		INNER JOIN dta_MessageInOutEvents mioe ON sf.[ServiceInstance/ActivityID] = mioe.uidActivityId
		WHERE	mioe.uidMessageInstanceId = @uidMessageInstanceid 
			AND mioe.nStatus <> 0
			AND mioe.uidActivityId <> @uidSourceActivityId
		ORDER BY mioe.dtTimestamp ASC, mioe.nStatus ASC
	END
GO
GRANT EXEC ON [dbo].[dtasp_GetMessageInstanceServices] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[dtasp_GetMessageInstanceServices] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetActivityId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetActivityId]
@uidInstanceId	uniqueidentifier,
@uidMessageId	uniqueidentifier
AS
	SET DEADLOCK_PRIORITY LOW

	IF (@uidMessageId is not null)
	BEGIN
		SELECT	DISTINCT uidActivityId
		FROM	dta_MessageInOutEvents
		WITH	(READPAST)
		WHERE	(uidServiceInstanceId = @uidInstanceId) 
			AND	(uidMessageInstanceId = @uidMessageId)
	END
	ELSE
	BEGIN
		SELECT	DISTINCT uidActivityId
		FROM	dta_ServiceInstances
		WITH	(READPAST)
		WHERE	(uidServiceInstanceId = @uidInstanceId)
	END
GO
GRANT EXEC ON [dbo].[dtasp_GetActivityId] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[dtasp_GetActivityId] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetSvcInstMsgBoxInfo
--/--------------------------------------------------------------------------------------------------------
CREATE  PROCEDURE [dbo].[dtasp_GetSvcInstMsgBoxInfo]
@instids   nvarchar(3000)
AS
	SET DEADLOCK_PRIORITY LOW

declare @qry nvarchar(800)
set @qry = N'
select 
	si.uidServiceInstanceId, 
	si.uidAgentSrvId,
	si.uidServiceClassId,
	grp.strGroupName, 
	mb.strDBServer,
	mb.strDBName,
	ap.strHostName, 
	sv.uidServiceId,
	si.nServiceStateId,
	sv.strServiceName,
	sv.uidNonVersionId
from dta_ServiceInstances as si
join dta_Services as sv on si.uidServiceId = sv.uidServiceId
join dta_Group as grp on grp.nGroupId = 1
join dta_MessageBox as mb on si.nMessageBoxId = mb.nMessageBoxId
join dta_Host as ap on si.nHostId = ap.nHostId
where si.uidServiceInstanceId in (
'
declare @sql nvarchar(4000)
set @sql = @qry + @instids + N')'
EXEC sp_executesql @sql
GO
GRANT EXEC ON [dbo].[dtasp_GetSvcInstMsgBoxInfo] TO BTS_ADMIN_USERS
GO


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetExceptionsInfoForSvcInst
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetExceptionsInfoForSvcInst]
@uidInstanceId			uniqueidentifier
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT	
			exc.bTopLevelException,
			exc.txtErrorInfo
	FROM	dta_ServiceInstanceExceptions exc
	WITH	(READPAST)
	WHERE 	(@uidInstanceId = exc.uidServiceInstanceId)
GO
GRANT EXEC ON [dbo].[dtasp_GetExceptionsInfoForSvcInst] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetExceptionsCountForSvcInst
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetExceptionsCountForSvcInst]
@uidInstanceId			uniqueidentifier
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT	COUNT(exc.bTopLevelException)	AS [nNumberOfExceptions]
	FROM	[dbo].[dta_ServiceInstanceExceptions] exc 
	WITH	(READPAST)
	WHERE	exc.uidServiceInstanceId = @uidInstanceId
GO
GRANT EXEC ON [dbo].[dtasp_GetExceptionsCountForSvcInst] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[dtasp_GetExceptionsCountForSvcInst] TO BTS_OPERATORS
GO


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_LoadServiceInstanceInfo
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_LoadServiceInstanceInfo]
@uidInstanceId uniqueidentifier,
@uidActivityId uniqueidentifier
AS
	SET NOCOUNT ON

	SET DEADLOCK_PRIORITY LOW

	SELECT	nServiceStateId as 'ServiceState'
	FROM	dta_ServiceInstances
	WITH	(READPAST)
	WHERE	uidActivityId = @uidActivityId AND uidServiceInstanceId = @uidInstanceId
GO
GRANT EXEC ON [dbo].[dtasp_LoadServiceInstanceInfo] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[dtasp_LoadServiceInstanceInfo] TO BTS_OPERATORS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_LocalCallGetChildServiceSequence
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_LocalCallGetChildServiceSequence]
@uidInstanceId			uniqueidentifier,
@uidParentServiceId		uniqueidentifier = null,
@nParentServiceSequence	int = 0,
@vtParentActionId		nvarchar(60) = null, -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@nIndex					int = 0
AS
	SET DEADLOCK_PRIORITY LOW

	DECLARE sequence_list CURSOR FOR
	SELECT nCalleesServiceSequence
	FROM	dta_CallChain
	WITH	(READPAST)
	WHERE 	(@uidParentServiceId = uidCallersServiceId) and
		(@uidInstanceId = uidServiceInstanceId) and 
		(@vtParentActionId = vtCallersActionId) and 
		(@nParentServiceSequence = nCallersServiceSequence)
	ORDER BY nCalleesServiceSequence

	DECLARE @target_sequence int
	DECLARE @count int
	SET @target_sequence = 0
	SET @count = 1
	OPEN sequence_list
	FETCH NEXT FROM sequence_list INTO @target_sequence
	WHILE ((@@fetch_status = 0) AND (@count < @nIndex))
	BEGIN
		SET @count = @count + 1
		FETCH NEXT FROM sequence_list into @target_sequence
	END
	CLOSE sequence_list
	DEALLOCATE sequence_list

	IF (@@fetch_status <> 0)
		SET @target_sequence = 0

	SELECT @target_sequence as ChildSequence
GO
GRANT EXEC ON [dbo].[dtasp_LocalCallGetChildServiceSequence] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_LocalCallGetActions
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_LocalCallGetActions]
@uidInstanceId	uniqueidentifier,
@nSequence		int
AS
	SET DEADLOCK_PRIORITY LOW
	SELECT  t.vtInstructionId,
		t.nInternalSequence,
		t.nAction,
		t.dtTimeStamp,
		t.vtContext
	FROM (
		SELECT	s.uidServiceId,
			dt.uidServiceInstanceId,
			dt.vtInstructionId,
			1 as nAction,
			dt.dtBeginTimeStamp as dtTimeStamp,
			dt.nServiceSequence,
			dt.nBeginInternalSequence as nInternalSequence,
			NULL as vtContext
		FROM	dta_ServiceInstances s
		JOIN dta_DebugTrace dt WITH (READPAST) ON dt.uidServiceInstanceId = s.uidServiceInstanceId AND dt.nServiceSequence = @nSequence
		WHERE s.uidServiceInstanceId = @uidInstanceId AND s.uidActivityId = @uidInstanceId
				
		UNION ALL
		SELECT	s.uidServiceId,
			dt.uidServiceInstanceId,
			dt.vtInstructionId,
			2 as nAction,
			dt.dtEndTimeStamp as dtTimeStamp,
			dt.nServiceSequence,
			dt.nEndInternalSequence as nInternalSequence,
			NULL as vtContext
		FROM	dta_ServiceInstances s
		JOIN dta_DebugTrace dt WITH (READPAST) ON dt.uidServiceInstanceId = s.uidServiceInstanceId AND dt.nServiceSequence = @nSequence AND (dtEndTimeStamp IS NOT NULL)
		WHERE s.uidServiceInstanceId = @uidInstanceId AND s.uidActivityId = @uidInstanceId
		--we need to also include the start and end events for the root service since that is not tracked in the DebugTrace table
		UNION ALL
		SELECT	TOP 1
			s.uidServiceId,
			s.uidServiceInstanceId,
			'e211a116-cb8b-44e7-a052-0de295aa0001' as vtInstructionId, --this is the hardcoded id for the body shape. It is in Definitions.cs in the btt_compiler folder
			1 as nAction,
			s.dtStartTime as dtTimeStamp,
			1 as nServiceSequence,
			1 as nInternalSequence,
			NULL as vtContext
		FROM	dta_ServiceInstances s
		WHERE s.uidServiceInstanceId = @uidInstanceId AND s.uidActivityId = @uidInstanceId AND @nSequence = 0
		
		UNION ALL

		SELECT	TOP 1
			s.uidServiceId,
			s.uidServiceInstanceId,
			'e211a116-cb8b-44e7-a052-0de295aa0001' as vtInstructionId, --this is the hardcoded id for the body shape. It is in Definitions.cs in the btt_compiler folder
			2 as nAction,
			s.dtEndTime as dtTimeStamp,
			1 as nServiceSequence,
			t2.nInternalSequence,
			NULL as vtContext
		FROM	dta_ServiceInstances s,
			(
   			   SELECT MAX(t.nInternalSequence) + 1 as nInternalSequence, @uidInstanceId as uidServiceInstanceId
    			   FROM ( 
				 SELECT MAX(nBeginInternalSequence) as nInternalSequence FROM dta_DebugTrace WHERE uidServiceInstanceId = @uidInstanceId AND nServiceSequence = 0
				 UNION ALL
				 SELECT MAX(nEndInternalSequence) as nInternalSequence FROM dta_DebugTrace WHERE uidServiceInstanceId = @uidInstanceId AND nServiceSequence = 0
				 UNION ALL
				 SELECT 1 as nInternalSequence --added to handle case of empty DebugTrace Table
				) as t
    			 ) as t2
		WHERE s.uidServiceInstanceId = @uidInstanceId AND s.uidActivityId = @uidInstanceId AND s.dtEndTime IS NOT NULL AND s.uidServiceInstanceId = t2.uidServiceInstanceId AND @nSequence = 0
		
	) as t
	ORDER BY t.nInternalSequence

GO
GRANT EXEC ON [dbo].[dtasp_LocalCallGetActions] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetServiceActions
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetServiceActions]
@uidInstanceId			uniqueidentifier,
@uidParentServiceId		uniqueidentifier = null,
@nParentServiceSequence	int = 0,
@vtParentActionId		nvarchar(60) = null, -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
@uidServiceId			uniqueidentifier,
@nIndex					int = 0
AS
	SET DEADLOCK_PRIORITY LOW

	-- if the parent service id is null, this means that this is the root service
	IF (@uidParentServiceId is null)
	BEGIN
		
		exec [dbo].[dtasp_LocalCallGetActions] @uidInstanceId, 0		

		RETURN
	END
	

	-- Get all the service sub instances (ServiceSequence) called
	DECLARE sequence_list CURSOR FOR
	SELECT 	DISTINCT dt.nServiceSequence
	FROM	dta_DebugTrace dt
	WITH	(READPAST)
	INNER JOIN dta_CallChain cc ON cc.uidServiceInstanceId = dt.uidServiceInstanceId AND
					(@uidParentServiceId = cc.uidCallersServiceId) and
					(@vtParentActionId = cc.vtCallersActionId) and 
					(@nParentServiceSequence = cc.nCallersServiceSequence) and
					(@uidServiceId = cc.uidCalleesServiceId)
	WHERE (@uidInstanceId = dt.uidServiceInstanceId)
	ORDER BY dt.nServiceSequence

	-- Get the correct ServiceSequence in a loop
	DECLARE @target_sequence int
	DECLARE @count int
	SET @target_sequence = 0
	SET @count = 0
	OPEN sequence_list
	FETCH NEXT FROM sequence_list into @target_sequence
	WHILE ((@@fetch_status <> -1) and (@count < @nIndex))
	BEGIN
		SET @count = @count + 1
		FETCH NEXT FROM sequence_list into @target_sequence
	END
	CLOSE sequence_list
	DEALLOCATE sequence_list

	-- if still we couldn't reach the index that the user asks for, then return nothing back
	IF (@count < @nIndex)
		RETURN

	exec [dbo].[dtasp_LocalCallGetActions] @uidInstanceId, @target_sequence

GO
GRANT EXEC ON [dbo].[dtasp_GetServiceActions] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_LocalCallParentServiceInfo
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_LocalCallParentServiceInfo]
@uidInstanceId			uniqueidentifier,
@nChildServiceSequence	int
AS
	SET DEADLOCK_PRIORITY LOW

	if (@nChildServiceSequence = 0)
	BEGIN
		--they want information about the root service instance
		SELECT 	NULL as nCallersServiceSequence,
			srv.uidServiceId as uidCalleesServiceId,
			NULL as vtCallersActionId,	
			srv.strServiceName,
			srv.strAssemblyName,
			NULL as uidCallersServiceId ,
			srv.uidNonVersionId,
			NULL as strParentServiceName
		FROM dta_ServiceInstances s
		INNER JOIN dta_Services srv ON (s.uidServiceId = srv.uidServiceId)
		WHERE 	(s.uidServiceInstanceId = @uidInstanceId) AND (s.uidActivityId = @uidInstanceId)
	END
	ELSE
	BEGIN
		SELECT	ch.nCallersServiceSequence,
			ch.uidCalleesServiceId,
			ch.vtCallersActionId,
			srv.strServiceName,
			srv.strAssemblyName,
			ch.uidCallersServiceId,
			srv.uidNonVersionId,
			psrv.strServiceName as strParentServiceName
		FROM	dta_CallChain ch
		WITH	(READPAST)
		INNER JOIN dta_Services srv ON (ch.uidCalleesServiceId = srv.uidServiceId)
		LEFT JOIN dta_Services psrv ON (ch.uidCallersServiceId = psrv.uidServiceId)
		WHERE 	(ch.uidServiceInstanceId = @uidInstanceId) and
			(ch.nCalleesServiceSequence = @nChildServiceSequence)
	END

GO
GRANT EXEC ON [dbo].[dtasp_LocalCallParentServiceInfo] TO BTS_ADMIN_USERS
GO


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_LocalCallParentServiceActions
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_LocalCallParentServiceActions]
@uidInstanceId			uniqueidentifier,
@uidChildServiceId		uniqueidentifier,
@nChildServiceSequence	int
AS
	SET DEADLOCK_PRIORITY LOW

	DECLARE @uidCallersServiceId uniqueidentifier
	DECLARE @nCallersServiceSequence int

	SELECT	@uidCallersServiceId = uidCallersServiceId,
		@nCallersServiceSequence = nCallersServiceSequence
	FROM	dta_CallChain
	WITH	(READPAST)
	WHERE 	(uidServiceInstanceId = @uidInstanceId) and
		(uidCalleesServiceId = @uidChildServiceId) and 
		(nCalleesServiceSequence = @nChildServiceSequence)

	exec [dbo].[dtasp_LocalCallGetActions] @uidInstanceId, @nCallersServiceSequence

GO
GRANT EXEC ON [dbo].[dtasp_LocalCallParentServiceActions] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_LocalCallLoopCount
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_LocalCallLoopCount]
@uidInstanceId			uniqueidentifier,
@uidChildServiceId		uniqueidentifier,
@nChildServiceSequence	int,
@vtParentActionId		nvarchar(60) -- TO DO: Convert this to uniqueidentifier. Interceptor somehow gets a string value for this.
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT	COUNT(*) AS LoopCount
	FROM	dta_CallChain
	WITH	(READPAST)
	WHERE 	(uidServiceInstanceId = @uidInstanceId) and
			(uidCalleesServiceId = @uidChildServiceId) and 
			(nCalleesServiceSequence <= @nChildServiceSequence) and
			(vtCallersActionId = @vtParentActionId)
GO
GRANT EXEC ON [dbo].[dtasp_LocalCallLoopCount] TO BTS_ADMIN_USERS
GO


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetMessageProperties
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetMessageProperties]
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT DISTINCT [strFieldName] as [FieldName]
	FROM	dta_MessageFields
	WITH	(READPAST)
GO
GRANT EXEC ON [dbo].[dtasp_GetMessageProperties] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetSchemaNames
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetSchemaNames]
AS
	SET DEADLOCK_PRIORITY LOW

	SELECT DISTINCT strSchemaName 
	FROM	dta_SchemaName, 
			dta_MessageInOutEvents
	WITH	(READPAST)
	WHERE	dta_SchemaName.nSchemaId = dta_MessageInOutEvents.nSchemaId
	ORDER BY strSchemaName
GO
GRANT EXEC ON [dbo].[dtasp_GetSchemaNames] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetPortNamesBySchemaName
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetPortNamesBySchemaName]
   @SchemaId nvarchar(256) = null
AS
	SET DEADLOCK_PRIORITY LOW

	IF (@SchemaId is null)
	BEGIN
		-- No filtering by schema name
		SELECT	strPortName
		FROM	dta_PortName
		WITH	(READPAST)
	END
	ELSE
	BEGIN
		-- Filtered by schema name
		SELECT DISTINCT pn.strPortName 
		FROM	dta_MessageInOutEvents mioe, 
				dta_PortName pn, 
				dta_SchemaName sn
		WITH	(READPAST)
		WHERE	mioe.nSchemaId = sn.nSchemaId 
	        AND	sn.strSchemaName = @SchemaId
	        AND	mioe.nPortId = pn.nPortId
		ORDER BY pn.strPortName
	END
GO
GRANT EXEC ON [dbo].[dtasp_GetPortNamesBySchemaName] TO BTS_ADMIN_USERS
GO


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetPartyNamesBySchemaName
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetPartyNamesBySchemaName]
   @SchemaId nvarchar(256) = null
AS
	SET DEADLOCK_PRIORITY LOW

	IF (@SchemaId is null)
	BEGIN
		-- No filtering by schema name
		SELECT	strPartyName
		FROM	dta_PartyName
		WITH	(READPAST)
	END
	ELSE
	BEGIN
		-- Filtered by schema name
		SELECT DISTINCT pn.strPartyName 
		FROM 	dta_MessageInOutEvents mioe, 
				dta_SchemaName sn, 
				dta_PartyName pn
		WITH	(READPAST)
		WHERE 	mioe.nSchemaId = sn.nSchemaId
			AND	sn.strSchemaName = @SchemaId 
			AND	mioe.nPartyId = pn.nPartyId
		ORDER BY strPartyName
	END
GO
GRANT EXEC ON [dbo].[dtasp_GetPartyNamesBySchemaName] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetMessageFieldNamesBySchemaName
--/--------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[dtasp_GetMessageFieldNamesBySchemaName]
   @SchemaName nvarchar(256)
AS
	SET DEADLOCK_PRIORITY LOW

    SELECT 	DISTINCT 
			mf.strFieldName, 
			mf.nFieldType, 
			mf.nMessageFieldsId 
    FROM	dta_SchemaName dsn, 
			dta_MessageFields mf
	WITH	(READPAST)
    WHERE 	dsn.nSchemaId = mf.nSchemaId 
        AND dsn.strSchemaName = @SchemaName
    ORDER BY mf.strFieldName, mf.nMessageFieldsId
GO
GRANT EXEC ON [dbo].[dtasp_GetMessageFieldNamesBySchemaName] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
--/
--/ Stored procs for Controls\HatDbHelpers.cs
--/
--/--------------------------------------------------------------------------------------------------------


--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetServiceXsymBySvcId
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetServiceXsymBySvcId]
@uidServiceId		uniqueidentifier,
@uidServiceInstId	uniqueidentifier
AS
	SELECT TOP 1	txtSymbol
	FROM	dta_ServiceSymbols sym,
			dta_ServiceInstances inst
	WHERE	sym.uidServiceId = @uidServiceId 
		AND	inst.uidServiceInstanceId = @uidServiceInstId
		AND	DATEDIFF(ss, sym.dtDeploymentTime, inst.dtStartTime) > 0
	ORDER BY DATEDIFF(ss, sym.dtDeploymentTime, inst.dtStartTime) ASC
GO
GRANT EXEC ON [dbo].[dtasp_GetServiceXsymBySvcId] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
--/
--/ Stored procs for testing
--/
--/--------------------------------------------------------------------------------------------------------
--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_CleanHMData
-- This stored procedure cleans everything that is tracked
-- Also it can be used to clean the Failed Tracking Data instances
-- And finally all the services deployed after configuration wizard can be removed
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_CleanHMData]
@nCleanStatus int = 1
AS

exec dtasp_DropViews

-- Clean up Status (They can be OR'ed)
--	Runtime populated	= 1
--	+ FailedTrackingData	= 2
--	+ Services		= 4
--	+ MessageBody Tracking  = 8

IF ((@nCleanStatus & 0x1) > 0)
BEGIN
	TRUNCATE TABLE dta_Adapter
	TRUNCATE TABLE dta_DecryptionSubject
	TRUNCATE TABLE dta_Host
	TRUNCATE TABLE dta_MessageBox
	TRUNCATE TABLE dta_MessageFields
	TRUNCATE TABLE dta_PartyName
	TRUNCATE TABLE dta_PortName
	TRUNCATE TABLE dta_SchemaName
	TRUNCATE TABLE dta_ServiceInstanceExceptions
	TRUNCATE TABLE dta_SigningSubject
	TRUNCATE TABLE dta_CallChain
	TRUNCATE TABLE dta_DebugTrace
	TRUNCATE TABLE dta_MessageFieldValues
	TRUNCATE TABLE dta_MessageInOutEvents
	TRUNCATE TABLE dta_ServiceInstances

	TRUNCATE TABLE Tracking_Fragments1
	TRUNCATE TABLE Tracking_Parts1
	TRUNCATE TABLE Tracking_Spool1
	TRUNCATE TABLE Tracking_Fragments2
	TRUNCATE TABLE Tracking_Parts2
	TRUNCATE TABLE Tracking_Spool2
END

IF ((@nCleanStatus & 0x2) > 0)
BEGIN
	TRUNCATE TABLE TDDS_FailedTrackingData
END

IF ((@nCleanStatus & 0x4) > 0)
BEGIN
	DELETE FROM dta_Services  WITH (SERIALIZABLE) WHERE nServiceId > 13
END

if ((@nCleanStatus & 0x8) > 0)
BEGIN
	TRUNCATE TABLE Tracking_Fragments1
	TRUNCATE TABLE Tracking_Parts1
	TRUNCATE TABLE Tracking_Spool1
	TRUNCATE TABLE Tracking_Fragments2
	TRUNCATE TABLE Tracking_Parts2
	TRUNCATE TABLE Tracking_Spool2
END

exec dtasp_CreateMessageFactsFindMsgViews
exec dtasp_CreateRealNamesView
exec dtasp_CreateServiceFactsView

GO

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetServiceXsymBySvcName
--/--------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[dtasp_GetServiceXsymBySvcName]
	@ServiceTypeName nvarchar(256)
AS
	SELECT	txtSymbol 
	FROM	dta_Services
	WHERE	strServiceName=@ServiceTypeName
GO
GRANT EXEC ON [dbo].[dtasp_GetServiceXsymBySvcName] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
--/
--/ Stored procs for TPE
--/
--/--------------------------------------------------------------------------------------------------------

--/--------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE: dtasp_GetServiceXsymByName
--/--------------------------------------------------------------------------------------------------------
CREATE  PROCEDURE [dbo].[dtasp_GetServiceXsymByName]
	@Assembly nvarchar(256),
	@ServiceTypeName nvarchar(256)
AS
	SELECT	txtSymbol 
	FROM	dta_Services
	WHERE 	strAssemblyName = @Assembly 
		AND strServiceName = @ServiceTypeName
GO
GRANT EXEC ON [dbo].[dtasp_GetServiceXsymByName] TO BTS_ADMIN_USERS
GO

--/--------------------------------------------------------------------------------------------------------
--/
--/ Stored procs for Operations OM
--/
--/--------------------------------------------------------------------------------------------------------
-- For MessageRoutingDetails
CREATE PROCEDURE [dbo].[ops_GetRoutingDetails]
@fMultipleTrackingDbs tinyint,
@uidMessageID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT 	
[srvI].[uidServiceInstanceId],	
[srvI].[uidServiceClassId],	
[host].[strHostName],
[srvI].[nServiceStateId],
[srv].[uidNonVersionId],
[srv].[strServiceName],
[srvI].[uidActivityId],
[srvI].[dtStartTime],
[srvI].[dtEndTime],
[srvI].[HRESULT],
[srvI].[ErrorInfo],
[mioe].[nStatus],
[mioe].[dtTimestamp]
FROM [dbo].[dta_MessageInOutEvents] mioe
JOIN [dbo].[dta_ServiceInstances] srvI ON srvI.uidActivityId = mioe.uidActivityId AND mioe.uidServiceInstanceId = srvI.uidServiceInstanceId
LEFT JOIN [dbo].[dta_Services] srv ON srvI.uidServiceId = srv.uidServiceId
LEFT JOIN [dbo].[dta_Host] host ON srvI.nHostId = host.nHostId
WHERE mioe.uidMessageInstanceId = @uidMessageID

GO
GRANT EXEC ON [dbo].[ops_GetRoutingDetails] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_GetRoutingDetails] TO BTS_OPERATORS
GO

-- For MessageFlow
CREATE PROCEDURE [dbo].[ops_GetServiceInstanceMessages]
@uidServiceInstanceID	uniqueidentifier,
@uidActivityID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	IF (@uidActivityID = '00000000-0000-0000-0000-000000000000')
		SET @uidActivityID = (SELECT TOP 1 uidActivityId from dta_MessageInOutEvents where uidServiceInstanceId = @uidServiceInstanceID)

	SELECT	moe.uidMessageInstanceId, moe.dtTimestamp, moe.nStatus, moe.nMessageSize 
	FROM	dta_MessageInOutEvents moe WITH	(ROWLOCK READPAST)
	WHERE	moe.uidServiceInstanceId = @uidServiceInstanceID AND moe.uidActivityId = @uidActivityID
	ORDER BY moe.dtTimestamp ASC --, moe.nStatus

GO
GRANT EXEC ON [dbo].[ops_GetServiceInstanceMessages] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_GetServiceInstanceMessages] TO BTS_OPERATORS
GO

-- For MessageFlow
CREATE PROCEDURE [dbo].[ops_GetServiceInstanceActivity]
@uidServiceInstanceID	uniqueidentifier,
@uidActivityID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT TOP 1 srvI.dtStartTime, srvI.dtEndTime, srv.strServiceName, srvI.HRESULT, srvI.ErrorInfo
	FROM dta_ServiceInstances srvI
	LEFT JOIN dta_Services srv on srvI.uidServiceId = srv.uidServiceId
	WHERE srvI.uidServiceInstanceId = @uidServiceInstanceID AND srvI.uidActivityId = @uidActivityID

GO
GRANT EXEC ON [dbo].[ops_GetServiceInstanceActivity] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_GetServiceInstanceActivity] TO BTS_OPERATORS
GO

-- For MessageFlow
CREATE PROCEDURE [dbo].[ops_CountServiceInstanceActivities]
@uidServiceInstanceID	uniqueidentifier,
@uidActivityID uniqueidentifier OUTPUT,
@nCount int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT	DISTINCT @uidActivityID = uidActivityId 
	FROM	dta_MessageInOutEvents WITH	(ROWLOCK  READPAST)
	WHERE	uidServiceInstanceId = @uidServiceInstanceID
set @nCount = @@ROWCOUNT
GO
GRANT EXEC ON [dbo].[ops_CountServiceInstanceActivities] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_CountServiceInstanceActivities] TO BTS_OPERATORS
GO

-- GetInstance for tracked instances in the DTADb
CREATE PROCEDURE [dbo].[ops_GetInstance]
@uidServiceInstanceID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT 	TOP 1
[srvI].[uidServiceInstanceId],	
[srvI].[uidServiceClassId],	
[host].[strHostName],
[srvI].[nServiceStateId],
[srv].[uidNonVersionId],
[srv].[strServiceName],
NULL, -- activityid, unused in the code.
[srvI].[dtStartTime],
[srvI].[dtEndTime],
[srvI].[HRESULT],
[srvI].[ErrorInfo]

FROM	[dbo].[dta_ServiceInstances] srvI 
WITH	(READPAST) 
LEFT JOIN [dbo].[dta_Services] srv ON srvI.uidServiceId = srv.uidServiceId
LEFT JOIN [dbo].[dta_Host] host ON srvI.nHostId = host.nHostId
WHERE srvI.uidServiceInstanceId = @uidServiceInstanceID

GO
GRANT EXEC ON [dbo].[ops_GetInstance] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_GetInstance] TO BTS_OPERATORS
GO

/********************************************************************
* Sprocs and such for archiving and purging feature
*******************************************************************/

--lets do overlapping backups so if we keep 5 days live, we will do backps every 4 days or if we keep live data for
--6 hours, we will do backups every 5 hours. This reduces the chance of service information being truncated and forcing
--the HAT user to bridge information across multiple backups. If the archives are taken every hour
--then we will not be able to do overlapping backups
CREATE FUNCTION [dbo].[dtafn_ShouldArchiveDatabase] (@nHours int, @nDays int, @dtNow datetime, @dtLastBackup datetime)
RETURNS datetime
AS
BEGIN

	declare @dt datetime, @fAdjusted tinyint
	set @dt = @dtLastBackup
	set @fAdjusted = 0

	--we use @dt to calculate when the next backup should take place by adding the intervals passed in
	--the intervals passed in are also used for purging and so to make sure we get an overlap of data
	--in our tracking archives, we will add all the values passed in to the last backup time and then
	--factor in a 10 minute overlap in order to handle any delays in copying of tracked messages from the messagebox

	if (@nDays > 0) --this implicitly handles the null check
	BEGIN
		set @dt = DATEADD(Day, @nDays, @dt)
	END
	if (@nHours > 0) --this implicitly handles the null check
	BEGIN
		set @dt = DATEADD(Hour, @nHours, @dt)
	END

	if (@dt <= @dtNow)
		return 1

	return 0

END
GO

CREATE  PROCEDURE [dbo].[dtasp_PurgeTrackingDatabase_Internal]
@dtPruneBeforeDate datetime,
@dtHardDeleteBeforeDate datetime,
@dtLastBackup datetime
AS


declare @fWorkLeft int, @err int, @dtNow datetime
Set @dtNow = GetUTCDate()

create table #ServiceInsts (uidServiceInstanceID uniqueidentifier NOT NULL, uidActivityID uniqueidentifier NOT NULL)
create unique clustered index CIX_ServiceInsts ON #ServiceInsts([uidServiceInstanceID], [uidActivityID])
 
CREATE TABLE #MsgIDs(msgID uniqueidentifier)
CREATE CLUSTERED INDEX [CIX_MsgIDs] ON [#MsgIDs]([msgID])

CREATE TABLE #RuleSetIDs (nID bigint)
CREATE CLUSTERED INDEX [CIX_RuleSetIDs] ON [#RuleSetIDs]([nID])

if (@dtHardDeleteBeforeDate < @dtPruneBeforeDate)
BEGIN
 /******************************************************************
 * This section is designed to keep infinite schedules from filling our database with information about their execution. MSMQt
 * is handled correctly because we use an activity id for MSMQt. The only thing we need to do here is delete the DebugTrace and
 * CallChain table information as well as the MessageInOutEvents information. These tables contain shape execution and nested orchestration call information, so the orchestration
 * debugger will not be able to give complete information. The InOutEvents table contains information about message flow into and out of the 
 * schedule so that will also be deleted.
 *
 * Not only do we check when they completed, but also when they were inserted so that we make sure we dont delete data
 * which was not in the last backup
 *
 * Also prune rules engine related information
 *
 * We need to prevent page locks which cause deadlocks so we delete 100 at a time until we have no more work to do on a table
 *****************************************************************************/
		-- Prune dta_CallChain and dta_DebugTrace and MessageInOutEvents tables (and the rules engine tables). Make sure to leave the first call chain event so that undeleted event information can still be displayed.
		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			DELETE FROM dta_CallChain WITH (ROWLOCK)
			FROM dta_CallChain d, 
				 (SELECT TOP 100 dtTimeStamp, dtInsertionTimeStamp, nCallersServiceSequence, nCallChainId FROM dta_CallChain WITH (ROWLOCK READPAST) WHERE dtTimeStamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup) ) as m
			WHERE d.dtTimeStamp = m.dtTimeStamp AND d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nCallersServiceSequence = m.nCallersServiceSequence AND d.nCallChainId = m.nCallChainId
			
			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1

		END

		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			DELETE FROM dta_DebugTrace WITH (ROWLOCK)
			FROM dta_DebugTrace d, 
				 (SELECT TOP 100 dtEndTimeStamp, dtInsertionTimeStamp, nDebugTraceId FROM dta_DebugTrace WITH (ROWLOCK READPAST) WHERE dtEndTimeStamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)) as m
			WHERE d.dtEndTimeStamp = m.dtEndTimeStamp and d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nDebugTraceId = m.nDebugTraceId
			
			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END

		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			DELETE FROM dta_MessageInOutEvents WITH (ROWLOCK)
			FROM dta_MessageInOutEvents d,
				 (SELECT TOP 100 dtTimestamp, dtInsertionTimeStamp, nEventId FROM dta_MessageInOutEvents WITH (ROWLOCK READPAST) WHERE dtTimestamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)) as m
			WHERE d.dtTimestamp = m.dtTimestamp and d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nEventId = m.nEventId
			
			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END
		
		IF EXISTS (SELECT 1 FROM dta_RuleSetEngineAssociation WITH (ROWLOCK) )
		BEGIN
		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			
			DELETE FROM dta_RulesAgendaUpdates WITH (ROWLOCK)
			FROM dta_RulesAgendaUpdates d,
				 (SELECT TOP 100 dtTimeStamp, dtInsertionTimeStamp, nRulesAgendaUpdatesID FROM dta_RulesAgendaUpdates WITH (ROWLOCK READPAST) WHERE dtTimeStamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)) as m
			WHERE d.dtTimeStamp = m.dtTimeStamp and d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nRulesAgendaUpdatesID  = m.nRulesAgendaUpdatesID
			
			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END
		
		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			DELETE FROM dta_RulesConditionEvaluation WITH (ROWLOCK)
			FROM dta_RulesConditionEvaluation d,
				 (SELECT TOP 100 dtTimeStamp, dtInsertionTimeStamp, nRulesConditionEvaluationID FROM dta_RulesConditionEvaluation WITH (ROWLOCK READPAST) WHERE dtTimeStamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)) as m
			WHERE d.dtTimeStamp = m.dtTimeStamp and d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nRulesConditionEvaluationID = m.nRulesConditionEvaluationID
			
			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END
		 
		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			
			DELETE FROM dta_RulesFactActivity WITH (ROWLOCK)
			FROM dta_RulesFactActivity d,
				 (SELECT TOP 100 dtTimeStamp, dtInsertionTimeStamp, nRulesFactActivityID FROM dta_RulesFactActivity WITH (ROWLOCK READPAST) WHERE dtTimeStamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)) as m
			WHERE d.dtTimeStamp = m.dtTimeStamp and d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nRulesFactActivityID  = m.nRulesFactActivityID

			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END
		 
		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			
			DELETE FROM dta_RulesFired WITH (ROWLOCK)
			FROM dta_RulesFired d, 
				 (SELECT TOP 100 dtTimeStamp, dtInsertionTimeStamp, nRulesFiredID FROM dta_RulesFired WITH (ROWLOCK READPAST) WHERE dtTimeStamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)) as m
			WHERE d.dtTimeStamp = m.dtTimeStamp and d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nRulesFiredID  = m.nRulesFiredID
			
			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END

		set @fWorkLeft = 1
		While (@fWorkLeft != 0)
		BEGIN
			
			DELETE FROM dta_RuleSetEngineAssociation WITH (ROWLOCK)
			FROM dta_RuleSetEngineAssociation d,
				(SELECT TOP 100 dtTimeStamp, dtInsertionTimeStamp, nRuleSetEngineAssociationID FROM dta_RuleSetEngineAssociation WITH (ROWLOCK READPAST) WHERE dtTimeStamp < @dtHardDeleteBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)) as m
			WHERE d.dtTimeStamp = m.dtTimeStamp and d.dtInsertionTimeStamp = m.dtInsertionTimeStamp and d.nRuleSetEngineAssociationID  = m.nRuleSetEngineAssociationID
			
			SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END
		END
END
 
if (@dtPruneBeforeDate < @dtNow)
BEGIN 
  
 
 
    
 /******************************************************************
 * Only delete MessageInOutEvents, CallChain, and DebugTrace information associated with completed instances 
 * which are going to be purged
 *
 *******************************************************************/
declare @count int
 
 set @fWorkLeft = 1
 While (@fWorkLeft != 0)
 BEGIN
 	--I only have to care about the insertion time for the end event of the instance since it will be the last
	--item inserted. If it was in the last backup, so was everything else
        INSERT INTO #ServiceInsts
        SELECT TOP 100 uidServiceInstanceId, uidActivityId FROM dta_ServiceInstances WITH (ROWLOCK READPAST) WHERE dtEndTime < @dtPruneBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)
        
        SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
	if (@fWorkLeft = 0)
		continue
            
	SET @count = 100
        WHILE (@count = 100)
        BEGIN
                DELETE FROM dta_MessageInOutEvents WITH (ROWLOCK)
                FROM ( SELECT TOP 100 d.uidMessageInstanceId, d.nEventId FROM dta_MessageInOutEvents d, #ServiceInsts as t1 WHERE d.uidServiceInstanceId = t1.uidServiceInstanceID) as t2 
                JOIN dta_MessageInOutEvents m ON t2.uidMessageInstanceId = m.uidMessageInstanceId AND t2.nEventId = m.nEventId
                OPTION( MAXDOP 1 )

                SELECT @count = @@ROWCOUNT, @err = @@ERROR
		if (@err <> 0) return -1
        END

		SET @count = 100
        WHILE (@count = 100)
        BEGIN
                    DELETE FROM dta_CallChain WITH (ROWLOCK)
                    FROM ( 	SELECT TOP 100 d.uidServiceInstanceId, d.nCallChainId FROM dta_CallChain d, #ServiceInsts as t1 WHERE d.uidServiceInstanceId = t1.uidServiceInstanceID ) as t2
                    JOIN dta_CallChain m ON t2.uidServiceInstanceId = m.uidServiceInstanceId AND t2.nCallChainId = m.nCallChainId
                    OPTION( MAXDOP 1 )

                    SELECT @count = @@ROWCOUNT, @err = @@ERROR
		if (@err <> 0) return -1
        END

        SET @count = 100
        WHILE (@count = 100)
        BEGIN
                    DELETE FROM dta_DebugTrace WITH (ROWLOCK)
                    FROM (  SELECT TOP 100 d.uidServiceInstanceId, d.nServiceSequence, d.nDebugTraceId FROM dta_DebugTrace d, #ServiceInsts t1 WHERE d.uidServiceInstanceId = t1.uidServiceInstanceID ) as t2
                    JOIN dta_DebugTrace m ON t2.uidServiceInstanceId = m.uidServiceInstanceId AND t2.nServiceSequence = m.nServiceSequence AND t2.nDebugTraceId = m.nDebugTraceId
                    OPTION( MAXDOP 1 )

                    SELECT @count = @@ROWCOUNT, @err = @@ERROR
		if (@err <> 0) return -1
        END

	--lets also delete all service instance excpetions
	SET @count = 100
        WHILE (@count = 100)
        BEGIN
                    DELETE FROM dta_ServiceInstanceExceptions WITH (ROWLOCK)
                    FROM (  SELECT TOP 100 d.uidServiceInstanceId, d.uidActivityId FROM dta_ServiceInstanceExceptions d, #ServiceInsts t1 WHERE t1.uidServiceInstanceID = d.uidServiceInstanceId AND t1.uidActivityID = d.uidActivityId ) as t2
                    JOIN dta_ServiceInstanceExceptions m ON t2.uidServiceInstanceId = m.uidServiceInstanceId AND t2.uidActivityId = m.uidActivityId
                    OPTION( MAXDOP 1 )

                    SELECT @count = @@ROWCOUNT, @err = @@ERROR
		if (@err <> 0) return -1
        END
	    --cleanup all rules engine data related to this instance
	    set @count = 100
	    WHILE (@count = 100)
	    BEGIN
	    
			declare @idx int
			
			INSERT INTO #RuleSetIDs 
			SELECT TOP 100 nRuleSetEngineAssociationID 
			FROM dta_RuleSetEngineAssociation r WITH (ROWLOCK), #ServiceInsts si
			WHERE r.uidRuleSetEngineAssociationGUID = si.uidServiceInstanceID
			
			SELECT @count = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1

			if (@count = 0)
				continue
			
			set @idx = 1
			while (@idx != 0)
			BEGIN
				DELETE FROM dta_RulesAgendaUpdates WITH (ROWLOCK)
				FROM dta_RulesAgendaUpdates d,
					 (SELECT TOP 100 nRulesAgendaUpdatesID FROM dta_RulesAgendaUpdates r WITH (ROWLOCK READPAST) JOIN #RuleSetIDs t ON r.nRuleSetEngineAssociationID = t.nID ) as m
				WHERE d.nRulesAgendaUpdatesID  = m.nRulesAgendaUpdatesID

				SELECT @idx = @@ROWCOUNT, @err = @@ERROR
				if (@err <> 0) return -1
			END

			 set @fWorkLeft = 1
			While (@idx != 0)
			BEGIN
				DELETE FROM dta_RulesConditionEvaluation WITH (ROWLOCK)
				FROM dta_RulesConditionEvaluation d,
					 (SELECT TOP 100 dtTimeStamp, nRulesConditionEvaluationID FROM dta_RulesConditionEvaluation r WITH (ROWLOCK READPAST) JOIN #RuleSetIDs t ON r.nRuleSetEngineAssociationID = t.nID ) as m
				WHERE d.nRulesConditionEvaluationID = m.nRulesConditionEvaluationID

				SELECT @idx = @@ROWCOUNT, @err = @@ERROR
				if (@err <> 0) return -1

			END
			 			 
			set @idx = 1
			While (@idx != 0)
			BEGIN
				
				DELETE FROM dta_RulesFactActivity WITH (ROWLOCK)
				FROM dta_RulesFactActivity d,
					 (SELECT TOP 100 nRulesFactActivityID FROM dta_RulesFactActivity r  WITH (ROWLOCK READPAST) JOIN #RuleSetIDs t ON r.nRuleSetEngineAssociationID = t.nID) as m
				WHERE d.nRulesFactActivityID  = m.nRulesFactActivityID

				SELECT @idx = @@ROWCOUNT, @err = @@ERROR
				if (@err <> 0) return -1
			END
			 
			set @idx = 1
			While (@idx != 0)
			BEGIN
				
				DELETE FROM dta_RulesFired WITH (ROWLOCK)
				FROM dta_RulesFired d, 
					 (SELECT TOP 100 nRulesFiredID FROM dta_RulesFired r WITH (ROWLOCK READPAST) JOIN #RuleSetIDs t ON  r.nRuleSetEngineAssociationID = t.nID ) as m
				WHERE d.nRulesFiredID  = m.nRulesFiredID

				SELECT @idx = @@ROWCOUNT, @err = @@ERROR
				if (@err <> 0) return -1
			END
	
			DELETE FROM dta_RuleSetEngineAssociation WITH (ROWLOCK)
			FROM dta_RuleSetEngineAssociation d, #RuleSetIDs r
			WHERE d.nRuleSetEngineAssociationID = r.nID
			if (@@error <> 0) return -1

			TRUNCATE TABLE #RuleSetIDs
		END

 
        DELETE FROM dta_ServiceInstances WITH (ROWLOCK)
        FROM #ServiceInsts t
        JOIN dta_ServiceInstances m ON t.uidServiceInstanceID = m.uidServiceInstanceId AND t.uidActivityID = m.uidActivityId
	if (@@error <> 0) return -1

        truncate table #ServiceInsts
	

 
END
 
 --we only need to look at messages older than a certain time since we are not deleting before then
 set @fWorkLeft = 100
 While (@fWorkLeft = 100)
 BEGIN
	INSERT INTO #MsgIDs
	SELECT TOP 100 uidMsgID FROM Tracking_Spool1 WITH (ROWLOCK READPAST) 
	WHERE dtTimeStamp < @dtPruneBeforeDate AND (dtInsertionTimeStamp IS NULL OR dtInsertionTimeStamp < @dtLastBackup)
	      --AND uidMsgID NOT IN (SELECT uidMessageInstanceId FROM dta_MessageInOutEvents WITH (ROWLOCK))
	OPTION (KEEPFIXED PLAN, MAXDOP 1)
  
	SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
	if (@err <> 0) return -1

	if (@fWorkLeft = 0)
		continue

	IF (EXISTS (SELECT TOP 1 1 FROM Tracking_Fragments1 WITH (ROWLOCK) ) )
	BEGIN
		set @count = 100
		WHILE (@count = 100)
		BEGIN
			
			DELETE FROM Tracking_Fragments1 WITH (ROWLOCK)
			FROM Tracking_Fragments1 f WITH (ROWLOCK), 
			     (	SELECT TOP 100 f.uidPartID, f.nFragmentNumber
				FROM Tracking_Parts1 p WITH (ROWLOCK), Tracking_Fragments1 f, #MsgIDs t1
				WHERE p.uidMessageID = t1.msgID AND p.uidPartID = f.uidPartID
		  	   ) as t2
			WHERE f.uidPartID = t2.uidPartID AND f.nFragmentNumber = t2.nFragmentNumber
			OPTION (KEEPFIXED PLAN, MAXDOP 1)
	
			SELECT @count = @@ROWCOUNT, @err = @@ERROR
			if (@err <> 0) return -1
		END
	END

	set @count = 100
	WHILE (@count = 100)
	BEGIN

		DELETE FROM Tracking_Parts1 WITH (ROWLOCK)
		FROM (SELECT TOP 100 tp.uidMessageID, tp.uidPartID FROM #MsgIDs m JOIN Tracking_Parts1 tp ON tp.uidMessageID = m.msgID ) as t
		JOIN Tracking_Parts1 p WITH (ROWLOCK) ON t.uidMessageID = p.uidMessageID AND p.uidPartID = t.uidPartID
		OPTION (KEEPFIXED PLAN, MAXDOP 1)

		SELECT @count = @@ROWCOUNT, @err = @@ERROR
		if (@err <> 0) return -1
	END

	DELETE FROM Tracking_Spool1 WITH (ROWLOCK)
	FROM Tracking_Spool1 s, #MsgIDs t
  	WHERE s.uidMsgID = t.msgID
	OPTION (KEEPFIXED PLAN, MAXDOP 1)
	if (@err <> 0) return -1

	TRUNCATE TABLE #MsgIDs
	
 END
 
  /*************************************************************
 * For the MessageFieldValues we will simply delete after the time period has elapsed
 * because we cannot know when they are "finished". Messages are never finished since they can be referenced by many instances.
 * The soft purge work will only work to preserve the message flow views and potentially call chain information.
 **************************************************************/
 -- Prune dta_MessageFieldValues
set @fWorkLeft = 1
While (@fWorkLeft != 0)
BEGIN
	--for MessageFieldValues, the timestamp column is set on insert so I dont need a new column
	DELETE FROM dta_MessageFieldValues WITH (ROWLOCK)
	FROM dta_MessageFieldValues d,
	     (SELECT TOP 100 dtTimeStamp, nMessageFieldValueId FROM dta_MessageFieldValues WITH (ROWLOCK READPAST) WHERE dtTimeStamp < @dtPruneBeforeDate) as m
	WHERE d.dtTimeStamp = m.dtTimeStamp and d.nMessageFieldValueId  = m.nMessageFieldValueId
	
	SELECT @fWorkLeft = @@ROWCOUNT, @err = @@ERROR
	if (@err <> 0) return -1
END
END
 
DROP TABLE #ServiceInsts
DROP TABLE #MsgIDs
DROP TABLE #RuleSetIDs

return 0
GO

CREATE PROCEDURE [dbo].[dtasp_PurgeTrackingDatabase]
@nHours tinyint,
@nDays tinyint,
@nHardDays tinyint,
@dtLastBackup datetime
AS
 
set nocount on
set deadlock_priority low
set transaction isolation level read committed
 
declare  @dtPruneBeforeDate datetime,
  @dtHardDeleteBeforeDate datetime,
  @dtNow datetime
 
set @dtNow = GetUTCDate()
set @dtPruneBeforeDate = @dtNow
set @dtHardDeleteBeforeDate = @dtNow
 
 
declare @localized_string_InvalidPurgeInterval nvarchar(256)
set @localized_string_InvalidPurgeInterval = N'The hard purge interval cannot be less than the soft purge interval'

if (@nHardDays <= @nDays + (@nHours / 24))
BEGIN
	RAISERROR(@localized_string_InvalidPurgeInterval, 16, 1)
	return -1
END

if (@nHours > 0) --this implicitly handles the null check
BEGIN
 set @dtPruneBeforeDate = DATEADD(Hour, 0 - @nHours, @dtPruneBeforeDate)
END
if (@nDays > 0) --this implicitly handles the null check
BEGIN
 set @dtPruneBeforeDate = DATEADD(Day, 0 - @nDays, @dtPruneBeforeDate)
END
 
 
if ( (@dtLastBackup IS NOT NULL) AND (@dtLastBackup < @dtPruneBeforeDate) )
BEGIN
 set @dtPruneBeforeDate = @dtLastBackup --we want to make sure we never prune date newer than the last backup
END
 
if ( (@nHours > 0) OR (@nDays > 0) )
BEGIN
 --we want to overlap our backups so that we have a bit of redundancy. To enable this we
 --tweak the purge interval and drop 10 minutes off of it. That way, you keep say 10 hours + 10 minutes worth of data
 --live at all times and do an archive every 10 hours. This will give us a 10 minute overlap always.
 set @dtPruneBeforeDate = DATEADD(Minute, -10, @dtPruneBeforeDate)
END
 
if (@nHardDays > 0)
BEGIN
 set @dtHardDeleteBeforeDate = DATEADD(Day, 0 - @nHardDays, @dtHardDeleteBeforeDate)
 if (@dtHardDeleteBeforeDate > @dtLastBackup)
  set @dtHardDeleteBeforeDate = @dtLastBackup
END
 
exec dtasp_PurgeTrackingDatabase_Internal  @dtPruneBeforeDate, @dtHardDeleteBeforeDate, @dtLastBackup

GO
GRANT EXEC ON [dbo].[dtasp_PurgeTrackingDatabase] TO BTS_BACKUP_USERS
GO


CREATE PROCEDURE [dbo].[dtasp_BackupTrackingDatabase]
@nvcFolder nvarchar(1024),
@nRetryRowID int,
@fSuccess int OUTPUT
AS

	declare @dtNow datetime
	declare @localized_string_BackupFailed nvarchar(256)
	set @localized_string_BackupFailed = N'A failure occurred while backing up the database.'

	set @dtNow = GetUTCDate()
	set @fSuccess = 0 --this means failure.
	
	--we need to do a backup of the database
	declare @DBName nvarchar(128), @ServerName nvarchar(256), @nvcDT nvarchar(32), @BackupLocation nvarchar(2000)
	set @nvcDT = replace(@dtNow, ' ', '_')
	set @nvcDT = replace(@nvcDT, ':', '_')
	select @DBName = db_name(), @ServerName = replace( cast( isnull( serverproperty('servername'), '' ) as nvarchar ), '\', '_' ) /* this will be a file path */
	if right( @nvcFolder, 1 ) = '\'
		SET @BackupLocation=@nvcFolder + @ServerName + N'_' + @DBName + N'_' + @nvcDT + N'.bak'
	else
		SET @BackupLocation=@nvcFolder + N'\' + @ServerName + N'_' + @DBName + N'_' + @nvcDT + N'.bak'
	--select @BackupLocation
	Backup Database @DBName to DISK=@BackupLocation
	if @@ERROR <> 0
	BEGIN
		if (@nRetryRowID = -1) --this is not a retry of a previously failed backup
			INSERT INTO dta_ArchiveHistory (dtTimeStamp, dtLastFailure, nFailureCount, nSuccess, nvcBackupLocation) VALUES (@dtNow, @dtNow, 1, -1, @BackupLocation)
		else
			UPDATE dta_ArchiveHistory set dtLastFailure = @dtNow, nFailureCount = nFailureCount + 1, nSuccess = -1, nvcBackupLocation = @BackupLocation WHERE nID = @nRetryRowID
		RAISERROR(@localized_string_BackupFailed, 16, 1)
	END
	else
	BEGIN
		if (@nRetryRowID = -1)
			INSERT INTO dta_ArchiveHistory (dtTimeStamp, nvcBackupLocation) VALUES (@dtNow, @BackupLocation)
		else
			UPDATE dta_ArchiveHistory set dtTimeStamp = @dtNow, dtLastFailure = null, nFailureCount = 0, nSuccess = 0, nvcBackupLocation = @BackupLocation WHERE nID = @nRetryRowID
	
		set @fSuccess = 1 --we successfully backed up the database
	END

GO

CREATE PROCEDURE [dbo].[dtasp_BackupAndPurgeTrackingDatabase]
@nLiveHours tinyint, --Any completed instance older than the live hours +live days
@nLiveDays tinyint = 0, --will be deleted along with all associated data
@nHardDeleteDays tinyint = 0, --all data older than this will be deleted.
@nvcFolder nvarchar(1024) = null, --location for .bak backup files to be put
@nvcValidatingServer sysname = null,
@fForceBackup int = 0 -- if this flag is set to 1 we will force a backup at that point
AS

	declare @dtLastArchiveDate datetime,
		@nID int,
		@nLastBackupSuccessCode int,
		@fSuccess int,
		@tsql nvarchar(1000),
		@ret int

	set @ret = 0

	declare @localized_string_BadParams nvarchar(256)
	set @localized_string_BadParams = N'The @nvcFolder parameter cannot be null. If you want to only purge the database, use the dtasp_PurgeTrackingDatabase stored procedure'
	
	declare @localized_string_BadParams_LiveTime nvarchar(256)
	set @localized_string_BadParams_LiveTime = N'You must keep atleast 1 hour worth of live data.'

	declare @localized_string_BadParams_HardTime nvarchar(256)
	set @localized_string_BadParams_HardTime = N'The hard purge window cannot be less than the live data window'	

	declare @localized_string_ValidationPending nvarchar(256)
	set @localized_string_ValidationPending = N'Validation of the last archive has not finished. Attepting to restart validation. Please make sure that no errors are occurring on the validation machine.'

	declare @localized_string_InvalidValidatingServer nvarchar(256)
	set @localized_string_InvalidValidatingServer = N'The local server cannot be used as the validating server for tracking database archives.'

	set @dtLastArchiveDate = NULL
	set @fSuccess = 0
	set @nLastBackupSuccessCode = 0
	
	if (@nvcFolder IS NULL)
	BEGIN
		--this is not supported. If the users just want to purge, they should call the PurgeTrackingDatabase sproc
		RAISERROR(@localized_string_BadParams, 16, 1)
		return
	END
	else if ( (@nLiveHours = 0) AND (@nLiveDays = 0) )
	BEGIN
		RAISERROR(@localized_string_BadParams_LiveTime, 16, 1)
		return
	END
	else if (@nHardDeleteDays <= @nLiveDays + (@nLiveHours / 24))
	BEGIN
		RAISERROR(@localized_string_BadParams_HardTime, 16, 1)
		return
	END

	--lets make sure the validating server is not the current server. We dont worry about odd names
	--like specifying the port since the user would have to go way out of their way to specify the port
	--for the current server and checking that would require more overhead
	IF (@nvcValidatingServer IS NOT NULL)
	BEGIN
		if (@nvcValidatingServer = CAST(SERVERPROPERTY('servername') as sysname))
		BEGIN
			RAISERROR(@localized_string_InvalidValidatingServer, 16, 1)
			return
		END
	END

	select top 1 @nID = nID, @dtLastArchiveDate = dtTimeStamp, @nLastBackupSuccessCode = nSuccess FROM dta_ArchiveHistory ORDER BY dtTimeStamp DESC
	
	IF ( (@dtLastArchiveDate IS NULL) OR (@fForceBackup > 0) ) --we have to do a backup
	BEGIN
		exec dtasp_BackupTrackingDatabase @nvcFolder, -1, @fSuccess OUTPUT
	END
	ELSE --we have done a previous backup
	BEGIN
		if (@nLastBackupSuccessCode = -1) --this means the last backup failed, so we should do it again
		BEGIN
			--instead of counting the number of failures, we will just generate a new row for this backup and leave the last one listed as failed
			exec dtasp_BackupTrackingDatabase @nvcFolder, -1, @fSuccess OUTPUT
			--now wait for the backup to be validated
		END
		else if ( (@nvcValidatingServer IS NOT NULL) AND (@nLastBackupSuccessCode = 0) ) --this means the last backup has not been validated yet, so we cannot begin to purge again
		BEGIN
			--this is a no op. We could throw a warning to the evenlog asking for the user to validate the backup
			--it is possible that linked server was not working correctly, so we will try to kick off the validation job
			--incase they fixed the linked server issue
			set @tsql = '[' + @nvcValidatingServer + '].msdb.dbo.sp_start_job'
			exec @tsql 'ValidateArchive'
			if (@@error <> 0) return -1 

			RAISERROR(@localized_string_ValidationPending, 16, 1)
		END
		ELSE --the last backup was successfull so we can check to see if we need to do another backup
		BEGIN
			declare @dtNow datetime
			set @dtNow = GetUTCDate()
	
			--if we got to here, the last backup must have been successfull so we can now purge the tracking data
			exec @ret = dtasp_PurgeTrackingDatabase /*nHours*/@nLiveHours, /*nDays*/@nLiveDays, /*nHardDeleteDays*/@nHardDeleteDays, /*dtLastBackup*/@dtLastArchiveDate
			if ( (@@error <> 0) OR (@ret < 0) ) return -1 

			if ( (@nvcFolder IS NOT NULL) AND ( 1 = [dbo].[dtafn_ShouldArchiveDatabase]( @nLiveHours, @nLiveDays, @dtNow, @dtLastArchiveDate) ) )
			BEGIN
				-- we need to do another backup
				exec dtasp_BackupTrackingDatabase @nvcFolder, -1, @fSuccess OUTPUT
			END
		END
	END

	if ( (@nvcValidatingServer IS NOT NULL) AND (@fSuccess = 1) ) --this means we performed a successfull backup
	BEGIN
		set @tsql = '[' + @nvcValidatingServer + '].msdb.dbo.sp_start_job'
		exec @tsql 'ValidateArchive'
		if (@@error <> 0) return -1 
	END
GO
GRANT EXEC ON [dbo].[dtasp_BackupAndPurgeTrackingDatabase] TO BTS_BACKUP_USERS
GO

CREATE PROCEDURE [dbo].[dtasp_PurgeAllCompletedTrackingData]
AS
BEGIN

	--If you have a MessageInstances table it means that this database has not been upgraded so we should not
	--run this stored procedure or it will just throw wierd errors
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dta_MessageInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	BEGIN
		RAISERROR('The database schema has been rolledback and this stored procedure is no longer functional', 10, 1)
		return
	END

	--If you are doing this we assume it is because you have a huge, old db so it is just faster for us to 
	--find things which are not done and hold onto them then the other way around.
	--if we crashed after grabbing these uncompleted instances but before reinserting them, we are okay
	--because we have a unique constraint on the serviceinstanceid identity column so we will just ignore dupes
	--Note that if you run this, you need to have the tracking host stopped so that no new data is being inserted while this runs. 
	--This hard purge assumes that inserts have stopped so that we can do unlogged operations like truncate table and not hold locks for
	--long periods of time. Make sure if the system crashes while running this, you get a full clean run before restarting the tracking service or
	--you will end up in a non-deterministic state.

	INSERT INTO dta_ServiceInstancesTemp (
		uidServiceInstanceId,
		uidActivityId,
		uidServiceId,
		uidAgentSrvId,
		uidServiceClassId,
		dtStartTime,
		dtEndTime,
		HRESULT,
		ErrorInfo,
		nHostId,
		nMessageBoxId,
		nGroupId,
		nServiceStateId,
		bExceptionsOccurred,
		dtInsertionTimeStamp
		)
	SELECT 	uidServiceInstanceId,
		uidActivityId,
		uidServiceId,
		uidAgentSrvId,
		uidServiceClassId,
		dtStartTime,
		dtEndTime,
		HRESULT,
		ErrorInfo,
		nHostId,
		nMessageBoxId,
		nGroupId,
		nServiceStateId,
		bExceptionsOccurred,
		dtInsertionTimeStamp
	FROM dta_ServiceInstances WHERE dtEndTime IS NULL

	INSERT INTO dta_MessageInOutEventsTemp (
		uidActivityId,
		uidServiceInstanceId,
		uidMessageInstanceId,
		nAdapterId,
		nDecryptionSubjectId,
		nSigningSubjectId,
		strUrl,
		nPartyId,
		nPortId,
		nSchemaId,
		nPartCount,
		nMessageSize,
		dtTimestamp,
		nStatus,
		dtInsertionTimeStamp
		)
	SELECT  mioe.uidActivityId,
		mioe.uidServiceInstanceId,
		mioe.uidMessageInstanceId,
		mioe.nAdapterId,
		mioe.nDecryptionSubjectId,
		mioe.nSigningSubjectId,
		mioe.strUrl,
		mioe.nPartyId,
		mioe.nPortId,
		mioe.nSchemaId,
		mioe.nPartCount,
		mioe.nMessageSize,
		mioe.dtTimestamp,
		mioe.nStatus,
		mioe.dtInsertionTimeStamp
	FROM dta_MessageInOutEvents mioe
	JOIN dta_ServiceInstancesTemp si ON mioe.uidServiceInstanceId = si.uidServiceInstanceId AND mioe.uidActivityId = si.uidActivityId


	INSERT INTO dta_MessageFieldValuesTemp (
		[uidMessageInstanceId],
		[nMessageFieldsId],
		[nSchemaId],
		[vtValue],
		[nValueIndex]
		)
	SELECT  mfv.[uidMessageInstanceId],
		mfv.[nMessageFieldsId],
		mfv.[nSchemaId],
		mfv.[vtValue],
		mfv.[nValueIndex]
	FROM ( SELECT DISTINCT(uidMessageInstanceId) FROM dta_MessageInOutEvents mi ) as mi
	JOIN dta_MessageFieldValues mfv ON mi.uidMessageInstanceId = mfv.uidMessageInstanceId

	INSERT INTO dta_CallChainTemp (
		[uidServiceInstanceId],
		[vtCallersActionId],
		[uidCallersServiceId],
		[nCallersServiceSequence],
		[uidCalleesServiceId],
		[nCalleesServiceSequence],
		[dtInsertionTimeStamp]
		)
	SELECT  cc.[uidServiceInstanceId],
		cc.[vtCallersActionId],
		cc.[uidCallersServiceId],
		cc.[nCallersServiceSequence],
		cc.[uidCalleesServiceId],
		cc.[nCalleesServiceSequence],
		cc.[dtInsertionTimeStamp]
	FROM dta_CallChain cc
	JOIN dta_ServiceInstancesTemp sit ON cc.uidServiceInstanceId = sit.uidServiceInstanceId 

	INSERT INTO dta_DebugTraceTemp (
		[uidServiceInstanceId],
		[vtInstructionId], 
		[nServiceSequence],
		[nBeginInternalSequence],
		[nEndInternalSequence],
		[dtBeginTimeStamp],
		[dtEndTimeStamp],
		[dtInsertionTimeStamp]
		)
	SELECT  dt.[uidServiceInstanceId],
		dt.[vtInstructionId], 
		dt.[nServiceSequence],
		dt.[nBeginInternalSequence],
		dt.[nEndInternalSequence],
		dt.[dtBeginTimeStamp],
		dt.[dtEndTimeStamp],
		dt.[dtInsertionTimeStamp]
	FROM dta_DebugTrace dt
	JOIN dta_ServiceInstancesTemp sit ON sit.uidServiceInstanceId = dt.uidServiceInstanceId


	--I can't truncate these tables without first dropping the views since they have schemabindings
	exec dtasp_DropViews

	TRUNCATE TABLE dta_ServiceInstances
	TRUNCATE TABLE dta_MessageFieldValues
	TRUNCATE TABLE dta_CallChain
	TRUNCATE TABLE dta_MessageInOutEvents
	TRUNCATE TABLE dta_DebugTrace
	TRUNCATE TABLE dta_RulesAgendaUpdates
	TRUNCATE TABLE dta_RulesConditionEvaluation
	--TRUNCATE TABLE dta_RuleSetEngineAssociation
	TRUNCATE TABLE dta_RulesFactActivity
	TRUNCATE TABLE dta_RulesFired
	TRUNCATE TABLE Tracking_Spool1
	TRUNCATE TABLE Tracking_Parts1
	TRUNCATE TABLE Tracking_Fragments1
	TRUNCATE TABLE Tracking_Spool2
	TRUNCATE TABLE Tracking_Parts2
	TRUNCATE TABLE Tracking_Fragments2

	INSERT INTO dta_ServiceInstances (
		uidServiceInstanceId,
		uidActivityId,
		uidServiceId,
		uidAgentSrvId,
		uidServiceClassId,
		dtStartTime,
		dtEndTime,
		HRESULT,
		ErrorInfo,
		nHostId,
		nMessageBoxId,
		nGroupId,
		nServiceStateId,
		bExceptionsOccurred,
		[dtInsertionTimeStamp]
		)
	SELECT 	uidServiceInstanceId,
		uidActivityId,
		uidServiceId,
		uidAgentSrvId,
		uidServiceClassId,
		dtStartTime,
		dtEndTime,
		HRESULT,
		ErrorInfo,
		nHostId,
		nMessageBoxId,
		nGroupId,
		nServiceStateId,
		bExceptionsOccurred,
		[dtInsertionTimeStamp]
	FROM dta_ServiceInstancesTemp

	INSERT INTO dta_MessageInOutEvents (
		[uidActivityId],
		[uidServiceInstanceId],
		[uidMessageInstanceId],
		[nAdapterId],
		[nDecryptionSubjectId],
		[nSigningSubjectId],
		[strUrl],
		[nPartyId],
		[nPortId],
		[nSchemaId],
		[nPartCount],
		[nMessageSize],
		[dtTimestamp],
		[nStatus],
		[dtInsertionTimeStamp]
		)
	SELECT  [uidActivityId],
		[uidServiceInstanceId],
		[uidMessageInstanceId],
		[nAdapterId],
		[nDecryptionSubjectId],
		[nSigningSubjectId],
		[strUrl],
		[nPartyId],
		[nPortId],
		[nSchemaId],
		[nPartCount],
		[nMessageSize],
		[dtTimestamp],
		[nStatus],
		[dtInsertionTimeStamp]
	FROM dta_MessageInOutEventsTemp


	INSERT INTO dta_MessageFieldValues (
		[uidMessageInstanceId],
		[nMessageFieldsId],
		[nSchemaId],
		[vtValue],
		[nValueIndex]
		)
	SELECT  [uidMessageInstanceId],
		[nMessageFieldsId],
		[nSchemaId],
		[vtValue],
		[nValueIndex]
	FROM dta_MessageFieldValuesTemp

	INSERT INTO dta_CallChain (
		[uidServiceInstanceId],
		[vtCallersActionId],
		[uidCallersServiceId],
		[nCallersServiceSequence],
		[uidCalleesServiceId],
		[nCalleesServiceSequence],
		[dtInsertionTimeStamp]
		)
	SELECT  [uidServiceInstanceId],
		[vtCallersActionId],
		[uidCallersServiceId],
		[nCallersServiceSequence],
		[uidCalleesServiceId],
		[nCalleesServiceSequence],
		[dtInsertionTimeStamp]
	FROM dta_CallChainTemp

	INSERT INTO dta_DebugTrace (
		[uidServiceInstanceId],
		[vtInstructionId], 
		[nServiceSequence],
		[nBeginInternalSequence],
		[nEndInternalSequence],
		[dtBeginTimeStamp],
		[dtEndTimeStamp],
		[dtInsertionTimeStamp]
		)
	SELECT  [uidServiceInstanceId],
		[vtInstructionId], 
		[nServiceSequence],
		[nBeginInternalSequence],
		[nEndInternalSequence],
		[dtBeginTimeStamp],
		[dtEndTimeStamp],
		[dtInsertionTimeStamp]
	FROM dta_DebugTraceTemp


	TRUNCATE TABLE dta_ServiceInstancesTemp
	TRUNCATE TABLE dta_MessageInOutEventsTemp
	TRUNCATE TABLE dta_MessageFieldValuesTemp
	TRUNCATE TABLE dta_DebugTraceTemp
	TRUNCATE TABLE dta_CallChainTemp

	exec dtasp_CreateMessageFactsFindMsgViews
	exec dtasp_CreateRealNamesView
	exec dtasp_CreateServiceFactsView
END

GO

CREATE PROCEDURE [dbo].[dtasp_ArchiveSuccessfull]
@nID int
AS
	UPDATE dta_ArchiveHistory SET nSuccess = 1, nFailureCount = 0, dtLastFailure = null WHERE nID = @nID
GO
GRANT EXEC ON [dbo].[dtasp_ArchiveSuccessfull] TO BTS_BACKUP_USERS
GO

CREATE PROCEDURE [dbo].[dtasp_ArchiveFailed]
@nID int
AS

	declare @dtNow datetime
	
	set @dtNow = GetUTCDate()
	
	UPDATE dta_ArchiveHistory SET nSuccess = -1, nFailureCount = nFailureCount + 1, dtLastFailure = @dtNow WHERE nID = @nID
GO
GRANT EXEC ON [dbo].[dtasp_ArchiveFailed] TO BTS_BACKUP_USERS
GO

CREATE PROCEDURE [dbo].[dtasp_GetLastArchiveLocation]
@nvcLastArchiveLocation nvarchar(2000) OUTPUT,
@nID int OUTPUT
AS
	declare @nSuccess int
	set @nSuccess = -1

	SELECT TOP 1 @nvcLastArchiveLocation = nvcBackupLocation, @nID = nID, @nSuccess = nSuccess FROM dta_ArchiveHistory ORDER BY dtTimeStamp DESC
	IF (@nSuccess != 0)
		set @nvcLastArchiveLocation = null -- it either failed or was already validated, so this is a no op
GO
GRANT EXEC ON [dbo].[dtasp_GetLastArchiveLocation] TO BTS_BACKUP_USERS
GO

CREATE PROCEDURE [dbo].[dtasp_TrimArchiveHistory]
@dtTimeStamp datetime
AS

	DELETE FROM dta_ArchiveHistory WHERE dtTimeStamp < @dtTimeStamp
GO
GRANT EXEC ON [dbo].[dtasp_TrimArchiveHistory] TO BTS_BACKUP_USERS
GO


/************ Recreate the views **************************/
exec dtasp_CreateMessageFactsFindMsgViews
exec dtasp_CreateRealNamesView
exec dtasp_CreateServiceFactsView
GO

BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT   
  DECLARE @dbname sysname

  set @dbname = db_name()   

   declare @name sysname
   set @name = N'DTA Purge and Archive (' + db_name() + ')'

  --need to delete the old job if it is still there
  IF EXISTS (SELECT job_id FROM msdb.dbo.sysjobs WHERE name = N'DTA Purge and Archive')
  BEGIN  
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = N'DTA Purge and Archive'
  END


  SELECT @ReturnCode = 0     
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = @name )       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''DTA Purge and Archive'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = @name  
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name , @description = N'Job to automate the purging and archiving of the tracking database', @category_name = N'Database Maintenance', @enabled = 0, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'Archive and Purge', @command = N'exec dtasp_BackupAndPurgeTrackingDatabase
0, --@nLiveHours tinyint, --Any completed instance older than the live hours +live days
1, --@nLiveDays tinyint = 0, --will be deleted along with all associated data
30, --@nHardDeleteDays tinyint = 0, --all data older than this will be deleted.
null, --@nvcFolder nvarchar(1024) = null, --folder for backup files
null, --@nvcValidatingServer sysname = null,
0 --@fForceBackup int = 0 --', @database_name = @dbname, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job schedules
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'Archive and Purge Schedule', @enabled = 1, @freq_type = 4, @active_start_date = 20040927, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 1, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
 GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 


GO

CREATE PROCEDURE [dbo].[dtasp_RebuildIndexes]
AS

	DBCC DBREINDEX ('[dbo].[Tracking_Spool1]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[Tracking_Spool2]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[Tracking_Parts1]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[Tracking_Parts2]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[Tracking_Fragments1]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[Tracking_Fragments2]') WITH NO_INFOMSGS

	DBCC DBREINDEX ('[dbo].[dta_ServiceInstances]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_ServiceInstanceExceptions ]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_MessageFieldValues]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_CallChain]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_MessageInOutEvents]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_DebugTrace]') WITH NO_INFOMSGS
	/*
	DBCC DBREINDEX ('[dbo].[dta_RulesAgendaUpdates]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_RulesConditionEvaluation]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_RuleSetEngineAssociation]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_RulesFactActivity]') WITH NO_INFOMSGS
	DBCC DBREINDEX ('[dbo].[dta_RulesFired]') WITH NO_INFOMSGS
	*/
GO



