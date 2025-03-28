--/ Copyright (c) 1999-2004 Microsoft Corporation. All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/  
--/---------------------------------------------------------------------------------------------------------------
--//
--// Admin_Logic.SQL
--//
--//
--// Description: Configuration file for BizTalk Admin SQL stored procedures
--//
--/---------------------------------------------------------------------------------------------------------------
--

-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Remove existing Admin stored procedures
-- //////////////////////////////////////////////////////////////////////////////////////////////////

if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_removesprocs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	exec [dbo].[adm_removesprocs]
GO

CREATE PROCEDURE [dbo].[adm_removesprocs]
AS
	--///////////////////////////////////////////////////////////////////////////
	--// remove stored procedures
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bts_SafeAddLinkedServer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[bts_SafeAddLinkedServer]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_CleanupMgmtDB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_CleanupMgmtDB]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_IsBTSAdmin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_IsBTSAdmin]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Group_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Group_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Group_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Group_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Group_SetAnalysisServer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Group_SetAnalysisServer]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MessageBox_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MessageBox_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MessageBox_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MessageBox_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MessageBox_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox_ForceDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MessageBox_ForceDelete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MessageBox_Internal_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MessageBox_Internal_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server_Enum]

	--	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	--	drop procedure [dbo].[adm_Server2HostMapping_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping_Map]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server2HostMapping_Map]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping_Unmap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server2HostMapping_Unmap]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping_ForceUnmap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server2HostMapping_ForceUnmap]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping_PrepareHostInstState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server2HostMapping_PrepareHostInstState]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server2HostMapping_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Server2HostMapping_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Server2HostMapping_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_PrepareHostInstState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_PrepareHostInstState]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_Delete]

	-- Removing Host ForceDelete functionality (EBiz Suite bug 6584)
	--	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_ForceDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	--	drop procedure [dbo].[adm_Host_ForceDelete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_Verify_Before_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_Verify_Before_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_PrepareUpdateDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_PrepareUpdateDelete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_HostInstance_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_HostInstance_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_HostInstance_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_HostInstance_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_HostInstance_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_HostInstance_PrepareHostInstState]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_HostInstance_PrepareHostInstState]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Adapter_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Adapter_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Adapter_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Adapter_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Adapter_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Adapter_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Adapter_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Adapter_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Adapter_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Adapter_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveHandler_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ReceiveHandler_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveHandler_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ReceiveHandler_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveHandler_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ReceiveHandler_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveHandler_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ReceiveHandler_Delete]
    
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveHandler_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ReceiveHandler_Enum]
    
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler_Create]
    
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler_Update]
    
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler_Enum]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler2_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler2_Create]
    
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler2_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler2_Update]
    
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler2_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler2_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler2_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler2_Enum]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendHandler2_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendHandler2_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendPort_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendPort_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendPort_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendPort_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_SendPort_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_SendPort_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_removesprocs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_removesprocs]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MsgBoxConfig_Subscriber_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MsgBoxConfig_Subscriber_Create]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_MsgBoxConfig_Subscriber_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_MsgBoxConfig_Subscriber_Delete]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Repl_Get_DistributionDB_Name]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_Repl_Get_DistributionDB_Name]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Queue_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Queue_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Queue_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Queue_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Orchestration_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Orchestration_Load]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Orchestration_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Orchestration_Enum]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Orchestration_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Orchestration_Update]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Orchestration_Enlistment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Orchestration_Enlistment]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Orchestration_GetPortLrpBinding]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Orchestration_GetPortLrpBinding]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Orchestration_ToggleRLs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Orchestration_ToggleRLs]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Orchestration_QueryDependencyInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Orchestration_QueryDependencyInfo]

	--	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_util_MasterSubDB_Lookup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	--	drop procedure [dbo].[adm_util_MasterSubDB_Lookup]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ServiceInfo_Lookup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ServiceInfo_Lookup]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveLocationOrchestration_Load]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ReceiveLocationOrchestration_Load]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_ReceiveLocationOrchestration_Enum]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_ReceiveLocationOrchestration_Enum]

	--///////////////////////////////////////////////////////////////////////////
	--// remove TDDS related stored procedures

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Host_Register_TDDS_Services]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Host_Register_TDDS_Services]
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_AcquireAppLock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_AcquireAppLock]

	--///////////////////////////////////////////////////////////////////////////
	--// Remove Ops OM related sprocs
	
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_MapPredicatePropIDToString]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[ops_MapPredicatePropIDToString]

	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadOrchestrationServiceNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[ops_LoadOrchestrationServiceNames]

	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadSendPortServiceNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[ops_LoadSendPortServiceNames]

	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadReceivePortServiceNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[ops_LoadReceivePortServiceNames]

	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ops_LoadSendPortSpecificFields]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[ops_LoadSendPortSpecificFields]

	--///////////////////////////////////////////////////////////////////////////
	--// This SP is used for looking up parties from the run-time
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[admsvr_GetPartyByAliasNameValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[admsvr_GetPartyByAliasNameValue]

	--///////////////////////////////////////////////////////////////////////////
	--// remove functions
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_CheckRowCount]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_CheckRowCount]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_GetNumMisconfiguredRL]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_GetNumMisconfiguredRL]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_GetNumTransportConflictsInOrg]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_GetNumTransportConflictsInOrg]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_GetOrchestrationDependencies]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 0)
	drop function [dbo].[adm_GetOrchestrationDependencies]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_GetGroupName]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_GetGroupName]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_GetGroupId]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_GetGroupId]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_GetNumInstalledHostInstances]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_GetNumInstalledHostInstances]
	
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_fnConvertLocalToUTCDate]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_fnConvertLocalToUTCDate]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_fnConvertUTCToLocalDate]') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
	drop function [dbo].[adm_fnConvertUTCToLocalDate]

	--///////////////////////////////////////////////////////////////////////////
	--// remove backup procs
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_MarkAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_MarkAll]

	if exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[sp_MarkBTSLogs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_MarkBTSLogs]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull_Schedule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_BackupAllFull_Schedule]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_BackupAllFull]

	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull_Schedule]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_BackupAllFull_Schedule]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_BackupAllFull]
		
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_MarkAll]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_MarkAll]

	IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[sp_MarkBTSLogs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_MarkBTSLogs]

	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BuildFullMarkName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_BuildFullMarkName]

	IF exists (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[sp_CleanMarkName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_CleanMarkName]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BlockTDDS]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BlockTDDS]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BuildLogMarkString]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BuildLogMarkString]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BuildLogBackupString]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BuildLogBackupString]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_ForceFullBackup]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_ForceFullBackup]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_ReleaseBackupWriterLock]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_ReleaseBackupWriterLock]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_AcquireBackupWriterLock]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_AcquireBackupWriterLock]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetLinkedServerQTimeout]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetLinkedServerQTimeout]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetNextBackupSetId]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetNextBackupSetId]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetFileNameFromFilePath]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetFileNameFromFilePath]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_DeleteBackupHistory]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_DeleteBackupHistory]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetBackupHistory]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetBackupHistory]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetBackupDatabasesForServer]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetBackupDatabasesForServer]
		
	IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[sp_GetRemoteServerName]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetRemoteServerName]

	IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[sp_GetBackupDatabaseLocation]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetBackupDatabaseLocation]
	
	--///////////////////////////////////////////////////////////////////////////
	--// Remove BAS related stored procedures

	IF exists (select * FROM sysobjects where id = object_id(N'[dbo].[bas_DeleteProperty]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[bas_DeleteProperty]

	IF exists (select * FROM sysobjects where id = object_id(N'[dbo].[bas_GetPropertyValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[bas_GetPropertyValue]

	IF exists (select * FROM sysobjects where id = object_id(N'[dbo].[bas_SetPropertyValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[bas_SetPropertyValue]

	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[adm_toggleDefaultAppFlag]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[adm_toggleDefaultAppFlag]

GO

-- MessageBox Perf Counters stored procs for the management db 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MsgBoxPerfCounters_GetHosts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetHosts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MsgBoxPerfCounters_GetMACacheRefreshInterval]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetMACacheRefreshInterval]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MsgBoxPerfCounters_GetMsgBoxesAndServers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MsgBoxPerfCounters_GetMsgBoxesAndServers]
GO


--==========================Functions for converting times to and from UTC time=========================--
CREATE FUNCTION adm_fnConvertLocalToUTCDate (@dtParam datetime)
RETURNS datetime
AS
BEGIN

	declare @dtLocal datetime, @dtUTC datetime, @dtResult datetime

	SELECT @dtLocal = LocalDate FROM admv_LocalDate
	SELECT @dtUTC = UTCDate FROM admv_UTCDate

	set @dtResult = DATEADD(hour, DATEDIFF(hour, @dtLocal, @dtUTC), @dtParam)
	set @dtResult = DATEADD(minute, DATEDIFF(minute, @dtLocal, @dtUTC), @dtParam)

	return @dtResult
END 
GO
GRANT EXEC ON [dbo].[adm_fnConvertLocalToUTCDate] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_fnConvertLocalToUTCDate] TO BTS_HOST_USERS
GO
GRANT EXEC ON [dbo].[adm_fnConvertLocalToUTCDate] TO BTS_OPERATORS
GO


CREATE FUNCTION adm_fnConvertUTCToLocalDate (@dtParam datetime)
RETURNS datetime
AS
BEGIN

	declare @dtLocal datetime, @dtUTC datetime, @dtResult datetime

	SELECT @dtLocal = LocalDate FROM admv_LocalDate
	SELECT @dtUTC = UTCDate FROM admv_UTCDate

	set @dtResult = DATEADD(hour, DATEDIFF(hour, @dtUTC, @dtLocal), @dtParam)
	set @dtResult = DATEADD(minute, DATEDIFF(minute, @dtUTC, @dtLocal), @dtParam)

	return @dtResult
END 
GO
GRANT EXEC ON [dbo].[adm_fnConvertUTCToLocalDate] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_fnConvertUTCToLocalDate] TO BTS_HOST_USERS
GO
GRANT EXEC ON [dbo].[adm_fnConvertUTCToLocalDate] TO BTS_OPERATORS
GO

--========== stored procedure for cleaning the mgmt db without dropping tables ==============--
CREATE PROCEDURE [dbo].[adm_CleanupMgmtDB]
AS
	exec sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
	DELETE FROM adm_Group WHERE Name <> N'Biztalk Group'
	DELETE FROM adm_Host WHERE Name NOT IN ( N'BizTalkServerApplication', N'BizTalkServerIsolatedHost' )
	--DELETE FROM adm_DefaultHost WHERE GroupId NOT IN (SELECT Id FROM adm_Group) 
	DELETE FROM adm_MessageBox WHERE GroupId NOT IN (SELECT Id FROM adm_Group)

	--I will assume that this is the first row and only leave that server in the db
	DELETE FROM adm_Server WHERE Id <> 1
	DELETE FROM adm_Server2HostMapping WHERE ServerId <> 1
	DELETE FROM adm_HostInstance WHERE Svr2HostMappingId NOT IN (SELECT Id FROM adm_Server2HostMapping)

	--We'll just leave these tables alone since there is no way to add rows to them
	--truncate table adm_HostInstance_SubServices
	--truncate table adm_ServiceClass

	--Keep only MSMQT, HTTP, FILE, SMTP, SOAP and SQL adapter related rows
	DELETE FROM adm_Adapter WHERE Name NOT IN (N'MSMQT', N'HTTP', N'SMTP', N'FILE', N'SOAP', N'SQL', N'FTP', N'MSMQ', N'POP3', N'MQS' )
	DELETE FROM adm_SendHandler WHERE AdapterId NOT IN (SELECT Id FROM adm_Adapter) OR
						GroupId NOT IN (SELECT Id FROM adm_Group)
	DELETE FROM adm_ReceiveHandler WHERE AdapterId NOT IN (SELECT Id FROM adm_Adapter) OR
						GroupId NOT IN (SELECT Id FROM adm_Group)


	--Lets remove all modules except for the DefaultPipelines and the GlobalPropertySchemas
	DELETE FROM bts_assembly WHERE nvcName NOT IN (N'Microsoft.BizTalk.GlobalPropertySchemas', N'Microsoft.BizTalk.DefaultPipelines')
	DELETE FROM bt_DocumentSpec WHERE assemblyid NOT IN (SELECT nID FROM bts_assembly)
	DELETE FROM bts_item WHERE AssemblyId NOT IN (SELECT nID FROM bts_assembly)
	DELETE FROM bt_XMLShare WHERE id NOT IN (SELECT DISTINCT(shareid) FROM bt_DocumentSpec)

	--delete all but the default pipelines
	DELETE FROM bts_pipeline WHERE PipelineID NOT IN (SELECT Guid FROM bts_item)
	DELETE FROM bts_pipeline_config WHERE PipelineID NOT IN (SELECT Id FROM bts_pipeline)
	DELETE FROM bts_pipeline_stage WHERE Id NOT IN (SELECT StageID FROM bts_pipeline_config)
	DELETE FROM bts_stage_config WHERE StageID NOT IN (SELECT StageID FROM bts_pipeline_config)
	DELETE FROM bts_component WHERE Id NOT IN (SELECT CompID FROM bts_stage_config)

	--There is a view which references these tables so I can't truncate them
	DELETE FROM bts_orchestration
	DELETE FROM bts_assembly_orchestration_Mapping

	DELETE FROM bts_messagetype_part
	DELETE FROM bts_messagetype
	DELETE FROM bts_operation_msgtype
	DELETE FROM bts_assembly_msgtype_Mapping
	DELETE FROM bts_porttype_operation
	DELETE FROM bts_porttype
	DELETE FROM bts_assembly_porttype_Mapping
	DELETE FROM bts_role_porttype
	DELETE FROM bts_role
	DELETE FROM bts_rolelink_type
	DELETE FROM bts_assembly_rolelink_type_Mapping
	DELETE FROM bts_orchestration_port
	--DELETE FROM bts_transform_service


	DELETE FROM StaticTrackingInfo
	DELETE FROM adm_HostInstanceZombie
	DELETE FROM adm_ReceiveLocation
	DELETE FROM bt_MapSpec
	DELETE FROM bt_Properties
	DELETE FROM bts_itemreference
	DELETE FROM bts_party_alias
	DELETE FROM bts_enlistedparty_operation_Mapping
	DELETE FROM bts_enlistedparty_port_Mapping
	DELETE FROM bts_enlistedparty
	DELETE FROM bts_party
	DELETE FROM bts_party_sendport
	DELETE FROM bts_spg_sendport
	DELETE FROM bts_libreference
	DELETE FROM bts_sendport_transport
	DELETE FROM bts_orchestration_invocation
	DELETE FROM bts_rolelink
	DELETE FROM bts_orchestration_port_binding
	--DELETE FROM bts_transformservice_msg
	DELETE FROM bts_receiveport
	DELETE FROM adm_receivelocation
	DELETE FROM bts_sendport
	DELETE FROM bts_sendportgroup

	-- Clean the BAS related table
	DELETE FROM bas_Properties
	exec sp_MSforeachtable "ALTER TABLE ? CHECK CONSTRAINT all"

GO


--========== utility stored functions ==============--
CREATE PROCEDURE [dbo].[bts_SafeAddLinkedServer]
@linkedServer sysname
AS

declare @localServer sysname, @svr sysname


declare @localized_string_Unconfigured_Linked_Server nvarchar(128)
set @localized_string_Unconfigured_Linked_Server = N'%s was configured as a linked server as required by BizTalk Server.'

set @localServer = CAST(SERVERPROPERTY('servername') as sysname)

if ( (@linkedServer IS NULL) OR (@linkedServer = @localServer) )
BEGIN
	--this is just a noop
	return
END

CREATE TABLE #Servers (SRV_NAME sysname, SRV_PROVIDERNAME nvarchar(128) NULL, SRV_PRODUCT nvarchar(128) NULL, SRV_DATASOURCE nvarchar(4000) NULL, SRV_PROVIDERSTRING nvarchar(4000) NULL, SRV_LOCATION nvarchar(4000) NULL, SRV_CAT sysname NULL )
INSERT INTO #Servers exec sp_linkedservers

IF NOT EXISTS (SELECT TOP 1 SRV_NAME FROM #Servers WHERE SRV_NAME = @linkedServer)
BEGIN
	--they are not yet linked so we will link them
	exec sp_addlinkedserver @srvproduct = 'SQL Server', @server = @linkedServer
	RAISERROR(@localized_string_Unconfigured_Linked_Server, 10, 1)
END

DROP TABLE #Servers

GO

CREATE FUNCTION [dbo].[adm_GetGroupName] ()
RETURNS nvarchar(256)
AS
BEGIN
	declare @GroupName as nvarchar(256)
	select @GroupName = Name from adm_Group

	return @GroupName
END
GO

CREATE FUNCTION [dbo].[adm_GetGroupId] ()
RETURNS int
AS
BEGIN
	declare @GroupId as int
	select @GroupId = Id from adm_Group

	return @GroupId
END
GO

CREATE PROCEDURE [dbo].[adm_IsBTSAdmin]
AS
	return 0
GO

GRANT EXEC ON [dbo].[adm_IsBTSAdmin] TO BTS_ADMIN_USERS
GO

--========== Basic stored procedures for adm_Group table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_Group_Create]
@MgmtDBServerName nvarchar(80),
@MgmtDBName nvarchar(128),
@Name nvarchar(256),
@TrackingDBServerName nvarchar(80),
@TrackingDBName nvarchar(128),
@SubscriptionDBServerName nvarchar(80),
@SubscriptionDBName nvarchar(128),
@TrackAnalysisServerName nvarchar(80),
@TrackAnalysisDBName nvarchar(128),
@BamDBServerName nvarchar(80),
@BamDBName nvarchar(128),
@RuleEngineDBServerName nvarchar(80),
@RuleEngineDBName nvarchar(128),
@SSOServerName nvarchar(80),
@GlobalTrackingOption int,
@SignCertName nvarchar(256),
@SignCertThumbprint nvarchar(80),
@ConfigurationCacheRefreshInterval int,
@BizTalkAdminGroup nvarchar(128),
@LMSFragmentSize int,
@LMSThreshold int,
@BizTalkOperatorGroup nvarchar(128),
@GroupPropertyIdentifier nvarchar(128)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0
	
	if ( @LMSThreshold < @LMSFragmentSize )
	begin
		Set @ErrCode = 0xC0C025F8  -- CIS_E_ADMIN_CORE_THRESHOLD_LESS_THAN_FRAGMENT_SIZE	
		return @ErrCode
	end

	begin transaction

		insert into adm_Group
		(
			Name, 
			TrackingDBServerName, 
			TrackingDBName, 
			SubscriptionDBServerName, 
			SubscriptionDBName, 
			TrackAnalysisServerName, 
			TrackAnalysisDBName, 
			BamDBServerName, 
			BamDBName, 
			RuleEngineDBServerName, 
			RuleEngineDBName, 
			SSOServerName,
			GlobalTrackingOption,
			SignCertName,
			SignCertThumbprint,
			ConfigurationCacheRefreshInterval,
			BizTalkAdminGroup,
			LMSFragmentSize,
			LMSThreshold,
			BizTalkOperatorGroup,
			GroupPropertyIdentifier
		)
		values
		(
			@Name, 
			@TrackingDBServerName, 
			@TrackingDBName, 
			@SubscriptionDBServerName, 
			@SubscriptionDBName, 
			@TrackAnalysisServerName,
			@TrackAnalysisDBName,
			@BamDBServerName, 
			@BamDBName, 
			@RuleEngineDBServerName, 
			@RuleEngineDBName, 
			@SSOServerName,
			@GlobalTrackingOption,
			@SignCertName,
			@SignCertThumbprint,
			@ConfigurationCacheRefreshInterval,
			@BizTalkAdminGroup,
			@LMSFragmentSize,
			@LMSThreshold,
			@BizTalkOperatorGroup,
			@GroupPropertyIdentifier
		)
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		declare @localized_string_HM_1 as nvarchar(256)
		set @localized_string_HM_1 = N'Health Monitoring'
		declare @localized_string_BI_1 as nvarchar(256)
		set @localized_string_BI_1 = N'Business Monitoring'
		
		--configure TDDS:

		--Health Monitoring Destination
		exec @ErrCode = TDDS_CreateDBDestination @localized_string_HM_1, @TrackingDBServerName, @TrackingDBName
		if ( @ErrCode <> 0 ) goto exit_proc

		--Business Tracking Destination
		exec @ErrCode = TDDS_CreateDBDestination @localized_string_BI_1, @TrackingDBServerName, @TrackingDBName
		if ( @ErrCode <> 0 ) goto exit_proc

		-- add the MsgBox record for the Subscription DB (Master MB)
		exec @ErrCode = dbo.adm_MessageBox_Create @SubscriptionDBServerName, @SubscriptionDBName, 0, 1, ''	-- eMSGBOX_CONFIGURATION_DONE
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Group_Create] TO BTS_ADMIN_USERS
GO

--// Update //--
CREATE PROCEDURE [dbo].[adm_Group_Update]
@MgmtDBServerName nvarchar(80),
@MgmtDBName nvarchar(128),
@Name nvarchar(256),
@TrackingDBServerName nvarchar(80),
@TrackingDBName nvarchar(128),
@SubscriptionDBServerName nvarchar(80),
@SubscriptionDBName nvarchar(128),
@TrackAnalysisServerName nvarchar(80),
@TrackAnalysisDBName nvarchar(128),
@BamDBServerName nvarchar(80),
@BamDBName nvarchar(128),
@RuleEngineDBServerName nvarchar(80),
@RuleEngineDBName nvarchar(128),
@SSOServerName nvarchar(80),
@GlobalTrackingOption int,
@SignCertName nvarchar(256),
@SignCertThumbprint nvarchar(80),
@ConfigurationCacheRefreshInterval int,
@BizTalkAdminGroup nvarchar(128),	-- this property actually cannot be updated
@LMSFragmentSize int,
@LMSThreshold int,
@BizTalkOperatorGroup nvarchar(128),
@GroupPropertyIdentifier nvarchar(128)  -- this property actually cannot be updated
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0
	
	if ( @LMSThreshold < @LMSFragmentSize )
	begin
		Set @ErrCode = 0xC0C025F8  -- CIS_E_ADMIN_CORE_THRESHOLD_LESS_THAN_FRAGMENT_SIZE
		return @ErrCode
	end

	begin transaction

		update adm_Group
		set
			Name = @Name,
			TrackingDBServerName = @TrackingDBServerName, 
			TrackingDBName = @TrackingDBName, 
			SubscriptionDBServerName = @SubscriptionDBServerName, 
			SubscriptionDBName = @SubscriptionDBName, 
			TrackAnalysisServerName = @TrackAnalysisServerName, 
			TrackAnalysisDBName = @TrackAnalysisDBName, 
			BamDBServerName = @BamDBServerName, 
			BamDBName = @BamDBName, 
			RuleEngineDBServerName = @RuleEngineDBServerName, 
			RuleEngineDBName = @RuleEngineDBName, 
			SSOServerName = @SSOServerName,
			GlobalTrackingOption = @GlobalTrackingOption,
			DateModified = GETUTCDATE(), 
			SignCertName = @SignCertName,
			SignCertThumbprint = @SignCertThumbprint,
			ConfigurationCacheRefreshInterval = @ConfigurationCacheRefreshInterval,
			LMSFragmentSize = @LMSFragmentSize,
			LMSThreshold = @LMSThreshold,
			BizTalkOperatorGroup = @BizTalkOperatorGroup

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
		-- Update the Master MsgBox record
		update adm_MessageBox
		set
			DateModified = GETUTCDATE(), 
			DBServerName = @SubscriptionDBServerName,
			DBName = @SubscriptionDBName
		where
			IsMasterMsgBox <> 0
			
		--configure TDDS:
		--declare @GroupName nvarchar(256)
		--set @GroupName = dbo.adm_GetGroupName()

		--exec @ErrCode = TDDS_UpdatePoolRefreshInterval @ConfigurationCacheRefreshInterval
		--if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Group_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_Group_Load]
@MgmtDBServerName nvarchar(80),
@MgmtDBName nvarchar(128)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		top 1
		Id,
		@MgmtDBServerName,
		@MgmtDBName,
		Name, 
		TrackingDBServerName, 
		TrackingDBName, 
		SubscriptionDBServerName, 
		SubscriptionDBName, 
		TrackAnalysisServerName, 
		TrackAnalysisDBName, 
		BamDBServerName, 
		BamDBName, 
		RuleEngineDBServerName, 
		RuleEngineDBName, 
		SSOServerName,
		GlobalTrackingOption,
		SignCertName,
		SignCertThumbprint,
		DateModified, 
		ConfigurationCacheRefreshInterval,
		BizTalkAdminGroup,
		BizTalkDBVersion.DatabaseMajor,
		BizTalkDBVersion.DatabaseMinor,
		LMSFragmentSize,
		LMSThreshold,
		BizTalkOperatorGroup,
		GroupPropertyIdentifier 
	from
		adm_Group,
		BizTalkDBVersion
	where
		BizTalkDBVersion.BizTalkDBName = N'Management DB'
	order
		by BizTalkDBVersion.DatabaseMajor, BizTalkDBVersion.DatabaseMinor DESC

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_Group_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Group_Load] TO BTS_OPERATORS
GO

--// Delete //--
--CREATE PROCEDURE [dbo].[adm_Group_Delete]
--AS
--	set nocount on
--	set xact_abort on
--
--	declare @ErrCode as int
--	set @ErrCode = 0
--
--	begin transaction
--		if exists (select * from adm_Group where Name = @Name and IsDefault<>0)
--		begin
--			set @ErrCode = 0xC0C0256A -- CIS_E_ADMIN_CORE_CANNOT_DELETE_DEFAULT_GROUP
--			goto exit_proc
--		end
--		
--		-- delete the Master Messagebox Record
--		-- the perfect way to do this is to call the Stored Proc adm_MessageBox_Delete, but that SP prevents the
--		-- master MB to be deleted.
--		-- Since the Group Delete operation will eventually go away, it is OK to directly delete the record from the MsgBox table
--		
--		delete 
--			adm_MessageBox
--		where
--			(IsMasterMsgBox <> 0 AND GroupId = (SELECT Id FROM adm_Group WHERE Name = @Name) )		
--			
--		-- unmap all Hosts in the group from servers
--		delete
--			adm_Server2HostMapping
--		from
--			adm_Group,
--			adm_Host
--		where
--			adm_Server2HostMapping.HostId = adm_Host.Id AND
--			adm_Host.GroupId = adm_Group.Id AND
--			adm_Group.Name = @Name
--
--		-- delete default receive handler for this group
--		--delete adm_DefaultReceiveHandler
--		--from adm_Group, adm_Host
--		--where adm_DefaultReceiveHandler.GroupId  = adm_Group.Id AND adm_Group.Name = @Name
--
--		-- delete all receive handlers in this group
--		delete adm_ReceiveHandler
--		from adm_Group, adm_Host
--		where adm_ReceiveHandler.HostId = adm_Host.Id AND
--			adm_Group.Id = adm_Host.GroupId AND adm_Group.Name = @Name
--
--		-- delete all send handlers in this group
--		delete adm_SendHandler
--		from adm_Group, adm_Host
--		where adm_SendHandler.HostId = adm_Host.Id AND
--			adm_Group.Id = adm_Host.GroupId AND adm_Group.Name = @Name
--
--		-- delete default Host for this group
--		delete adm_DefaultHost
--		from adm_Group
--		where adm_DefaultHost.GroupId = adm_Group.Id AND adm_Group.Name = @Name
--
--		-- delete all hosts in this group
--		delete adm_Host
--		from adm_Group
--		where adm_Host.GroupId = adm_Group.Id AND adm_Group.Name = @Name
--		
--		delete from adm_Group
--		where Name = @Name
--
--		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
--		if ( @ErrCode <> 0 ) goto exit_proc
--
--		--configure TDDS:
--		--remove all destinations for current group (in pool with the same name)
--		declare @localized_string_HM as nvarchar(256)
--		set @localized_string_HM = N'Health Monitoring'
--		declare @localized_string_BI as nvarchar(256)
--		set @localized_string_BI = N'Business Monitoring'
--
--			--HM
--		exec @ErrCode = TDDS_DeleteDestination @localized_string_HM
--		if ( @ErrCode <> 0 ) goto exit_proc
--				
--			--BI
--		exec @ErrCode = TDDS_DeleteDestination @localized_string_BI
--		if ( @ErrCode <> 0 ) goto exit_proc
--				
--exit_proc:
--	if(@ErrCode = 0)
--		commit transaction
--	else
--	begin
--		rollback transaction
--		return @ErrCode
--	end
--
--	set nocount off
--GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_Group_Enum]
AS
	set nocount on
	set xact_abort on

	select
		top 1
		Id,
		SERVERPROPERTY('ServerName'),
		DB_NAME(),
		Name, 
		TrackingDBServerName, 
		TrackingDBName, 
		SubscriptionDBServerName, 
		SubscriptionDBName, 
		TrackAnalysisServerName, 
		TrackAnalysisDBName, 
		BamDBServerName, 
		BamDBName, 
		RuleEngineDBServerName, 
		RuleEngineDBName, 
		SSOServerName,
		GlobalTrackingOption,
		SignCertName,
		SignCertThumbprint,
		DateModified, 
		ConfigurationCacheRefreshInterval,
		BizTalkAdminGroup,
		BizTalkDBVersion.DatabaseMajor,
		BizTalkDBVersion.DatabaseMinor,
		LMSFragmentSize,
		LMSThreshold,
		BizTalkOperatorGroup,
		GroupPropertyIdentifier 
	from
		adm_Group,
		BizTalkDBVersion
	where
		BizTalkDBVersion.BizTalkDBName = N'Management DB'
	order
		by BizTalkDBVersion.DatabaseMajor,	BizTalkDBVersion.DatabaseMinor DESC

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Group_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Group_Enum] TO BTS_OPERATORS
GO

--// SetAnalysisServer //--
CREATE PROCEDURE [dbo].[adm_Group_SetAnalysisServer]
@Name nvarchar(256),
@TrackAnalysisServerName nvarchar(80),
@TrackAnalysisDBName nvarchar(128)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction
		
		update adm_Group
		set
			TrackAnalysisServerName = @TrackAnalysisServerName, 
			TrackAnalysisDBName = @TrackAnalysisDBName,
			DateModified = GETUTCDATE()
		where
			Name = @Name

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Group_SetAnalysisServer] TO BTS_ADMIN_USERS
GO

--========== Basic stored procedures for adm_MessageBox table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_MessageBox_Create]
@DBServerName nvarchar(80),
@DBName nvarchar(128),
@DisableNewMsgPublication int,
@ConfigurationState int,
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction

		declare @BIZTALK_UNKNOWN_DBID int
		set @BIZTALK_UNKNOWN_DBID = 0

		declare @GroupName as nvarchar(256)

		declare @GroupId as int
		set @GroupId = @BIZTALK_UNKNOWN_DBID

		declare @MsgBoxId as int
		set @MsgBoxId = @BIZTALK_UNKNOWN_DBID

		declare @IsMasterMsgBox int
		set @IsMasterMsgBox = 0
		
		declare @SubscriptionDBServerName nvarchar(80)
		declare @SubscriptionDBName nvarchar(128)
		
		-- Resolve foreign key: GroupId 
		select @GroupId = Id, @GroupName = Name, @SubscriptionDBServerName = SubscriptionDBServerName, @SubscriptionDBName = SubscriptionDBName
		from adm_Group
		
		if ( @GroupId = @BIZTALK_UNKNOWN_DBID )
		begin
			rollback transaction
			return 0xC0C02509	-- CIS_E_ADMIN_CORE_MSGBOX_INVALID_GROUP
		end

		-- If the Message Box is same as the Subscription DB, set this Message Box as the Master Message Box
		
		if ( @SubscriptionDBServerName = @DBServerName AND @SubscriptionDBName = @DBName )
		begin
			set @IsMasterMsgBox = -1
		end
		
		insert into adm_MessageBox
		(
			GroupId, 
			DBServerName, 
			DBName, 
			DisableNewMsgPublication,
			ConfigurationState,
			IsMasterMsgBox,
			nvcDescription
		)
		values
		(
			@GroupId, 
			@DBServerName, 
			@DBName, 
			@DisableNewMsgPublication,
			@ConfigurationState,
			@IsMasterMsgBox,
			@Description
		)
		
		-- check if inserted OK
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		
	-- configure TDDS destinations:
		declare @localized_string_HM_2 as nvarchar(256)
		set @localized_string_HM_2 = N'Health Monitoring'
		declare @localized_string_BI_2 as nvarchar(256)
		set @localized_string_BI_2 = N'Business Monitoring'
	
		declare @HMSourceName as nvarchar(256)
		select @HMSourceName = @DBServerName + '_' + @DBName
		declare @BISourceName as nvarchar(256)
		select @BISourceName = @DBServerName + '_' + @DBName

		
	--HM:
		exec @ErrCode = TDDS_CreateDBSource @localized_string_HM_2, @HMSourceName, @DBServerName, @DBName, 1
		if ( @ErrCode <> 0 ) goto exit_proc
	--BI:
		exec @ErrCode = TDDS_CreateDBSource @localized_string_BI_2, @BISourceName, @DBServerName, @DBName, 0
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Create] TO BTS_ADMIN_USERS
GO

--// Update //--
CREATE PROCEDURE [dbo].[adm_MessageBox_Update]
@DBServerName nvarchar(80),
@DBName nvarchar(128),
@DisableNewMsgPublication int,
@ConfigurationState int,
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction
	
		update adm_MessageBox
		set
			DateModified = GETUTCDATE(), 
			DisableNewMsgPublication = @DisableNewMsgPublication,
			ConfigurationState = @ConfigurationState,
			nvcDescription = @Description
		where
			DBServerName = @DBServerName AND
			DBName = @DBName

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_MessageBox_Load]
@DBServerName nvarchar(80),
@DBName nvarchar(128)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		adm_MessageBox.Id,
		adm_MessageBox.DBServerName, 
		adm_MessageBox.DBName, 
		adm_MessageBox.DateModified, 
		adm_MessageBox.DisableNewMsgPublication,
		adm_MessageBox.ConfigurationState,
		adm_MessageBox.IsMasterMsgBox,
		adm_MessageBox.nvcDescription
	from
		adm_MessageBox
	where
		adm_MessageBox.DBServerName = @DBServerName AND
		adm_MessageBox.DBName = @DBName

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Load] TO BTS_OPERATORS
GO

--// Delete //--
CREATE PROCEDURE [dbo].[adm_MessageBox_Delete]
@DBServerName nvarchar(80),
@DBName nvarchar(128)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0
	
	-- Constraint checking before removing msgbox record
	declare @DisableNewMsgPublication as int
	declare @DateModified as datetime

	select	@DisableNewMsgPublication = DisableNewMsgPublication,
			@DateModified = DateModified
	from	adm_MessageBox
	where	DBServerName = @DBServerName AND
			DBName = @DBName

	declare @ConfigurationCacheRefreshInterval as int

	select 
		@ConfigurationCacheRefreshInterval = ConfigurationCacheRefreshInterval
	from
		adm_Group Grp

	-- The constraints are as follows:
	-- 1) The messagebox must be marked as Disable New Message Publication
	-- 2) At least two runtime cache refresh interval has passed since the messagebox
	--    was marked as Disable New Message Publication.  This limitation minimizes the
	--    chance that a host instance could send new work into a messagebox after the
	--    user has initiated deletion.		
	if ( @DisableNewMsgPublication <> -1 )
		set @ErrCode = 0xC0C025BC	-- CIS_E_ADMIN_CORE_MSGBOX_DELETE_PUBLICATION_NOT_DISABLED
	else if ( DATEDIFF(ss, @DateModified, GETUTCDATE()) < (@ConfigurationCacheRefreshInterval * 2))
		set @ErrCode = 0xC0C025BB	-- CIS_E_ADMIN_CORE_MSGBOX_DELETE_FAIL_WORK_REMAIN

	if ( @ErrCode <> 0 ) goto exit_proc
	
	-- Invoke internal method to remove msgbox record and related records
	exec @ErrCode = adm_MessageBox_Internal_Delete @DBServerName, @DBName
	if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Delete] TO BTS_ADMIN_USERS
GO

--// ForceDelete //--
CREATE PROCEDURE [dbo].[adm_MessageBox_ForceDelete]
@DBServerName nvarchar(80),
@DBName nvarchar(128)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	-- Invoke internal method to remove msgbox record and related records, bypassing any constraint checking
	exec @ErrCode = adm_MessageBox_Internal_Delete @DBServerName, @DBName
	if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_MessageBox_ForceDelete] TO BTS_ADMIN_USERS
GO

--// Internal Delete ethod//--
CREATE PROCEDURE [dbo].[adm_MessageBox_Internal_Delete]
@DBServerName nvarchar(80),
@DBName nvarchar(128)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction

		declare @BIZTALK_UNKNOWN_DBID int
		set @BIZTALK_UNKNOWN_DBID = 0

		-- Resolve adm_MessageBox.Id
		declare @MsgBoxId as int
		set @MsgBoxId = @BIZTALK_UNKNOWN_DBID

		declare @IsMasterMsgBox as int
		
		select @MsgBoxId = Id, @IsMasterMsgBox = IsMasterMsgBox
		from adm_MessageBox
		where
			DBServerName = @DBServerName AND
			DBName = @DBName
		
		-- Master MsgBox can not be deleted
		
		if (@IsMasterMsgBox <> 0)
		begin
			set @ErrCode = 0xC0C025BD -- CIS_E_ADMIN_CANT_DELETE_MASTERMSGBOX
			goto exit_proc
		end
		
		-- Delete the adm_MessageBox record
		delete from adm_MessageBox
		where Id = @MsgBoxId

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
		--TDDS configuration - remove sources for given MsgBox in given pool		
		declare @localized_string_HM_3 as nvarchar(256)
		set @localized_string_HM_3 = N'Health Monitoring'
		declare @localized_string_BI_3 as nvarchar(256)
		set @localized_string_BI_3 = N'Business Monitoring'

		declare @HMSourceName as nvarchar(256)
		select @HMSourceName = @DBServerName + '_' + @DBName
		declare @BISourceName as nvarchar(256)
		select @BISourceName = @DBServerName + '_' + @DBName

		--remove all sources in given pool that correspond to given msg box
			--HM:
		declare @GroupName nvarchar(256)
		set @GroupName = dbo.adm_GetGroupName()

		exec @ErrCode = TDDS_DeleteSource @localized_string_HM_3, @HMSourceName
		if ( @ErrCode <> 0 ) goto exit_proc
			--BI:
		exec @ErrCode = TDDS_DeleteSource @localized_string_BI_3, @BISourceName
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Internal_Delete] TO BTS_ADMIN_USERS
GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_MessageBox_Enum]
AS
	set nocount on
	set xact_abort on

	select
		adm_MessageBox.Id, 
		adm_MessageBox.DBServerName, 
		adm_MessageBox.DBName, 
		adm_MessageBox.DateModified, 
		adm_MessageBox.DisableNewMsgPublication,
		adm_MessageBox.ConfigurationState,
		adm_MessageBox.IsMasterMsgBox,
		adm_MessageBox.nvcDescription
	from
		adm_MessageBox

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_MessageBox_Enum] TO BTS_OPERATORS
GO

--========== Basic stored procedures for adm_Server table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_Server_Create]
@Name nvarchar(63)
AS
	set nocount on
	set xact_abort on

	begin transaction

		declare @BIZTALK_UNKNOWN_DBID int
		set @BIZTALK_UNKNOWN_DBID = 0

		declare @ServerId as int
		set @ServerId = @BIZTALK_UNKNOWN_DBID

		-- Resolve foreign key: ServerId 
		select @ServerId = Id
		from adm_Server
		where Name = @Name

		-- Create new adm_Server record
		insert into adm_Server
		(
			Name
		)
		values
		(
			@Name
		)

		set @ServerId = @@IDENTITY

		-- Create the necessary adm_Server2HostMapping records
		insert into adm_Server2HostMapping
			(ServerId, HostId, IsMapped)
		select
			@ServerId,
			adm_Host.Id,
			0		-- by default new Server is never Mapped
		from
			adm_Host

	commit transaction

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server_Create] TO BTS_ADMIN_USERS
GO

-- Note: This update operation does not do much until we have new updatable properties on the Server class
--// Update //--
CREATE PROCEDURE [dbo].[adm_Server_Update]
@Name nvarchar(63)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction

		-- Update adm_Server record
		update adm_Server
		set
			DateModified = GETUTCDATE()
		where
			adm_Server.Name = @Name

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_Server_Load]
@Name nvarchar(63)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	-- Update adm_Server record
	select
		adm_Server.Id, 
		adm_Server.Name, 
		adm_Server.DateModified
	from
		adm_Server
	where
		adm_Server.Name = @Name

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Server_Load] TO BTS_OPERATORS
GO

--// Delete //--
CREATE PROCEDURE [dbo].[adm_Server_Delete]
@Name nvarchar(63)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @existHostInst as int
	select @ErrCode = 0, @existHostInst = 0

	begin transaction
	
		select @existHostInst = count(*)
		from
			adm_Server svr,
			adm_Server2HostMapping map,
			adm_HostInstance HostInst
		where
			svr.Name = @Name AND
			map.ServerId = svr.Id AND
			map.Id = HostInst.Svr2HostMappingId

		-- Cannot delete server when there are still host instances installed on it
		if ( @existHostInst > 0 )
		begin
			set @ErrCode = 0xC0C0259E	-- CIS_E_ADMIN_CORE_SERVER_DELELE_WITH_HostInst
			goto exit_proc
		end

		-- Delete related adm_Server2HostMapping records (for all Hosts in all Groups)
		delete adm_Server2HostMapping
		from adm_Server
		where
			adm_Server.Name=@Name AND
			adm_Server2HostMapping.ServerId = adm_Server.Id

		delete adm_Server
		where Name=@Name

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server_Delete] TO BTS_ADMIN_USERS
GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_Server_Enum]
AS
	set nocount on
	set xact_abort on

	select
		adm_Server.Id, 
		adm_Server.Name, 
		adm_Server.DateModified
	from
		adm_Server

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Server_Enum] TO BTS_OPERATORS
GO

--procedure used to go over all host instances
--and register/unregister TDDS service for every of them
create procedure [dbo].[adm_Host_Register_TDDS_Services]
@Name nvarchar(256),
@Register int
as
	declare @SvrName as nvarchar(256)
	declare @SvcId as uniqueidentifier

	declare @ErrCode as int
	select @ErrCode = 0
	
	DECLARE HostInstList CURSOR FOR
	select Svr.Name, HostInst.UniqueId 
	from 
		adm_HostInstance HostInst,
		adm_Server2HostMapping Mapping,
		adm_Server Svr,
		adm_Host Host
	where 
		HostInst.Svr2HostMappingId = Mapping.Id and
		Mapping.ServerId = Svr.Id and
		Mapping.HostId = Host.Id and
		Host.Name = @Name

	OPEN HostInstList
	FETCH NEXT FROM HostInstList into @SvrName, @SvcId
	WHILE ((@@fetch_status <> -1))
	BEGIN
		--	register/unregister server for given host instance
		declare @GroupName nvarchar(256)
		set @GroupName = dbo.adm_GetGroupName()

		if ( @Register <> 0 )
			begin
				exec @ErrCode = TDDS_RegisterService @SvcId, @SvrName
			end
		else
			begin
				exec @ErrCode = TDDS_UnregisterService @SvcId
			end	
			
		--return if error
		if ( @ErrCode <> 0 )
			break;
		
		FETCH NEXT FROM HostInstList into @SvrName, @SvcId
	END
	
	CLOSE HostInstList
	DEALLOCATE HostInstList

	if ( @ErrCode <> 0 )
		return @ErrCode

GO
GRANT EXEC ON [dbo].[adm_Host_Register_TDDS_Services] TO BTS_ADMIN_USERS
GO


--========== Basic stored procedures for adm_Server2HostMapping table ==========--

----// Update //--
--CREATE PROCEDURE [dbo].[adm_Server2HostMapping_Update]
--@GroupName nvarchar(256),
--@ServerName nvarchar(63),
--@HostName nvarchar(63),
--@IsMapped int
--AS
--	set nocount on
--	set xact_abort on
--
--	declare @ErrCode as int
--	set @ErrCode = 0
--
--	begin transaction
--
--		update adm_Server2HostMapping
--		set
--			DateModified = GETUTCDATE(), 
--			IsMapped = @IsMapped
--		from
--			adm_Server,
--			adm_Host,
--			adm_Group
--		where
--			adm_Server.Name = @ServerName AND
--			adm_Server2HostMapping.ServerId = adm_Server.Id AND
--			adm_Host.Name = @HostName AND
--			adm_Group.Name=	@GroupName	AND
--			adm_Host.GroupId = adm_Group.Id AND
--			adm_Server2HostMapping.HostId = adm_Host.Id
--
--		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
--		if ( @ErrCode <> 0 ) goto exit_proc
--
--exit_proc:
--	if(@ErrCode = 0)
--		commit transaction
--	else
--	begin
--		rollback transaction
--		return @ErrCode
--	end
--
--	set nocount off
--GO

--// Map //--
CREATE PROCEDURE [dbo].[adm_Server2HostMapping_Map]
@ServerName nvarchar(63),
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	select @ErrCode = 0

	begin transaction

		-- Disallow inserts for clustered hosts
		if exists (
				select * 
				from 
					adm_Host
				where
					adm_Host.Name = @HostName AND
					adm_Host.ClusterResourceGroupName IS NOT NULL AND 
					adm_Host.ClusterResourceGroupName <> ''
			)
		begin
			set @ErrCode = 0xC0C024CB -- CIS_E_ADMIN_OPERATION_NOT_ALLOWED_ON_CLUSTERED_HOST
			goto exit_proc
		end
		
		insert into adm_HostInstance 
			(Svr2HostMappingId,
			 Name, 
			 LoginName, 
			 DisableHostInstance,
			 ConfigurationState)
		select
		 	adm_Server2HostMapping.Id,
				N'Microsoft BizTalk Server '+ adm_Host.Name + N' ' + adm_Server.Name,
			adm_Host.LastUsedLogon,
			0,	-- DisableHostInstance = "false"
			5 	-- eAPP_INST_CONFIG_NOT_INSTALLED
		from 	
			adm_Server,
			adm_Server2HostMapping,
			adm_Host
		where
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_Server2HostMapping.ServerId = adm_Server.Id  

		-- only one instance should be updated
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		update adm_Server2HostMapping
		set
			DateModified = GETUTCDATE(), 
			IsMapped = -1
		from
			adm_Server,
			adm_Host
		where
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_Server2HostMapping.ServerId = adm_Server.Id 

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		if (dbo.adm_GetNumTransportConflictsInOrg() <> 0)
			set @ErrCode = 0xC0C0257D -- CIS_E_ADMIN_CANNOT_MAP_BECAUSE_TRANSPORT_CONSTRAINT_PRIVATE_ERROR

		if ( @ErrCode <> 0 ) goto exit_proc

	-- TDDS configuration (register service)
		declare @HostTracking as int
		select @HostTracking=Host.HostTracking
		from 
			adm_Host Host
		where 
			Host.Name = @HostName
			
		if ( @HostTracking <> 0 )
		begin
			declare @SvcId as uniqueidentifier
			select @SvcId=HostInst.UniqueId
			from 
				adm_Host Host,
				adm_Server2HostMapping Mapping,
				adm_HostInstance HostInst,
				adm_Server Svr
			where 
				Host.Name = @HostName and
				Mapping.HostId = Host.Id and
				HostInst.Svr2HostMappingId = Mapping.Id and
				Mapping.ServerId = Svr.Id and
				Svr.Name = @ServerName

			declare @GroupName nvarchar(256)
			set @GroupName = dbo.adm_GetGroupName()

			exec @ErrCode = TDDS_RegisterService @SvcId, @ServerName
			if ( @ErrCode <> 0 ) goto exit_proc
		end

	
exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_Map] TO BTS_ADMIN_USERS
GO


--// Unmap //--
CREATE PROCEDURE [dbo].[adm_Server2HostMapping_Unmap]
@ServerName nvarchar(63),
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction
		
		-- Are there not uninstalled host instances?
		if exists (	select * 
				from 
					adm_Server,
					adm_Server2HostMapping,
					adm_Host,
					adm_HostInstance
					
				where						
					adm_Server.Name = @ServerName AND
					adm_Host.Name = @HostName AND
					adm_Server2HostMapping.HostId = adm_Host.Id AND
					adm_Server2HostMapping.ServerId = adm_Server.Id AND 
					adm_HostInstance.Svr2HostMappingId=adm_Server2HostMapping.Id AND
					adm_HostInstance.ConfigurationState <> 5 --eAPP_INST_CONFIG_NOT_INSTALLED
			)
		begin
			set @ErrCode = 0xC0C02526 -- CIS_E_ADMIN_CORE_SVR_MSG_BOX_UNMAP_HAS_APP_INST
			goto exit_proc
		end


		--TDDS: get service ID before actually deleting host instance
		declare @SvcId as uniqueidentifier
		select @SvcId=HostInst.UniqueId
		from 
			adm_Host Host,
			adm_Server2HostMapping Mapping,
			adm_HostInstance HostInst,
			adm_Server Svr
		where 
			Host.Name = @HostName and
			Mapping.HostId = Host.Id and
			HostInst.Svr2HostMappingId = Mapping.Id and
			Mapping.ServerId = Svr.Id and
			Svr.Name = @ServerName

		--TDDS: get Host Tracking
		declare @HostTracking as int
		select @HostTracking=Host.HostTracking
		from 
			adm_Host Host
		where 
			Host.Name = @HostName


		-- delete adm_HostInstance records
		delete
			adm_HostInstance
		from
			adm_Server,
			adm_Server2HostMapping,
			adm_Host
		where						
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_Server2HostMapping.ServerId = adm_Server.Id AND 
			adm_HostInstance.Svr2HostMappingId=adm_Server2HostMapping.Id

		-- update adm_Server2HostMapping record
		update
			adm_Server2HostMapping
		set
			DateModified = GETUTCDATE(), 
			IsMapped = 0
		from
			adm_Server,
			adm_Host
		where
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_Server2HostMapping.ServerId = adm_Server.Id 

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- TDDS configuration (unregister service if host instance had been deleted succesfully)
		if ( @HostTracking <> 0 )
		begin
			declare @GroupName nvarchar(256)
			set @GroupName = dbo.adm_GetGroupName()

			exec @ErrCode = TDDS_UnregisterService @SvcId
			if ( @ErrCode <> 0 ) goto exit_proc
		end


exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback tran
		return @ErrCode
	end
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_Unmap] TO BTS_ADMIN_USERS
GO


--// ForceUnmap //--
CREATE PROCEDURE [dbo].[adm_Server2HostMapping_ForceUnmap]
@ServerName nvarchar(63),
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction
	
		--TDDS: get service ID before actually deleting host instance
		declare @SvcId as uniqueidentifier
		select @SvcId=HostInst.UniqueId
		from 
			adm_Host Host,
			adm_Server2HostMapping Mapping,
			adm_HostInstance HostInst,
			adm_Server Svr
		where 
			Host.Name = @HostName and
			Mapping.HostId = Host.Id and
			HostInst.Svr2HostMappingId = Mapping.Id and
			Mapping.ServerId = Svr.Id and
			Svr.Name = @ServerName

		--TDDS: get Host Tracking
		declare @HostTracking as int
		select @HostTracking=Host.HostTracking
		from 
			adm_Host Host
		where 
			Host.Name = @HostName


	
		-- Check if already tried to delete host instances?
		if exists (	select * 
		
				from 
					adm_Server,
					adm_Server2HostMapping,
					adm_Host,
					adm_HostInstance
					
				where						
					adm_Server.Name = @ServerName AND
					adm_Host.Name = @HostName AND
					adm_Server2HostMapping.HostId = adm_Host.Id AND
					adm_Server2HostMapping.ServerId = adm_Server.Id AND 
					adm_HostInstance.Svr2HostMappingId=adm_Server2HostMapping.Id AND
					NOT (adm_HostInstance.ConfigurationState = 3 -- eAPP_INST_CONFIG_UNINSTALL_FAIL
						 OR adm_HostInstance.ConfigurationState = 5) -- eAPP_INST_CONFIG_NOT_INSTALLED
			)
		begin
			set @ErrCode = 0xC0C02527 -- CIS_E_ADMIN_CORE_SVR_MSG_BOX_FORCEUNMAP_BEFORE_APP_INST_DELETE
			goto exit_proc
		end

		insert into adm_HostInstanceZombie
			(Name, GroupName, HostName, ServerName, 
			NTGroupName, LoginName, UniqueId)
		select adm_HostInstance.Name, dbo.adm_GetGroupName(), adm_Host.Name, adm_Server.Name, 
			adm_Host.NTGroupName, adm_HostInstance.LoginName, adm_HostInstance.UniqueId
		from
		 	adm_Server,
			adm_Server2HostMapping,
			adm_Host,
			adm_HostInstance
		where
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_Server2HostMapping.ServerId = adm_Server.Id AND 
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_HostInstance.Svr2HostMappingId=adm_Server2HostMapping.Id AND
			adm_HostInstance.ConfigurationState = 3 -- eAPP_INST_CONFIG_UNINSTALL_FAIL

		delete
			adm_HostInstance
		from
		 	adm_Server,
			adm_Server2HostMapping,
			adm_Host
		where
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_Server2HostMapping.ServerId = adm_Server.Id AND 
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_HostInstance.Svr2HostMappingId=adm_Server2HostMapping.Id

		update adm_Server2HostMapping
		set
			DateModified = GETUTCDATE(), 
			IsMapped = 0
		from
			adm_Server,
			adm_Host
		where
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_Server2HostMapping.ServerId = adm_Server.Id 

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- TDDS configuration (unregister service if host instance had been deleted succesfully)
		if ( @HostTracking <> 0 )
		begin
			declare @GroupName nvarchar(256)
			set @GroupName = dbo.adm_GetGroupName()

			exec @ErrCode = TDDS_UnregisterService @SvcId
			if ( @ErrCode <> 0 ) goto exit_proc
		end

		-- If the last host instance was unmapped, clear the ClusterResourceGroupName property of the host to indicate this host is no longer clustered
		if not exists (		select * from
								adm_HostInstance,
		 						adm_Server,
								adm_Server2HostMapping,
								adm_Host
							where
								adm_Host.Name = @HostName AND
								adm_Server2HostMapping.ServerId = adm_Server.Id AND 
								adm_Server2HostMapping.HostId = adm_Host.Id AND
								adm_HostInstance.Svr2HostMappingId=adm_Server2HostMapping.Id
					)
		begin
			update adm_Host
			set
				ClusterResourceGroupName = ''
			where
				adm_Host.Name = @HostName
			set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
			if ( @ErrCode <> 0 ) goto exit_proc
		end

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback tran
		return @ErrCode
	end
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_ForceUnmap] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[adm_Server2HostMapping_PrepareHostInstState]
@ServerName nvarchar(63),
@HostName nvarchar(80),
@NewState int
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction

		UPDATE 	adm_HostInstance
		set	ConfigurationState=@NewState,
			DateModified = GETUTCDATE()
		from
		 	adm_Server,
			adm_Host,
			adm_Server2HostMapping 
		where
			adm_Server.Name = @ServerName AND
			adm_Host.Name = @HostName AND
			adm_HostInstance.Svr2HostMappingId=adm_Server2HostMapping.Id AND
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_Server2HostMapping.ServerId = adm_Server.Id

		-- olny one isntance should be updated
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback tran
		return @ErrCode
	end
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_PrepareHostInstState] TO BTS_ADMIN_USERS
GO


--// Load //--
CREATE PROCEDURE [dbo].[adm_Server2HostMapping_Load]
@ServerName nvarchar(63),
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	-- Resolve Server2MsgBoxMapping.Id
	declare @BIZTALK_UNKNOWN_DBID int
	set @BIZTALK_UNKNOWN_DBID = 0

	declare @Svr2HostMappingId as int
	set @Svr2HostMappingId = @BIZTALK_UNKNOWN_DBID

	select
		@Svr2HostMappingId = adm_Server2HostMapping.Id
	from
		adm_Server2HostMapping,
		adm_Server,
		adm_Host
	where
		adm_Server.Name = @ServerName AND
		adm_Host.Name = @HostName AND
		adm_Server2HostMapping.HostId = adm_Host.Id AND
		adm_Server2HostMapping.ServerId = adm_Server.Id

	-- only one instance should match
	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	-- Resolve ErrorState
	declare @NumMisconfigured int

	select @NumMisconfigured = count(*)
	from adm_HostInstance
	where
		Svr2HostMappingId = @Svr2HostMappingId AND
		NOT (ConfigurationState = 1	--eAPP_INST_CONFIG_INSTALLED_OK	
		OR ConfigurationState =5 ) -- eAPP_INST_CONFIG_NOT_INSTALLED

	--	declare @ErrorState int
	--	if ( @NumMisconfigured > 0 )
	--		set @ErrorState = 1		-- misconfigured state
	--	else
	--		set @ErrorState = 0		-- okay state

	-- Return the adm_Server2HostMapping record
	select
		adm_Server2HostMapping.Id,
		@ServerName,
		@HostName,
		adm_Server2HostMapping.IsMapped,
		adm_Server2HostMapping.DateModified
	--		@ErrorState
	from
		adm_Server2HostMapping
	where
		adm_Server2HostMapping.Id = @Svr2HostMappingId

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_Load] TO BTS_OPERATORS
GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_Server2HostMapping_Enum]
AS
	set nocount on
	set xact_abort on


	select
		adm_Server2HostMapping.Id,
		adm_Server.Name,
		adm_Host.Name,
		adm_Server2HostMapping.IsMapped,
		adm_Server2HostMapping.DateModified
	from
		adm_Server2HostMapping,
		adm_Server,
		adm_Host
	where
		adm_Server2HostMapping.ServerId = adm_Server.Id AND
		adm_Server2HostMapping.HostId = adm_Host.Id

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Server2HostMapping_Enum] TO BTS_OPERATORS
GO

--========== Basic stored procedures for adm_Host table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_Host_Create]
@Name nvarchar(80),
@NTGroupName nvarchar(128),
@LastUsedLogon nvarchar(128),
@DefaultHost int,
@HostTracking int,
@AuthTrusted int,
@HostType int,
@DecryptCertName nvarchar(256),
@DecryptCertThumbprint nvarchar(80),
@ClusterResourceGroupName nvarchar(256),
@IsHost32BitOnly bit,
@MessageDeliverySampleSpaceSize int,
@MessageDeliverySampleSpaceWindow int,
@MessageDeliveryOverdriveFactor int,
@MessageDeliveryMaximumDelay int,
@MessagePublishSampleSpaceSize int,
@MessagePublishSampleSpaceWindow int,
@MessagePublishOverdriveFactor int,
@MessagePublishMaximumDelay int,
@DeliveryQueueSize int,
@DBSessionThreshold int,
@GlobalMemoryThreshold int,
@ProcessMemoryThreshold int,
@ThreadThreshold int,
@DBQueueSizeThreshold int,
@InflightMessageThreshold int,
@ThreadPoolSize int

AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @bHasOpenedTransaction as int
	select @ErrCode = 0, @bHasOpenedTransaction=0

	if(@@trancount = 0) -- this sp could be called from DTC
	begin
		begin transaction
		set @bHasOpenedTransaction=1
	end

		declare @BIZTALK_UNKNOWN_DBID int
		set @BIZTALK_UNKNOWN_DBID = 0

		-- Create new adm_Host record
		insert into adm_Host 
			( GroupId, Name, NTGroupName, LastUsedLogon, HostTracking, AuthTrusted, HostType, DecryptCertName, DecryptCertThumbprint,
				ClusterResourceGroupName,
				IsHost32BitOnly,
				MessageDeliverySampleSpaceSize,
				MessageDeliverySampleSpaceWindow,
				MessageDeliveryOverdriveFactor,
				MessageDeliveryMaximumDelay,
				MessagePublishSampleSpaceSize,
				MessagePublishSampleSpaceWindow,
				MessagePublishOverdriveFactor,
				MessagePublishMaximumDelay,
				DeliveryQueueSize,
				DBSessionThreshold,
				GlobalMemoryThreshold,
				ProcessMemoryThreshold,
				ThreadThreshold,
				DBQueueSizeThreshold,
				InflightMessageThreshold,
				ThreadPoolSize)
		values
			( dbo.adm_GetGroupId(), @Name, @NTGroupName, @LastUsedLogon, @HostTracking, @AuthTrusted, @HostType, @DecryptCertName, @DecryptCertThumbprint,
				@ClusterResourceGroupName,
				@IsHost32BitOnly,
				@MessageDeliverySampleSpaceSize,
				@MessageDeliverySampleSpaceWindow,
				@MessageDeliveryOverdriveFactor,
				@MessageDeliveryMaximumDelay,
				@MessagePublishSampleSpaceSize,
				@MessagePublishSampleSpaceWindow,
				@MessagePublishOverdriveFactor,
				@MessagePublishMaximumDelay,
				@DeliveryQueueSize,
				@DBSessionThreshold,
				@GlobalMemoryThreshold,
				@ProcessMemoryThreshold,
				@ThreadThreshold,
				@DBQueueSizeThreshold,
				@InflightMessageThreshold,
				@ThreadPoolSize
			)

		declare @HostId as int
		set @HostId = @@Identity

		-- If this is Isolated host, make sure it cannot host tracking and cannot be default host
		if ( @HostType = 2 AND (@DefaultHost <> 0 OR @HostTracking <> 0) )
		begin
			set @ErrCode = 0xC0C025C3	-- CIS_E_ADMIN_ISOLATED_HOST_CONFLICT
			goto exit_proc
		end

		-- Is this the first host?
		if not exists ( select * from adm_Host where Id <> @HostId )
		begin
		
			-- First host must be default with In-Process host type and it must host tracking
			if ( 0 = @DefaultHost OR 0 = @HostTracking OR 1 <> @HostType )	-- eHostTypeInProcess
			begin
					set @ErrCode = 0xC0C02559	-- CIS_E_ADMIN_FIRST_APP_TYPE_MUST_BE_DEFAULT
					goto exit_proc
			end
		end
		
		-- Reassign default host when "DefaultHost=true"
		if (0 <> @DefaultHost)
		begin
			update adm_Group set DefaultHostId = @HostId
		end

		-- Create the necessary adm_Server2HostMapping records
		insert into adm_Server2HostMapping
			(ServerId, HostId, IsMapped)
		select
			adm_Server.Id,
			@HostId,
			0		-- by default new Host is never Mapped
		from
			adm_Server

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
		end
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Host_Create] TO BTS_ADMIN_USERS
GO

--// Update //--
CREATE PROCEDURE [dbo].[adm_Host_Update]
@Name nvarchar(80),
@NTGroupName nvarchar(128), -- this property is not updatable.
@LastUsedLogon nvarchar(128),
@DefaultHost int,
@HostTracking int,
@AuthTrusted int,
@HostType int,	-- this property is readonly post-creation, so it is ignored
@DecryptCertName nvarchar(256),
@DecryptCertThumbprint nvarchar(80),
@ClusterResourceGroupName nvarchar(256),
@IsHost32BitOnly bit,
@MessageDeliverySampleSpaceSize int,
@MessageDeliverySampleSpaceWindow int,
@MessageDeliveryOverdriveFactor int,
@MessageDeliveryMaximumDelay int,
@MessagePublishSampleSpaceSize int,
@MessagePublishSampleSpaceWindow int,
@MessagePublishOverdriveFactor int,
@MessagePublishMaximumDelay int,
@DeliveryQueueSize int,
@DBSessionThreshold int,
@GlobalMemoryThreshold int,
@ProcessMemoryThreshold int,
@ThreadThreshold int,
@DBQueueSizeThreshold int,
@InflightMessageThreshold int,
@ThreadPoolSize int

AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @HostId as int, @OrigHostType as int, @bHasOpenedTransaction as int
	select @ErrCode = 0, @HostId = 0, @OrigHostType = 0, @bHasOpenedTransaction = 0
	
	if(@@trancount = 0) -- this sp could be called from DTC
	begin
		begin transaction
		set @bHasOpenedTransaction=1
	end

		-- Resolve foreign key: GroupId, HostId
		select @HostId = Id, @OrigHostType = HostType
		from adm_Host
		where Name = @Name
		
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		--prefetch old HostTracking Value before updating table with the new one (for TDDS)
		declare @UsedToHostTracking as int
		select @UsedToHostTracking = HostTracking from adm_Host where Id = @HostId

		-- verify that "NTGroupName" property is not changed if there is already at least one host instance installed
		if exists (	select * from adm_Host
					where Id = @HostId  AND NTGroupName <> @NTGroupName)
		begin
			declare @NumHostInstances as int
			select @NumHostInstances = count(*)
			from adm_Server2HostMapping mapping, adm_HostInstance inst
			where
				@HostId = mapping.HostId
				AND mapping.Id = inst.Svr2HostMappingId

			if ( @NumHostInstances > 0 )
			begin
				set @ErrCode = 0xC0C02556	-- CIS_E_ADMIN_CORE_NT_GRP_NAME_CANNOT_CHANGE
				goto exit_proc
			end
		end

		-- Ensure that "DefaultHost" property cannot switch off, only swich on.
		if exists (	select * from adm_Group
					where DefaultHostId = @HostId AND 0 = @DefaultHost)
		begin
			set @ErrCode = 0xC0C02555	-- CIS_E_ADMIN_CORE_DEF_APP_CANNOT_CHANGE
			goto exit_proc
		end
		
		-- Is this LoginName being used by other Host with a DIFFERENT AuthTrusted setting?
		-- If so, then this violates our single trusted domain constraint and we need to
		-- throw an error.
		select distinct HostInst.LoginName
		into #LoginNamesToCheck
		from 
			adm_Server2HostMapping Mapping,
			adm_HostInstance HostInst
		where
			@HostId = Mapping.HostId
			AND Mapping.Id = HostInst.Svr2HostMappingId

		if exists (
			select *
			from
				adm_Host Host,
				adm_Server2HostMapping Mapping,
				adm_HostInstance HostInst
			where
				Host.Id <> @HostId
				AND Host.AuthTrusted <> @AuthTrusted
				AND Host.Id = Mapping.HostId
				AND Mapping.Id = HostInst.Svr2HostMappingId
				AND HostInst.LoginName in (select * from #LoginNamesToCheck)
		)
		begin
			set @ErrCode = 0xC0C025BE	-- CIS_E_ADMIN_AUTH_TRUSTED_LOGIN_CONFLICT
			goto exit_proc
		end
		

		-- Ensure that "HostType" property cannot be changed (TO DO: need to add new "WriteOnCreate" constraint into WMI framework)
		--if ( @HostType <> @OrigHostType )
		--begin
		--	set @ErrCode = 0xC0C025C4	-- CIS_E_ADMIN_CORE_HOST_TYPE_CANNOT_CHANGE
		--	goto exit_proc
		--end
		
		-- If this is Isolated host, make sure it cannot host tracking and cannot be default host
		if ( @OrigHostType = 2 AND (@DefaultHost <> 0 OR @HostTracking <> 0) )
		begin
			set @ErrCode = 0xC0C025C3	-- CIS_E_ADMIN_ISOLATED_HOST_CONFLICT
			goto exit_proc
		end

		-- Update adm_Host record
		update adm_Host
		set
			DateModified = GETUTCDATE(), 
			LastUsedLogon = @LastUsedLogon,
			HostTracking = @HostTracking,
			AuthTrusted = @AuthTrusted,
			DecryptCertName = @DecryptCertName,
			DecryptCertThumbprint = @DecryptCertThumbprint,
			NTGroupName = @NTGroupName,
			ClusterResourceGroupName = @ClusterResourceGroupName,
			IsHost32BitOnly = @IsHost32BitOnly,					
			MessageDeliverySampleSpaceSize = @MessageDeliverySampleSpaceSize,
			MessageDeliverySampleSpaceWindow = @MessageDeliverySampleSpaceWindow,
			MessageDeliveryOverdriveFactor = @MessageDeliveryOverdriveFactor,
			MessageDeliveryMaximumDelay = @MessageDeliveryMaximumDelay,
			MessagePublishSampleSpaceSize = @MessagePublishSampleSpaceSize,
			MessagePublishSampleSpaceWindow = @MessagePublishSampleSpaceWindow,
			MessagePublishOverdriveFactor = @MessagePublishOverdriveFactor,
			MessagePublishMaximumDelay = @MessagePublishMaximumDelay,
			DeliveryQueueSize = @DeliveryQueueSize,
			DBSessionThreshold = @DBSessionThreshold,
			GlobalMemoryThreshold = @GlobalMemoryThreshold,
			ProcessMemoryThreshold = @ProcessMemoryThreshold,
			ThreadThreshold = @ThreadThreshold,
			DBQueueSizeThreshold = @DBQueueSizeThreshold,
			InflightMessageThreshold = @InflightMessageThreshold,
			ThreadPoolSize = @ThreadPoolSize
		where
			Id = @HostId

		-- Reassign default host when "DefaultHost=true"
		if (0 <> @DefaultHost)
		begin
			update adm_Group set DefaultHostId = @HostId
		end

		-- at least one host in the group must host tracking 
		if not exists (select * from adm_Host where 0 <> HostTracking )
		begin
			set @ErrCode = 0xC0C0255B	-- CIS_E_ADMIN_NO_APP_HOST_TRACKING
			goto exit_proc
		end

		--TDDS Configuration

			--check if host tracking flag is being changed in this call:
		if (@UsedToHostTracking <> @HostTracking)
		begin
			exec @ErrCode = adm_Host_Register_TDDS_Services @Name, @HostTracking
			if ( @ErrCode <> 0 ) goto exit_proc
		end
		
exit_proc:

	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
			rollback transaction
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Host_Update] TO BTS_ADMIN_USERS
GO




--// Load //--
CREATE PROCEDURE [dbo].[adm_Host_Load]
@Name nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	-- Load rest of properties of the host
	select 
		adm_Host.Id, 
		adm_Host.Name, 
		adm_Host.NTGroupName, 
		adm_Host.LastUsedLogon,
		case (select count(*) from adm_Group where DefaultHostId = adm_Host.Id)
			when 0 then 0 else -1 end as DefaultHost,
		adm_Host.HostTracking,
		adm_Host.AuthTrusted,
		adm_Host.HostType,
		adm_Host.DateModified,
		adm_Host.DecryptCertName,
		adm_Host.DecryptCertThumbprint,
		dbo.adm_GetNumInstalledHostInstances(adm_Host.Name),
		adm_Host.ClusterResourceGroupName,
		adm_Host.IsHost32BitOnly,
		adm_Host.MessageDeliverySampleSpaceSize,
		adm_Host.MessageDeliverySampleSpaceWindow,
		adm_Host.MessageDeliveryOverdriveFactor,
		adm_Host.MessageDeliveryMaximumDelay,
		adm_Host.MessagePublishSampleSpaceSize,
		adm_Host.MessagePublishSampleSpaceWindow,
		adm_Host.MessagePublishOverdriveFactor,
		adm_Host.MessagePublishMaximumDelay,
		adm_Host.DeliveryQueueSize,
		adm_Host.DBSessionThreshold,
		adm_Host.GlobalMemoryThreshold,
		adm_Host.ProcessMemoryThreshold,
		adm_Host.ThreadThreshold,
		adm_Host.DBQueueSizeThreshold,
		adm_Host.InflightMessageThreshold,
		adm_Host.ThreadPoolSize
	from
		adm_Host
	where
		adm_Host.Name = @Name

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Host_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Host_Load] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[adm_Host_Verify_Before_Delete]
@Name nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	declare @HostId as int
	set @HostId = 0

	-- Resolve foreign key: GroupId, HostId
	select @HostId = Id from adm_Host where Name = @Name

	-- Check that this is not a last host in the group.
	if 1 = (select count(*) from adm_Host)
	begin
		set @ErrCode = 0xC0C0255D	-- CIS_E_ADMIN_CANNOT_DELETE_LAST_APP
		goto exit_proc
	end

	-- Check that this is not a "DefaultHost".
	if exists (	select * from adm_Group where DefaultHostId = @HostId)
	begin
		set @ErrCode = 0xC0C0255C	-- CIS_E_ADMIN_CANNOT_DELETE_DEFAULT_APP
		goto exit_proc
	end

	-- at least one host in the group must host tracking 
	if not exists (select * from adm_Host
					 where 	Id <> @HostId AND 0 <> HostTracking)
	begin
		set @ErrCode = 0xC0C0255B	-- CIS_E_ADMIN_NO_APP_HOST_TRACKING
		goto exit_proc
	end
	
	-- Check if we have orchestration enlisted to this host
	if exists (select *
				from bts_orchestration
				where nAdminHostID = @HostId)
	begin
		return 0xC0C0251F	-- CIS_E_ADMIN_CORE_APP_TYPE_DELETE_HAS_MODULES
		goto exit_proc
	end	

	-- Check if we have ReceiveHandlers associated to this host
	if exists (select *
				from adm_ReceiveHandler
				where HostId = @HostId)
	begin
		return 0xC0C025A9	-- CIS_E_ADMIN_CORE_RH_FOREIGN_KEY
		goto exit_proc
	end	

	-- Check if we have SendHandlers associated to this host
	if exists (select *
				from adm_SendHandler
				where HostId = @HostId)
	begin
		return 0xC0C025AA	-- CIS_E_ADMIN_CORE_TH_FOREIGN_KEY
		goto exit_proc
	end	

exit_proc:
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Host_Verify_Before_Delete] TO BTS_ADMIN_USERS
GO

--// Prepare HostInst state //--
CREATE PROCEDURE [dbo].[adm_Host_PrepareHostInstState]
@Name nvarchar(80),
@NewState int -- extected to be 3 (eAPP_INST_CONFIG_UNINSTALL_FAIL)
AS
	set nocount on
	set xact_abort on
	
	declare @ErrCode as int, @LastError as int
	SELECT @ErrCode = 0, @LastError = 0

	begin transaction

		-- Trying to delete host? Nothing else is expected here.
		if(3 <> @NewState) -- eAPP_INST_CONFIG_UNINSTALL_FAIL
		begin
			set @ErrCode=0xC0C02402	-- CIS_E_INTERNAL_FAILURE
			goto exit_proc
		end
		
		-- Check if this host can be deleted
		exec @ErrCode = adm_Host_Verify_Before_Delete @Name
		select @LastError=@@error
		if(@LastError <> 0 AND @ErrCode =0 )
			set @ErrCode=@LastError
		
		if(@ErrCode <> 0)
			goto exit_proc
		
		-- Change HostInst configuration state
		-- Rule 1: when HostInst is not installed, don't change it's state to eAPP_INST_CONFIG_UNINSTALL_FAIL
		update
			HostInst
		set
			ConfigurationState=@NewState,
			DateModified = GETUTCDATE()
		from
			adm_HostInstance as HostInst
			join adm_Server2HostMapping as hostMap on hostMap.Id=HostInst.Svr2HostMappingId
			join adm_Host as Host on Host.Name = @Name
				AND Host.Id=hostMap.HostId
				AND (HostInst.ConfigurationState <> 5 --eAPP_INST_CONFIG_NOT_INSTALLED
					 OR 3 <> @NewState) -- eAPP_INST_CONFIG_UNINSTALL_FAIL

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Host_PrepareHostInstState] TO BTS_ADMIN_USERS
GO

--// Delete //--
CREATE PROCEDURE [dbo].[adm_Host_Delete]
@Name nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @bHasOpenedTransaction as int, @ErrCode as int, @LastError as int, @HostId as int
	select @ErrCode = 0, @LastError=0, @HostId=0
	
	if(@@trancount = 0)
	begin
		begin transaction
		set @bHasOpenedTransaction=1
	end
	else
	begin
		set @bHasOpenedTransaction=0
	end
		-- Resolve foreign key: GroupId, HostId
		select @HostId = Id from adm_Host where Name = @Name

		-- Check if this host can be deleted
		exec @ErrCode = adm_Host_Verify_Before_Delete @Name
		select @LastError=@@error
		if(@LastError <> 0 AND @ErrCode =0 )
			set @ErrCode=@LastError
		
		if(@ErrCode <> 0)
			goto exit_proc

		-- Are there not uninstalled host instances?
		if exists (select *
					from adm_HostInstance HostInst,
						adm_Host Host,
					 	adm_Server2HostMapping hostMap
					where
						Host.Name = @Name AND
						hostMap.HostId = Host.Id AND
						hostMap.Id = HostInst.Svr2HostMappingId AND
						HostInst.ConfigurationState <> 5  -- eAPP_INST_CONFIG_NOT_INSTALLED
					)
		begin
			set @ErrCode = 0xC0C0251A -- CIS_E_ADMIN_CORE_APP_TYPE_DELETE_HAS_APP_INST
			goto exit_proc
		end

		-- Delete related adm_HostInstance records
		delete
			adm_HostInstance
		from 
			adm_Host,
			adm_Server2HostMapping
		where 
			adm_Host.Name = @Name AND
			adm_Server2HostMapping.HostId = adm_Host.Id AND
			adm_HostInstance.Svr2HostMappingId = adm_Server2HostMapping.Id

		-- Delete related adm_Server2HostMapping records
		delete 
			adm_Server2HostMapping
		from
			adm_Host
		where
			adm_Host.Name = @Name AND
			adm_Server2HostMapping.HostId = adm_Host.Id
		
		-- Delete related adm_Host records
		delete 
			adm_Host
		where
			adm_Host.Name = @Name

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0 AND 0 <> @bHasOpenedTransaction)
		commit transaction
	else if (@ErrCode <> 0)
	begin
		if(1 = @bHasOpenedTransaction)
			rollback tran
		return @ErrCode
	end
GO
GRANT EXEC ON [dbo].[adm_Host_Delete] TO BTS_ADMIN_USERS
GO


-- Removing Host ForceDelete functionality (EBiz Suite bug 6584)
--
-- CREATE PROCEDURE [dbo].[adm_Host_ForceDelete]
-- @Name nvarchar(80)
-- AS
-- 	set nocount on
-- 	set xact_abort on
-- 
-- 	declare @ErrCode as int, @LastError as int
-- 	select @ErrCode = 0, @LastError=0
-- 
-- 	begin transaction
--		
--		-- Check if this host can be deleted
--		exec @ErrCode = adm_Host_Verify_Before_Delete @Name
--		select @LastError=@@error
--		if(@LastError <> 0 AND @ErrCode =0 )
--			set @ErrCode=@LastError
--		
--		if(@ErrCode <> 0)
--			goto exit_proc
--
--		-- Check if already tried to delete host instances?
--		if exists (select *
--					from adm_HostInstance HostInst,
--						adm_Host Host,
--						adm_Server2HostMapping hostMap
--					where
--						Host.Name=@Name AND
--						hostMap.HostId = Host.Id AND
--						hostMap.Id = HostInst.Svr2HostMappingId AND
--						NOT (HostInst.ConfigurationState = 3 -- eAPP_INST_CONFIG_UNINSTALL_FAIL
--						 OR HostInst.ConfigurationState = 5) -- eAPP_INST_CONFIG_NOT_INSTALLED
--					)
--		begin
--			set @ErrCode = 0xC0C01C20	-- CIS_E_ADMIN_CORE_APP_INST_DELETE_ZOMBIE_BEFORE_Host_DELETE
--			goto exit_proc
--		end
--
--
--		insert into adm_HostInstanceZombie
--			(Name, GroupName, HostName, ServerName, 
--			NTGroupName, LoginName, UniqueId)
--		select HostInst.Name, dbo.adm_GetGroupName(), Host.Name, svr.Name,
--			Host.NTGroupName, HostInst.LoginName, HostInst.UniqueId
--		from adm_HostInstance HostInst
--		join adm_Server2HostMapping svrMap on svrMap.Id = HostInst.Svr2HostMappingId
--		join adm_Server svr on svrMap.ServerId = svr.Id	
--		join adm_Host Host on Host.Id = svrMap.HostId
--			 AND HostInst.ConfigurationState = 3 -- eAPP_INST_CONFIG_UNINSTALL_FAIL
--		
--		update adm_HostInstance
--		set
--			DateModified = GETUTCDATE(), 
--			ConfigurationState = 5  --eAPP_INST_CONFIG_NOT_INSTALLED
--		from
--			adm_Host Host,
--			adm_Server2HostMapping hostMap
--		where
--			Host.Name=@Name AND
--			hostMap.HostId = Host.Id AND
--			hostMap.Id = adm_HostInstance.Svr2HostMappingId AND
--			adm_HostInstance.ConfigurationState <> 5 -- eAPP_INST_CONFIG_NOT_INSTALLED
--
--		--TDDS configuration, unregister all services
--		declare @HostTracking as int
--			--see if the Host is hosting any tracking at all
--		select @HostTracking=Host.HostTracking
--		from 
--			adm_Host Host
--		where 
--			Host.Name = @Name
--			
--		if ( @HostTracking <> 0 )
--		begin
--			exec @ErrCode = adm_Host_Register_TDDS_Services @Name, 0 -- 0 means unregister them all
--			if ( @ErrCode <> 0 ) goto exit_proc
--		end
--
--		-- delete Host now
--		exec @ErrCode = adm_Host_Delete @Name
--		if(@@error <> 0 OR @ErrCode <> 0 )
--		begin
--			goto exit_proc
--		end
--		
--
--		
--exit_proc:
--	if(@ErrCode = 0)
--		commit transaction
--	else
--	begin
--		rollback transaction
--		return @ErrCode
--	end
--
--	set nocount off
--GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_Host_Enum]
AS
	set nocount on
	set xact_abort on

	select
		adm_Host.Id, 
		adm_Host.Name, 
		adm_Host.NTGroupName, 
		adm_Host.LastUsedLogon,
		case (select count(*) from adm_Group where DefaultHostId = adm_Host.Id)
			when 0 then 0 else -1 end as DefaultHost,
		adm_Host.HostTracking,
		adm_Host.AuthTrusted,
		adm_Host.HostType,
		adm_Host.DateModified,
		adm_Host.DecryptCertName,
		adm_Host.DecryptCertThumbprint,
		dbo.adm_GetNumInstalledHostInstances(adm_Host.Name),
		adm_Host.ClusterResourceGroupName,
		adm_Host.IsHost32BitOnly,
		adm_Host.MessageDeliverySampleSpaceSize,
		adm_Host.MessageDeliverySampleSpaceWindow,
		adm_Host.MessageDeliveryOverdriveFactor,
		adm_Host.MessageDeliveryMaximumDelay,
		adm_Host.MessagePublishSampleSpaceSize,
		adm_Host.MessagePublishSampleSpaceWindow,
		adm_Host.MessagePublishOverdriveFactor,
		adm_Host.MessagePublishMaximumDelay,
		adm_Host.DeliveryQueueSize,
		adm_Host.DBSessionThreshold,
		adm_Host.GlobalMemoryThreshold,
		adm_Host.ProcessMemoryThreshold,
		adm_Host.ThreadThreshold,
		adm_Host.DBQueueSizeThreshold,
		adm_Host.InflightMessageThreshold,
		adm_Host.ThreadPoolSize
	from
		adm_Host
	order by
		adm_Host.Name ASC

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Host_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Host_Enum] TO BTS_OPERATORS
GO

--// Prepare Update/Delete //--
CREATE PROCEDURE [dbo].[adm_Host_PrepareUpdateDelete]
@Name nvarchar(80),
@AuthTrusted int,
@HostTracking int
AS
	set nocount on
	set xact_abort on
	
	declare @ErrCode as int
	set @ErrCode = 0

	-- Check if AuthTrusted and HostTracking setting have changed or not
	declare @ExistAuthTrusted as int, @ExistHostTracking as int, @AuthTrustedChanged as int, @HostTrackingChanged as int
	select @ExistAuthTrusted = 0, @ExistHostTracking = 0, @AuthTrustedChanged = 0, @HostTrackingChanged = 0
	
	declare @ExistHostNTGroup as nvarchar(128)
	select @ExistHostNTGroup = N''
	
	declare @HostId as int
	
	select
		@ExistAuthTrusted = AuthTrusted,
		@ExistHostTracking = HostTracking,
		@ExistHostNTGroup = NTGroupName,
		@HostId = Id
	from
		adm_Host
	where
		Name = @Name
	
	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	if ( @ExistAuthTrusted <> @AuthTrusted )
		set @AuthTrustedChanged = -1

	if ( @ExistHostTracking <> @HostTracking )
		set @HostTrackingChanged = -1

	-- Check if this is Host.NTGroupName is still being used by any other Host(s) for host tracking
	declare @LastNTGroupToHostTracking as int
	set @LastNTGroupToHostTracking = 1
		
	if exists (
		select * from adm_Host
		where
			Name <> @Name
			AND NTGroupName = @ExistHostNTGroup
			AND HostTracking <> 0
	)
	begin
		set @LastNTGroupToHostTracking = 0
	end

	declare @NumInstalledHostInst as int
	select @NumInstalledHostInst = count(*)
	from adm_Host host, adm_Server2HostMapping mapping, adm_HostInstance inst
	where
		@HostId = mapping.HostId
		AND mapping.Id = inst.Svr2HostMappingId
		AND inst.ConfigurationState = 1	-- eAPP_INST_CONFIG_INSTALLED_OK
		
	-- Return the results via recordset
	select @AuthTrustedChanged, @HostTrackingChanged, @LastNTGroupToHostTracking, @NumInstalledHostInst

	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Host_PrepareUpdateDelete] TO BTS_ADMIN_USERS
GO


--========== Basic stored procedures for adm_HostInstance table ==========--
--// Update //--
CREATE PROCEDURE [dbo].[adm_HostInstance_Update]
@Name nvarchar(256),
@DisableHostInstance int,
@LoginName nvarchar(128),
@InstallationContext nvarchar(256),
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction
		-- sometimes this store proc is called without logon (e.g. during uninstall)
		if(@InstallationContext='' OR @InstallationContext=NULL)
		begin
			select @InstallationContext=InstallationContext
			from adm_HostInstance
			where adm_HostInstance.Name = @Name

			set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
			if ( @ErrCode <> 0 ) goto exit_proc
		end
			
		update adm_HostInstance
		set
			DisableHostInstance = @DisableHostInstance,
			DateModified = GETUTCDATE(),
			LoginName = @LoginName,
			InstallationContext = @InstallationContext,
			nvcDescription = @Description
		where
			Name = @Name

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		update adm_Host
		set
			DateModified = GETUTCDATE(), 
			LastUsedLogon = @LoginName
		from
			adm_HostInstance,
			adm_Server2HostMapping
		where
			adm_HostInstance.Name = @Name
			AND adm_Server2HostMapping.Id = adm_HostInstance.Svr2HostMappingId
			AND adm_Host.Id = adm_Server2HostMapping.HostId
			
exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_HostInstance_Update] TO BTS_ADMIN_USERS
GO
--// Load //--
CREATE PROCEDURE [dbo].[adm_HostInstance_Load]
@Name nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		adm_HostInstance.Id, 
		adm_HostInstance.Name, 
		adm_HostInstance.DateModified, 
		adm_Host.NTGroupName,
		adm_Host.Name,
		adm_Host.HostType,
		adm_HostInstance.UniqueId,
		adm_Server.Name,
		adm_HostInstance.DisableHostInstance,
		adm_HostInstance.ConfigurationState,
		adm_HostInstance.LoginName,
		adm_HostInstance.InstallationContext,
		adm_Host.HostTracking,
		case
			when (adm_Host.ClusterResourceGroupName IS NOT NULL AND adm_Host.ClusterResourceGroupName <> '') then 1 
			else 0 
		end as ClusterInstanceType,
		adm_HostInstance.nvcDescription
	from
		adm_HostInstance,
		adm_Host,
		adm_Server2HostMapping,
		adm_Server
	where
		adm_HostInstance.Name = @Name
		AND adm_Server2HostMapping.Id = adm_HostInstance.Svr2HostMappingId
		AND adm_Host.Id = adm_Server2HostMapping.HostId
		AND adm_Server.Id = adm_Server2HostMapping.ServerId

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) return @ErrCode

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_HostInstance_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_HostInstance_Load] TO BTS_OPERATORS
GO
--// Prepare HostInst state //--
CREATE PROCEDURE [dbo].[adm_HostInstance_PrepareHostInstState]
@Name nvarchar(256),
@NewState int,
@LoginName nvarchar(128)
AS
	set nocount on
	set xact_abort on
	
	declare @ErrCode as int
	set @ErrCode = 0
	
	begin transaction

		-- sometimes this store proc is called without logon (e.g. during uninstall)
		if(@LoginName='')
		begin
			select @LoginName=LoginName
			from adm_HostInstance
			where adm_HostInstance.Name = @Name

			set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
			if ( @ErrCode <> 0 ) goto exit_proc
		end
			
		-- Is this LoginName being used by other Host with a DIFFERENT AuthTrusted setting?
		-- If so, then this violates our single trusted domain constraint and we need to
		-- throw an error.

		-- Skip checks for uninstallation
		IF ( @NewState <> 3 AND	-- eAPP_INST_CONFIG_UNINSTALL_FAIL
			 @NewState <> 5 )	-- eAPP_INST_CONFIG_NOT_INSTALLED
		BEGIN
			DECLARE @AuthTrustedConfig as int
			
			SELECT
				@AuthTrustedConfig = Host.AuthTrusted
			FROM 
				adm_HostInstance as HostInst,
				adm_Server2HostMapping Mapping,
				adm_Host Host
			WHERE
				HostInst.Name = @Name
				AND HostInst.Svr2HostMappingId = Mapping.Id
				AND Mapping.HostId = Host.Id

			IF EXISTS (
				SELECT *
				FROM
					adm_Server2HostMapping Mapping,
					adm_HostInstance HostInst,
					adm_Host Host
				WHERE
					HostInst.Svr2HostMappingId = Mapping.Id
					AND Mapping.HostId = Host.Id
					AND HostInst.ConfigurationState = 1  -- only care about correctly installed HostInstance
					AND HostInst.LoginName = @LoginName
					AND HostInst.Name <> @Name
					AND Host.AuthTrusted <> @AuthTrustedConfig
			)
			BEGIN
				set @ErrCode = 0xC0C025BE	-- CIS_E_ADMIN_AUTH_TRUSTED_LOGIN_CONFLICT
				goto exit_proc
			END
		END

		-- Update adm_HostInstance table
		update HostInst
		set	ConfigurationState=@NewState,
			DateModified = GETUTCDATE(),
			LoginName = @LoginName
		from 	adm_HostInstance as HostInst
		where	HostInst.Name = @Name

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_HostInstance_PrepareHostInstState] TO BTS_ADMIN_USERS
GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_HostInstance_Enum]
AS
	set nocount on
	set xact_abort on

	(select
		adm_HostInstance.Id, 
		adm_HostInstance.Name, 
		adm_HostInstance.DateModified, 
		adm_Host.NTGroupName,
		adm_Host.Name,
		adm_Host.HostType,
		adm_HostInstance.UniqueId,
		adm_Server.Name,
		adm_HostInstance.DisableHostInstance,
		adm_HostInstance.ConfigurationState,
		adm_HostInstance.LoginName,
		adm_HostInstance.InstallationContext,
		adm_Host.HostTracking,
		case
			when (adm_Host.ClusterResourceGroupName IS NOT NULL AND adm_Host.ClusterResourceGroupName <> '') then 1 
			else 0 
		end as ClusterInstanceType,
		adm_HostInstance.nvcDescription
	from
		adm_HostInstance,
		adm_Host,
		adm_Server2HostMapping,
		adm_Server
	where
		adm_Server2HostMapping.Id = adm_HostInstance.Svr2HostMappingId
		AND adm_Host.Id = adm_Server2HostMapping.HostId
		AND adm_Server.Id = adm_Server2HostMapping.ServerId)
union
	-- This Union adds an additional row to represent all Host Instances belonging to a Clustered Host.
	-- When the Host Instances are clustered (running in an MSCS cluster environment), the UI needs to 
	-- show one instance instead of all the clustered instances.
	-- To do this the UI can query for ClusterInstanceType=2
	--
	-- Note: Valid values for adm_HostInstance.ClusterInstanceType are
	--            0 - Unclustered Host Instance
	--            1 - Clustered Host Instance
	--            2 - Clustered Host Instance that is active, this is determined by WMI
	--            3 - Virtual representation of a set of clustered Host Instances
	(select 
		adm_HostInstance.Id, 
		adm_HostInstance.Name, 
		adm_HostInstance.DateModified, 
		adm_Host.NTGroupName,
		adm_Host.Name,
		adm_Host.HostType,
		adm_HostInstance.UniqueId,
		adm_Server.Name,
		adm_HostInstance.DisableHostInstance,
		adm_HostInstance.ConfigurationState,
		'', -- blank out LoginName,
		'', -- blank out InstallationContext,
		adm_Host.HostTracking,
		3, -- to represent a virtual instance
		''
	from
		adm_HostInstance,
		adm_Host,
		adm_Server2HostMapping,
		adm_Server
	where
		adm_Host.ClusterResourceGroupName IS NOT NULL
		AND adm_Host.ClusterResourceGroupName <> ''
		AND adm_Server2HostMapping.Id = adm_HostInstance.Svr2HostMappingId
		AND adm_Host.Id = adm_Server2HostMapping.HostId
		AND adm_Server.Id = adm_Server2HostMapping.ServerId
		AND adm_HostInstance.Id = 
					(
						select top 1 
							ahi2.Id 
						from
							adm_HostInstance ahi2, 
							adm_Host ah2, 
							adm_Server2HostMapping ashm2, 
							adm_Server as2
						where
							ashm2.Id = ahi2.Svr2HostMappingId
							AND ah2.Id = ashm2.HostId
							AND as2.Id = ashm2.ServerId
							AND adm_Host.Name = ah2.Name
					)
	)

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_HostInstance_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_HostInstance_Enum] TO BTS_OPERATORS
GO
--========== Basic stored procedures for adm_Adapter table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_Adapter_Create]
@Name nvarchar(256),
@Capabilities int,
@Comment nvarchar(256),
@MgmtCLSID nvarchar(256),
@InboundEngineCLSID nvarchar(256),
@InboundAssemblyPath nvarchar(256),
@InboundTypeName nvarchar(256),
@OutboundEngineCLSID nvarchar(256),
@OutboundAssemblyPath nvarchar(256),
@OutboundTypeName nvarchar(256),
@PropertyNameSpace nvarchar(256),
@AliasesXML nvarchar(2048),
@DefaultRHCfg ntext,
@DefaultTHCfg ntext
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	declare @bHasOpenedTransaction as int
	set @bHasOpenedTransaction = 0

	if(@@trancount = 0) -- this sp could be called from DTC
	begin
		begin transaction
		set @bHasOpenedTransaction = 1
	end
	
		if (N'' = @InboundEngineCLSID)
			set @InboundEngineCLSID = NULL
			
		if (N'' = @OutboundEngineCLSID)
			set @OutboundEngineCLSID = NULL

		-- If not NULL, InboundEngineCLSID must be unique
		if exists (
			select * from adm_Adapter
			where InboundEngineCLSID = @InboundEngineCLSID
		)
		begin
			set @ErrCode = 0xC0C025EB -- CIS_E_ADMIN_INBOUND_ENGINE_CLSID_CONFLICT
			goto exit_proc
		end

		-- If not NULL, OutboundEngineCLSID must be unique
		if exists (
			select * from adm_Adapter
			where OutboundEngineCLSID = @OutboundEngineCLSID
		)
		begin
			set @ErrCode = 0xC0C025EC -- CIS_E_ADMIN_OUTBOUND_ENGINE_CLSID_CONFLICT
			goto exit_proc
		end

		insert into adm_Adapter
		(
			Name,
			Capabilities,
			Comment,
			MgmtCLSID,
			InboundEngineCLSID,
			InboundAssemblyPath,
			InboundTypeName,
			OutboundEngineCLSID,
			OutboundAssemblyPath,
			OutboundTypeName,
			PropertyNameSpace,
			DefaultRHCfg,
			DefaultTHCfg
		)
		values
		(
			@Name,
			@Capabilities,
			@Comment,
			@MgmtCLSID,
			@InboundEngineCLSID,
			@InboundAssemblyPath,
			@InboundTypeName,
			@OutboundEngineCLSID,
			@OutboundAssemblyPath,
			@OutboundTypeName,
			@PropertyNameSpace,
			@DefaultRHCfg,
			@DefaultTHCfg
		)
		
		declare @AdapterId as int
		set @AdapterId = @@Identity

		-- create aliases for the adapter		
		-- @AliasesXML is something like: '<ROOT><AdapterAlias alias="HTTP://"/>=<AdapterAlias alias="HTTPS://"/></ROOT>'
		-- or <AdapterAliasList><AdapterAlias>HTTP://</AdapterAlias><AdapterAlias>HTTPS://</AdapterAlias></AdapterAliasList>
		
		DECLARE @hDoc int
		EXEC sp_xml_preparedocument @hDoc OUTPUT, @AliasesXML 

		declare curse cursor for
		SELECT [text]
		FROM OPENXML(@hDoc, N'/') WHERE [text] is not null

		OPEN curse
		declare @value	nvarchar(1024)

		FETCH NEXT FROM curse INTO @value
		WHILE (@@FETCH_STATUS = 0 AND @ErrCode = 0)
		BEGIN
			-- check if alias is already present
			if exists (
				select * from adm_AdapterAlias
				where AliasValue = @value
			)
			begin
				set @ErrCode = 0xC0C02814 -- CIS_E_ADMIN_CANNOT_ADD_PROTOCOL_BECAUSE_DUPLICATE_ALIASVALUE
				goto exit_proc
			end

			insert into adm_AdapterAlias
				(AdapterId, AliasValue) values (@AdapterId, @value)
			set @ErrCode = @@ERROR

			FETCH NEXT FROM curse INTO @value
		END
			
		CLOSE curse
		DEALLOCATE curse

		EXEC sp_xml_removedocument @hDoc
		if ( @ErrCode <> 0 ) goto exit_proc

	
exit_proc:

	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
		end
	end

	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Adapter_Create] TO BTS_ADMIN_USERS
GO


--// Update //--
CREATE PROCEDURE [dbo].[adm_Adapter_Update]
@Name nvarchar(256),					-- ignored during update. This property is not updatable
@Capabilities int,						-- ignored during update. This property is not updatable
@Comment nvarchar(256),
@MgmtCLSID nvarchar(256),				-- ignored during update. This property is not updatable
@InboundEngineCLSID nvarchar(256),		-- ignored during update. This property is not updatable
@InboundAssemblyPath nvarchar(256),		-- ignored during update. This property is not updatable
@InboundTypeName nvarchar(256),			-- ignored during update. This property is not updatable
@OutboundEngineCLSID nvarchar(256),		-- ignored during update. This property is not updatable
@OutboundAssemblyPath nvarchar(256),	-- ignored during update. This property is not updatable
@OutboundTypeName nvarchar(256),		-- ignored during update. This property is not updatable
@PropertyNameSpace nvarchar(256),
@AliasesXML nvarchar(2048),				-- ignored during update. This property is not updatable
@DefaultRHCfg ntext,					-- ignored during update. This property is not updatable
@DefaultTHCfg ntext						-- ignored during update. This property is not updatable
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction

		update adm_Adapter
		set
			Comment=@Comment,
			DateModified = GETUTCDATE()
		where
			Name = @Name

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Adapter_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_Adapter_Load]
@Name nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		Id,
		Name,
		Capabilities,
		Comment,
		MgmtCLSID,
		InboundEngineCLSID,
		InboundAssemblyPath,
		InboundTypeName,
		OutboundEngineCLSID,
		OutboundAssemblyPath,
		OutboundTypeName,
		PropertyNameSpace,
		N'' as AliasesXML, -- this property is read only
		DateModified,
		DefaultRHCfg,
		DefaultTHCfg
	from
		adm_Adapter
	where
		Name = @Name

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_Adapter_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Adapter_Load] TO BTS_OPERATORS
GO

--// Delete //--
CREATE PROCEDURE [dbo].[adm_Adapter_Delete]
@Name nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @AdapterId as int, @Capabilities as int, @dependingRL as int, @dependingTL as int, @bHasOpenedTransaction as int
	select @ErrCode = 0, @AdapterId = 0, @dependingRL = 0, @dependingTL = 0, @bHasOpenedTransaction = 0
	
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		set @bHasOpenedTransaction=1
	end

		-- retreive adapter Id
		select @AdapterId = Id from adm_Adapter where Name = @Name
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- retreive adapter capabilites
		select @Capabilities = Capabilities from adm_Adapter where Id = @AdapterId
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- check if adapter can be deleted		
		if ( (32 & @Capabilities) <> 0 ) --eProtocolDeleteProtected
			set @ErrCode = 0xC0C024C1 --CIS_E_ADMIN_PROTOCOL_DELETE_PROTECTED
		if ( @ErrCode <> 0 ) goto exit_proc
	
		-- check if there is any depending RLs
		select @dependingRL = count(*)
		from
			adm_ReceiveHandler RH,
			adm_ReceiveLocation RL
		where
			RH.AdapterId = @AdapterId AND
			RH.Id = RL.ReceiveHandlerId
			
		if ( @dependingRL > 0 )
		begin
			set @ErrCode = 0xC0C025A3	-- CIS_E_ADMIN_CORE_DELELE_WITH_EXISTING_RL
			goto exit_proc
		end
		
		-- check if there is any send location of this adapter type
		select @dependingTL = count(*)
		from bts_sendport_transport
		where nTransportTypeId = @AdapterId

		if ( @dependingTL > 0 )
		begin
			set @ErrCode = 0xC0C025A4	-- CIS_E_ADMIN_CORE_DELELE_WITH_EXISTING_TL
			goto exit_proc
		end

		-- we are not currently going to fail users if they have a dynamic sendport enlisted
		-- The subscription will stick around and then will go away when they unenlist the sendport
		-- we will just store enough information so that we can delete the subscription when the sendport is unenlisted
		UPDATE bts_dynamicport_subids set nvcHostName = h.Name
		FROM adm_SendHandler sh 
		JOIN adm_Host h ON sh.HostId = h.Id
		JOIN bts_dynamicport_subids dps ON dps.nSendHandlerID = sh.Id
		WHERE sh.AdapterId = @AdapterId

		delete from adm_ReceiveHandler where AdapterId = @AdapterId

		delete from adm_SendHandler where AdapterId = @AdapterId

		delete from adm_AdapterAlias where AdapterId = @AdapterId

		delete from adm_Adapter where Id = @AdapterId

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
			return @ErrCode
		end
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Adapter_Delete] TO BTS_ADMIN_USERS
GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_Adapter_Enum]
AS
	set nocount on
	set xact_abort on

	select
			Id,
			Name,
			Capabilities,
			Comment,
			MgmtCLSID,
			InboundEngineCLSID,
			InboundAssemblyPath,
			InboundTypeName,
			OutboundEngineCLSID,
			OutboundAssemblyPath,
			OutboundTypeName,
			PropertyNameSpace,
			N'' as AliasesXML, -- this property is read only
			DateModified,
			DefaultRHCfg,
			DefaultTHCfg
	from
		adm_Adapter
	order by
		adm_Adapter.Name

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Adapter_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Adapter_Enum] TO BTS_OPERATORS
GO
--========== Basic stored procedures for adm_ReceiveHandler table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_ReceiveHandler_Create]
	--@Name nvarchar(256),
@AdapterName nvarchar(256),
@HostName nvarchar(80),
@CustomCfg ntext,
	--@DefaultHandler int,
@HostNameToSwitchTo nvarchar(80), -- ignored during create
@SecureStoreId nvarchar(256),
@ReceiveLocationSSOAppId nvarchar(256),
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @AdapterId as int,  @Capabilities as int, @HostId as int, @HostType as int
	select @ErrCode = 0, @AdapterId=0,  @Capabilities=0, @HostId = 0, @HostType = 0

	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end


		-- resolve foreign key values
		select @AdapterId = Id from adm_Adapter where Name = @AdapterName

		select @HostId = Id, @HostType = HostType
		from adm_Host
		where adm_Host.Name = @HostName

		if ( @AdapterId = 0 OR @HostId = 0 )
		begin
			set @ErrCode = 0xC0C0259C	-- CIS_E_ADMIN_CORE_RH_INVALID_FOREIGN_KEY_VALUES
			goto exit_proc
		end

		-- retrieve adapter capabilites
		select @Capabilities = Capabilities from adm_Adapter where Id = @AdapterId
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- check if adapter has static handlers		
		if ( (64 & @Capabilities) <> 0) -- eProtocolStaticHandlers
		begin -- simplify by removing host table
			declare @prvAdapterCnt as int
			select @prvAdapterCnt = count(*) from adm_ReceiveHandler rh
				where rh.AdapterId = @AdapterId 
			if( @prvAdapterCnt > 0 )
				set @ErrCode = 0xC0C024C2 -- CIS_E_ADMIN_PROTOCOL_STATIC_HANDLERS
		end

		-- check if adapter is creatable, in which case the host must be In-Process
		if ( ((8 & @Capabilities) <> 0) AND (@HostType <> 1) ) -- eHostTypeInProcess
			set @ErrCode = 0xC0C025C7 -- CIS_E_ADMIN_CORE_INPROC_RECEIVE_HANDLER_WRONG_HOST_TYPE

		-- check if adapter is non-creatable, in which case the host must be Isolated
		if ( ((8 & @Capabilities) = 0) AND (@HostType <> 2) ) -- eHostTypeIsolated
			set @ErrCode = 0xC0C025C8 -- CIS_E_ADMIN_PROTOCOL_STATIC_HANDLERS

		if ( @ErrCode <> 0 ) goto exit_proc

		insert into adm_ReceiveHandler
		(
			AdapterId,
			HostId,
			GroupId,
			CustomCfg,
			uidCustomCfgID,
			uidReceiveLocationSSOAppID,
			nvcDescription
		)
		values
		(
			@AdapterId,
			@HostId,
			dbo.adm_GetGroupId(),
			@CustomCfg,
			convert(uniqueidentifier,@SecureStoreId),
			convert(uniqueidentifier,@ReceiveLocationSSOAppId),
			@Description
		)

		declare @HandlerId as int
		set @HandlerId = @@Identity
		
		if (dbo.adm_GetNumTransportConflictsInOrg() <> 0)
			set @ErrCode = 0xC0C02580 -- CIS_E_ADMIN_CANNOT_CREATE_RECEIVE_HANDLER_BECAUSE_TRANSPORT_CONSTRAINT

		if ( @ErrCode <> 0 ) goto exit_proc
		
		
		-- If it first handler for this transport in this group, it must be default
		--if not exists (select * from adm_DefaultReceiveHandler where GroupId = @GroupId AND AdapterId = @AdapterId)
		--begin
		--	if (0 <> @DefaultHandler)
		--		begin
		--			insert into adm_DefaultReceiveHandler (GroupId, AdapterId, ReceveiHandlerId)
		--			values (@GroupId, @AdapterId, @HandlerId)
		--		end
		--	else
		--		begin
		--			set @ErrCode = 0xC0C02562	-- CIS_E_ADMIN_FIRST_RECEIVE_HANDLER_MUST_BE_DEFAULT
		--			goto exit_proc
		--		end
		--end

		-- Reassign default handler when "DefaultHandler"="true"
		--if (0 <> @DefaultHandler)
		--begin
		--	update adm_DefaultReceiveHandler
		--	set
		--		ReceveiHandlerId = @HandlerId
		--	where
		--		GroupId = @GroupId AND AdapterId = @AdapterId
		--end
				
exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
			return @ErrCode
		end
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_ReceiveHandler_Create] TO BTS_ADMIN_USERS
GO

--// Update //--
CREATE PROCEDURE [dbo].[adm_ReceiveHandler_Update]
@AdapterName nvarchar(256),
@HostName nvarchar(80),
@CustomCfg ntext,
	--@DefaultHandler int,
@HostNameToSwitchTo nvarchar(80),
@SecureStoreId nvarchar(50),
@ReceiveLocationSSOAppId nvarchar(256),
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @HandlerId as int, @Capabilities as int
	select @ErrCode = 0, @HandlerId=0, @Capabilities=0

	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end
	
		select @HandlerId = adm_ReceiveHandler.Id
		from adm_ReceiveHandler,adm_Host, adm_Adapter
		where adm_ReceiveHandler.HostId = adm_Host.Id AND
			adm_Host.Name = @HostName AND
			adm_Adapter.Name = @AdapterName AND
			adm_ReceiveHandler.AdapterId = adm_Adapter.Id

		-- Ensure that "DefaultHost" property cannot switch off, only swich on.
		--if exists (	select * from adm_DefaultReceiveHandler
		--				where adm_DefaultReceiveHandler.ReceveiHandlerId = @HandlerId AND
		--				0 = @DefaultHandler)		
		--begin
		--	set @ErrCode = 0xC0C02563	-- CIS_E_ADMIN_CORE_DEF_RECEIVE_HANDLER_CANNOT_CHANGE
		--	goto exit_proc
		--end
		
		if(IsNull(@HostNameToSwitchTo, N'') = N'')
			set @HostNameToSwitchTo = @HostName

		-- retreive adapter capabilites
		select @Capabilities = Capabilities from adm_Adapter where Name = @AdapterName
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- Adapter constraint checking
		if ( @HostNameToSwitchTo <> @HostName )
		begin
			declare @HostType as int

			select @HostType = HostType
			from adm_Host
			where Name = @HostNameToSwitchTo
			
			-- adapter requires static handler
			if ( (64 & @Capabilities) <> 0 ) -- eProtocolStaticHandlers
				set @ErrCode = 0xC0C024C2 -- CIS_E_ADMIN_PROTOCOL_STATIC_HANDLERS
			else
			-- check if adapter is creatable, in which case the host must be In-Process
			if ( ((8 & @Capabilities) <> 0) AND (@HostType <> 1) ) -- eHostTypeInProcess
				set @ErrCode = 0xC0C025C7 -- CIS_E_ADMIN_CORE_INPROC_RECEIVE_HANDLER_WRONG_HOST_TYPE
			else
			-- check if adapter is non-creatable, in which case the host must be Isolated
			if ( ((8 & @Capabilities) = 0) AND (@HostType <> 2) ) -- eHostTypeIsolated
				set @ErrCode = 0xC0C025C8 -- CIS_E_ADMIN_CORE_ISOLATED_RECEIVE_HANDLER_WRONG_HOST_TYPE

			if ( @ErrCode <> 0 ) goto exit_proc
		end

		update adm_ReceiveHandler
		set
			HostId = adm_Host.Id,
			CustomCfg = @CustomCfg,
			DateModified = GETUTCDATE(),
			--uidCustomCfgID = convert(uniqueidentifier,@SecureStoreId),
			--uidReceiveLocationSSOAppID = convert(uniqueidentifier,@ReceiveLocationSSOAppId)
			nvcDescription = @Description
		from adm_Host
		where
			adm_ReceiveHandler.Id = @HandlerId AND
			adm_Host.Name = @HostNameToSwitchTo

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- Reassign default handler for the adapter in a group when "DefaultHost=true"
		--update	adm_DefaultReceiveHandler
		--set		ReceveiHandlerId = @HandlerId
		--from	adm_ReceiveHandler
		--where
		--	0 <> @DefaultHandler AND
		--	adm_DefaultReceiveHandler.GroupId = @GroupId AND
		--	adm_DefaultReceiveHandler.AdapterId = adm_ReceiveHandler.AdapterId AND
		--	adm_ReceiveHandler.Id = @HandlerId

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
		end
	end

	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_ReceiveHandler_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_ReceiveHandler_Load]
@AdapterName nvarchar(256),
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		adm_ReceiveHandler.Id,
		adm_Adapter.Name,
		adm_Host.Name,
		adm_ReceiveHandler.CustomCfg,
		--case (select count(*) from adm_DefaultReceiveHandler where adm_DefaultReceiveHandler.ReceveiHandlerId = adm_ReceiveHandler.Id)
		--	when 0 then 0 else -1 end as DefaultHandler,
		adm_Host.Name,
		adm_ReceiveHandler.DateModified,
		N'{' + convert(nvarchar(50),adm_ReceiveHandler.uidCustomCfgID) + N'}',
		N'{' + convert(nvarchar(50),adm_ReceiveHandler.uidReceiveLocationSSOAppID) + N'}',
		adm_ReceiveHandler.nvcDescription
	from
		adm_ReceiveHandler,
		adm_Adapter,
		adm_Host
	where
		adm_Adapter.Name = @AdapterName AND
		adm_Host.Name = @HostName AND
		adm_ReceiveHandler.AdapterId = adm_Adapter.Id AND
		adm_ReceiveHandler.HostId = adm_Host.Id

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_ReceiveHandler_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_ReceiveHandler_Load] TO BTS_OPERATORS
GO
--// Delete //--
CREATE PROCEDURE [dbo].[adm_ReceiveHandler_Delete]
@AdapterName nvarchar(256),
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @receiveHandlerId as int, @dependingRL as int
	select @ErrCode = 0, @receiveHandlerId = 0, @dependingRL = 0
	
	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end

		-- Check that this is not a "Default Handler".
		--if exists (	select * from adm_DefaultReceiveHandler, adm_ReceiveHandler, adm_Group, adm_Host, adm_Adapter
		--				where adm_DefaultReceiveHandler.ReceveiHandlerId = adm_ReceiveHandler.Id AND
		--				adm_Group.Name = @GroupName AND
		--				adm_Adapter.Name = @AdapterName AND
		--				adm_ReceiveHandler.AdapterId = adm_Adapter.Id AND
		--				adm_Host.Name = @HostName AND
		--				adm_Host.Id = adm_ReceiveHandler.HostId AND
		--				adm_Host.GroupId = adm_Group.Id)
		--begin
		--	set @ErrCode = 0xC0C02561	-- CIS_E_ADMIN_CANNOT_DELETE_DEFAULT_RECEIVE_HANDLER
		--	goto exit_proc
		--end

		select @receiveHandlerId = adm_ReceiveHandler.Id
		from	adm_ReceiveHandler,
				adm_Host,
				adm_Adapter
		where	adm_Host.Name = @HostName AND
				adm_Adapter.Name = @AdapterName AND
				adm_ReceiveHandler.AdapterId = adm_Adapter.Id AND
				adm_Host.Id = adm_ReceiveHandler.HostId

		-- check if there is any depending RLs
		select @dependingRL = count(*)
		from adm_ReceiveLocation
		where ReceiveHandlerId = @receiveHandlerId
			
		if ( @dependingRL > 0 )
		begin
			set @ErrCode = 0xC0C025A3	-- CIS_E_ADMIN_CORE_DELETE_WITH_EXISTING_RL
			goto exit_proc
		end

		delete	adm_ReceiveHandler
		where	Id = @receiveHandlerId

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- Make sure that there is at least one receive handler left
		if (not exists (select * from adm_ReceiveHandler, adm_Group, adm_Adapter
						 where adm_Adapter.Name = @AdapterName AND
							adm_ReceiveHandler.AdapterId = adm_Adapter.Id))
		begin
			set @ErrCode=0xC0C02569 -- CIS_E_ADMIN_CORE_CANNOT_DELETE_LAST_RECEIVE_HANDLER
			goto exit_proc
		end

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
		end
	end

	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_ReceiveHandler_Delete] TO BTS_ADMIN_USERS
GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_ReceiveHandler_Enum]
AS
	set nocount on
	set xact_abort on

	select
		adm_ReceiveHandler.Id,
		adm_Adapter.Name,
		adm_Host.Name,
		adm_ReceiveHandler.CustomCfg,
		--case (select count(*) from adm_DefaultReceiveHandler where adm_DefaultReceiveHandler.ReceveiHandlerId = adm_ReceiveHandler.Id)
		--	when 0 then 0 else -1 end as DefaultHandler,
		--		adm_ReceiveHandler.VirtServerName,
		adm_Host.Name,
		adm_ReceiveHandler.DateModified,
		N'{' + convert(nvarchar(50),adm_ReceiveHandler.uidCustomCfgID) + N'}',
		N'{' + convert(nvarchar(50),adm_ReceiveHandler.uidReceiveLocationSSOAppID) + N'}',
		adm_ReceiveHandler.nvcDescription
	from
		adm_ReceiveHandler,
		adm_Adapter,
		adm_Host
	where
		adm_Host.Id = adm_ReceiveHandler.HostId AND
		adm_Adapter.Id = adm_ReceiveHandler.AdapterId
	order by
		adm_Host.Name

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_ReceiveHandler_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_ReceiveHandler_Enum] TO BTS_OPERATORS
GO
--========== Basic stored procedures for adm_SendHandler table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_SendHandler_Create]
	--@Name nvarchar(256),
@AdapterName nvarchar(256),
@HostName nvarchar(80),
@CustomCfg ntext,
@SubscriptionId nvarchar(256),
@SecureStoreId nvarchar(256),
@TransmitLocationSSOId nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @AdapterId as int, @HostId as int, @HostType as int, @Capabilities as int
	select @ErrCode = 0, @AdapterId=0, @HostId = 0, @HostType = 0

	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end

		select @AdapterId = Id from adm_Adapter where Name = @AdapterName

		select @HostId = Id, @HostType = HostType
		from adm_Host
		where adm_Host.Name = @HostName

		if ( @AdapterId = 0 OR @HostId = 0 )
		begin
			set @ErrCode = 0xC0C0259D	-- CIS_E_ADMIN_CORE_TH_INVALID_FOREIGN_KEY_VALUES
			goto exit_proc
		end

		if (N'' = @SubscriptionId)
			set @SubscriptionId = NULL
			
		if exists (select * from adm_SendHandler
						 where adm_SendHandler.AdapterId = @AdapterId)
		begin
			set @ErrCode = 0xC0C02564	-- CIS_E_ADMIN_CORE_TRANSMIT_HANDLER_ALREADY_EXISTS
			goto exit_proc
		end

		if ( @HostType <> 1 ) -- eHostTypeInProcess
		begin
			set @ErrCode = 0xC0C025C9 -- CIS_E_ADMIN_CORE_SEND_HANDLER_WRONG_HOST_TYPE
			goto exit_proc
		end

		-- retrieve adapter capabilites
		select @Capabilities = Capabilities from adm_Adapter where Id = @AdapterId
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- check if adapter has static handlers		
		if ( (64 & @Capabilities) <> 0) -- eProtocolStaticHandlers
		begin -- simplify by removing host table
			declare @prvAdapterCnt as int
			select @prvAdapterCnt = count(*) from adm_SendHandler sh
				where sh.AdapterId = @AdapterId 
			if( @prvAdapterCnt > 0 )
				set @ErrCode = 0xC0C024CD -- CIS_E_ADMIN_PROTOCOL_STATIC_SEND_HANDLERS
		end
		if ( @ErrCode <> 0 ) goto exit_proc

		insert into adm_SendHandler
		(
	--		Name,
			AdapterId,
			HostId,
			GroupId,
			CustomCfg,
			SubscriptionId,
			uidCustomCfgID,
			uidTransmitLocationSSOAppId
		)
		values
		(
	--		@Name,
			@AdapterId,
			@HostId,
			dbo.adm_GetGroupId(),
			@CustomCfg,
			@SubscriptionId,
			@SecureStoreId,
			@TransmitLocationSSOId
		)

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		if (dbo.adm_GetNumTransportConflictsInOrg() <> 0)
			set @ErrCode = 0xC0C02829 -- CIS_E_ADMIN_CANNOT_CREATE_SEND_HANDLER_BECAUSE_TRANSPORT_CONSTRAINT

		if ( @ErrCode <> 0 ) goto exit_proc
		
exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
			return @ErrCode
		end
	end

	set nocount off
	return @ErrCode

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_SendHandler_Create] TO BTS_ADMIN_USERS
GO

--// Update //--
CREATE PROCEDURE [dbo].[adm_SendHandler_Update]
	--@Name nvarchar(256),
@AdapterName nvarchar(256),
@HostName nvarchar(80),
@CustomCfg ntext,
@SubscriptionId nvarchar(256),
@SecureStoreId nvarchar(256),
@TransmitLocationSSOId nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @OldHostName as nvarchar(80), @Capabilities as int, @HostType as int
	select @ErrCode = 0, @Capabilities=0, @HostType = 0

	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end

		if (N'' = @SubscriptionId)
			set @SubscriptionId = NULL

		-- get name of the old host
		select @OldHostName = adm_Host.Name
		from
			adm_Host,
			adm_Adapter,
			adm_SendHandler
		where
			adm_Adapter.Name = @AdapterName AND
			adm_SendHandler.AdapterId = adm_Adapter.Id AND
			adm_Host.Id = adm_SendHandler.HostId
			
		-- Make sure new host is of type In-Process
		select @HostType = adm_Host.HostType
		from adm_Host
		where Name = @HostName
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
		if ( @HostType <> 1 ) -- eHostTypeInProcess
		begin
			set @ErrCode = 0xC0C025C9 -- CIS_E_ADMIN_CORE_SEND_HANDLER_WRONG_HOST_TYPE
			goto exit_proc
		end

		-- retreive adapter capabilites
		select @Capabilities = Capabilities from adm_Adapter where Name = @AdapterName
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- check if adapter has static handlers		
		if ( ((64 & @Capabilities) <> 0) AND (@OldHostName <> @HostName) ) -- eProtocolStaticHandlers
		begin
			set @ErrCode = 0xC0C024C2 -- CIS_E_ADMIN_PROTOCOL_STATIC_HANDLERS
			goto exit_proc
		end

		-- Update handler
		update adm_SendHandler
		set
			HostId = adm_Host.Id,
			CustomCfg=@CustomCfg,
			SubscriptionId	= IsNULL(@SubscriptionId, adm_SendHandler.SubscriptionId),
			DateModified = GETUTCDATE()
		from
			adm_Host,
			adm_Adapter
		where
			adm_Host.Name = @HostName AND
			adm_Adapter.Name = @AdapterName AND
			adm_SendHandler.AdapterId = adm_Adapter.Id

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
		end
	end

	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_SendHandler_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_SendHandler_Load]
@AdapterName nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	declare @ServiceClassMSMQT as uniqueidentifier, @ServiceClassMessaging as uniqueidentifier
	
	select @ServiceClassMSMQT = UniqueId from adm_ServiceClass where Name = N'MSMQT'
	select @ServiceClassMessaging = UniqueId from adm_ServiceClass where Name = N'Messaging'

	select
		adm_SendHandler.Id,
		adm_Adapter.Name,
		adm_Host.Name,
		adm_SendHandler.CustomCfg,
		adm_SendHandler.SubscriptionId,
		N'{' + convert(nvarchar(50),adm_SendHandler.uidCustomCfgID) + N'}',
		N'{' + convert(nvarchar(50),adm_SendHandler.uidTransmitLocationSSOAppId) + N'}',
		adm_Adapter.OutboundEngineCLSID,
		case
			when (adm_Adapter.MgmtCLSID = N'{9A7B0162-2CD5-4F61-B7EB-C40A3442A5F8}')
				then @ServiceClassMSMQT
				else @ServiceClassMessaging
		end,
		adm_SendHandler.DateModified
	from
		adm_SendHandler,
		adm_Adapter,
		adm_Host
	where
		adm_Adapter.Name = @AdapterName AND
		adm_Host.Id = adm_SendHandler.HostId AND
		adm_Adapter.Id = adm_SendHandler.AdapterId AND
		adm_SendHandler.IsDefault = 1

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_SendHandler_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_SendHandler_Load] TO BTS_OPERATORS
GO
--// Enum //--
CREATE PROCEDURE [dbo].[adm_SendHandler_Enum]
AS
	set nocount on
	set xact_abort on

	declare @ServiceClassMSMQT as uniqueidentifier, @ServiceClassMessaging as uniqueidentifier
	
	select @ServiceClassMSMQT = UniqueId from adm_ServiceClass where Name = N'MSMQT'
	select @ServiceClassMessaging = UniqueId from adm_ServiceClass where Name = N'Messaging'

	select
		adm_SendHandler.Id,
		adm_Adapter.Name,
		adm_Host.Name,
		adm_SendHandler.CustomCfg,
		adm_SendHandler.SubscriptionId,
		adm_SendHandler.uidCustomCfgID,
		adm_SendHandler.uidTransmitLocationSSOAppId,
		adm_Adapter.OutboundEngineCLSID,
		case
			when (adm_Adapter.MgmtCLSID = N'{9A7B0162-2CD5-4F61-B7EB-C40A3442A5F8}')
				then @ServiceClassMSMQT
				else @ServiceClassMessaging
		end,
		adm_SendHandler.DateModified
	from
		adm_SendHandler,
		adm_Adapter,
		adm_Host
	where
		adm_Host.Id = adm_SendHandler.HostId AND
		adm_Adapter.Id = adm_SendHandler.AdapterId AND
		adm_SendHandler.IsDefault = 1
	order by
		adm_Host.Name

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_SendHandler_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_SendHandler_Enum] TO BTS_OPERATORS
GO
--========== Version 2 stored procedures for adm_SendHandler table ==========--

--// Create //--
CREATE PROCEDURE [dbo].[adm_SendHandler2_Create]
	--@Name nvarchar(256),
@AdapterName nvarchar(256),
@HostName nvarchar(80),
@IsDefault bit,
@CustomCfg ntext,
@SubscriptionId nvarchar(256),
@SecureStoreId nvarchar(256),
@TransmitLocationSSOId nvarchar(256),
@HostNameToSwitchTo nvarchar(80), -- ignored during create
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @AdapterId as int, @HostId as int, @HostType as int, @Capabilities as int
	select @ErrCode = 0, @AdapterId=0, @HostId = 0, @HostType = 0

	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end

		-- if this is the first handler of this adapter, set @IsDefault to true
		if (NOT exists (select * from adm_SendHandler, adm_Adapter
								 where adm_Adapter.Name = @AdapterName AND
									adm_SendHandler.AdapterId = adm_Adapter.Id ))
			set @IsDefault = 1
		
		
		select @AdapterId = Id from adm_Adapter where Name = @AdapterName

		select @HostId = Id, @HostType = HostType
		from adm_Host
		where adm_Host.Name = @HostName

		if ( @AdapterId = 0 OR @HostId = 0 )
		begin
			set @ErrCode = 0xC0C0259D	-- CIS_E_ADMIN_CORE_TH_INVALID_FOREIGN_KEY_VALUES
			goto exit_proc
		end

		if (N'' = @SubscriptionId)
			set @SubscriptionId = NULL
			
		if (@IsDefault = 1) AND exists (select * from adm_SendHandler
						 where adm_SendHandler.AdapterId = @AdapterId
						 and adm_SendHandler.IsDefault = 1)
		begin
			update adm_SendHandler
			set
				IsDefault = 0
			where
				adm_SendHandler.AdapterId = @AdapterId AND
				adm_SendHandler.IsDefault = 1
		end

		if ( @HostType <> 1 ) -- eHostTypeInProcess
		begin
			set @ErrCode = 0xC0C025C9 -- CIS_E_ADMIN_CORE_SEND_HANDLER_WRONG_HOST_TYPE
			goto exit_proc
		end

		-- retrieve adapter capabilites
		select @Capabilities = Capabilities from adm_Adapter where Id = @AdapterId
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- check if adapter has static handlers		
		if ( (64 & @Capabilities) <> 0) -- eProtocolStaticHandlers
		begin -- simplify by removing host table
			declare @prvAdapterCnt as int
			select @prvAdapterCnt = count(*) from adm_SendHandler sh
				where sh.AdapterId = @AdapterId 
			if( @prvAdapterCnt > 0 )
				set @ErrCode = 0xC0C024CD -- CIS_E_ADMIN_PROTOCOL_STATIC_SEND_HANDLERS
		end
		if ( @ErrCode <> 0 ) goto exit_proc

		insert into adm_SendHandler
		(
	--		Name,
			AdapterId,
			HostId,
			GroupId,
			IsDefault,
			CustomCfg,
			SubscriptionId,
			uidCustomCfgID,
			uidTransmitLocationSSOAppId,
			nvcDescription
		)
		values
		(
	--		@Name,
			@AdapterId,
			@HostId,
			dbo.adm_GetGroupId(),
			@IsDefault,
			@CustomCfg,
			@SubscriptionId,
			@SecureStoreId,
			@TransmitLocationSSOId,
			@Description
		)

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
		if (dbo.adm_GetNumTransportConflictsInOrg() <> 0)
			set @ErrCode = 0xC0C02829 -- CIS_E_ADMIN_CANNOT_CREATE_SEND_HANDLER_BECAUSE_TRANSPORT_CONSTRAINT

		if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
			return @ErrCode
		end
	end

	set nocount off
	return @ErrCode

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_SendHandler2_Create] TO BTS_ADMIN_USERS
GO

--// Update //--
CREATE PROCEDURE [dbo].[adm_SendHandler2_Update]
	--@Name nvarchar(256),
@AdapterName nvarchar(256),
@HostName nvarchar(80),
@IsDefault bit,
@CustomCfg ntext,
@SubscriptionId nvarchar(256),
@SecureStoreId nvarchar(256),
@TransmitLocationSSOId nvarchar(256),
@HostNameToSwitchTo nvarchar(80),
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @Capabilities as int, @HostType as int, @HandlerId as int, @OldDefault as int
	select @ErrCode = 0, @Capabilities=0, @HostType = 0

	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end

	if (N'' = @SubscriptionId)
		set @SubscriptionId = NULL
		
	if (N'' = @HostNameToSwitchTo)
		set @HostNameToSwitchTo = @HostName
	
	-- keep the handler id
	select @HandlerId = adm_SendHandler.Id, @OldDefault = adm_SendHandler.IsDefault
	from adm_SendHandler, adm_Host, adm_Adapter
	where adm_SendHandler.HostId = adm_Host.Id AND
		adm_Host.Name = @HostName AND
		adm_Adapter.Name = @AdapterName AND
		adm_SendHandler.AdapterId = adm_Adapter.Id
		
	-- make sure that IsDefault cannot be turned off
	if ( @OldDefault = 1 AND @IsDefault = 0 )
	begin
		set @ErrCode = 0xC0C02810 -- CIS_E_ADMIN_CANNOT_CHANGE_DEFAULT_SEND_HANDLER_TO_NONDEFAULT
		goto exit_proc
	end
			
	if ( @HostNameToSwitchTo <> @HostName )
	begin		
		-- Make sure new host is of type In-Process
		select @HostType = adm_Host.HostType
		from adm_Host
		where Name = @HostNameToSwitchTo
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
		if ( @HostType <> 1 ) -- eHostTypeInProcess
		begin
			set @ErrCode = 0xC0C025C9 -- CIS_E_ADMIN_CORE_SEND_HANDLER_WRONG_HOST_TYPE
			goto exit_proc
		end
	end

	-- retreive adapter capabilites
	select @Capabilities = Capabilities from adm_Adapter where Name = @AdapterName
	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) goto exit_proc

	-- check if adapter has static handlers		
	if ( ((64 & @Capabilities) <> 0) AND (@HostNameToSwitchTo <> @HostName) ) -- eProtocolStaticHandlers
	begin
		set @ErrCode = 0xC0C024C2 -- CIS_E_ADMIN_PROTOCOL_STATIC_HANDLERS
		goto exit_proc
	end

	-- If we are setting this send handler to default, then update the old default handler
	if ( @OldDefault = 0 AND @IsDefault = 1 )
	begin
		
		-- won't allow changing default send handler if there are enlisted dynamic send ports
		-- if ( select count(*) from bts_sendport where bDynamic = 1 AND nPortStatus = 2 ) > 0
		-- begin
		--	set @ErrCode = 0xC0C02812  -- CIS_E_ADMIN_ENLISTED_DYNAMIC_SEND_PORT_EXIST
		--	goto exit_proc
		-- end
		
		-- get the old default handler id		
		declare @OldDefaultHandlerId as int
		select @OldDefaultHandlerId = adm_SendHandler.Id
		from adm_SendHandler,  adm_Adapter
		where 
			adm_Adapter.Name = @AdapterName AND
			adm_SendHandler.AdapterId = adm_Adapter.Id AND
			adm_SendHandler.IsDefault = 1
		
		-- update dynamic subscriptions to use the new handler
		update bts_dynamicport_subids
		set
			nSendHandlerID = @HandlerId
		where
			nSendHandlerID = @OldDefaultHandlerId
			
		-- update send handler table to turn off the default flag on old default handler
		update adm_SendHandler
		set
			IsDefault = 0
		where
			Id = @OldDefaultHandlerId
		
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
		
		
	end			
			
	-- Update this handler
	update adm_SendHandler
	set
		HostId = adm_Host.Id,
		IsDefault = @IsDefault,
		CustomCfg=@CustomCfg,
		SubscriptionId	= IsNULL(@SubscriptionId, adm_SendHandler.SubscriptionId),
		DateModified = GETUTCDATE(),
		nvcDescription = @Description
	from
		adm_Host
	where
		adm_SendHandler.Id = @HandlerId AND
		adm_Host.Name = @HostNameToSwitchTo

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
		end
	end

	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_SendHandler2_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_SendHandler2_Load]
@AdapterName nvarchar(256),
@HostName	nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	declare @ServiceClassMSMQT as uniqueidentifier, @ServiceClassMessaging as uniqueidentifier
	
	select @ServiceClassMSMQT = UniqueId from adm_ServiceClass where Name = N'MSMQT'
	select @ServiceClassMessaging = UniqueId from adm_ServiceClass where Name = N'Messaging'

	select
		adm_SendHandler.Id,
		adm_Adapter.Name,
		adm_Host.Name,
		adm_SendHandler.IsDefault,
		adm_SendHandler.CustomCfg,
		adm_SendHandler.SubscriptionId,
		N'{' + convert(nvarchar(50),adm_SendHandler.uidCustomCfgID) + N'}',
		N'{' + convert(nvarchar(50),adm_SendHandler.uidTransmitLocationSSOAppId) + N'}',
		adm_Adapter.OutboundEngineCLSID,
		case
			when (adm_Adapter.MgmtCLSID = N'{9A7B0162-2CD5-4F61-B7EB-C40A3442A5F8}')
				then @ServiceClassMSMQT
				else @ServiceClassMessaging
		end,
		adm_SendHandler.DateModified,
		adm_Host.Name,
		adm_SendHandler.nvcDescription
	from
		adm_SendHandler,
		adm_Adapter,
		adm_Host
	where
		adm_Adapter.Name = @AdapterName AND
		adm_Host.Name = @HostName AND
		adm_Host.Id = adm_SendHandler.HostId AND
		adm_Adapter.Id = adm_SendHandler.AdapterId
		

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_SendHandler2_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_SendHandler2_Load] TO BTS_OPERATORS
GO
--// Enum //--
CREATE PROCEDURE [dbo].[adm_SendHandler2_Enum]
AS
	set nocount on
	set xact_abort on

	declare @ServiceClassMSMQT as uniqueidentifier, @ServiceClassMessaging as uniqueidentifier
	
	select @ServiceClassMSMQT = UniqueId from adm_ServiceClass where Name = N'MSMQT'
	select @ServiceClassMessaging = UniqueId from adm_ServiceClass where Name = N'Messaging'

	select
		adm_SendHandler.Id,
		adm_Adapter.Name,
		adm_Host.Name,
		adm_SendHandler.IsDefault,
		adm_SendHandler.CustomCfg,
		adm_SendHandler.SubscriptionId,
		adm_SendHandler.uidCustomCfgID,
		adm_SendHandler.uidTransmitLocationSSOAppId,
		adm_Adapter.OutboundEngineCLSID,
		case
			when (adm_Adapter.MgmtCLSID = N'{9A7B0162-2CD5-4F61-B7EB-C40A3442A5F8}')
				then @ServiceClassMSMQT
				else @ServiceClassMessaging
		end,
		adm_SendHandler.DateModified,
		adm_Host.Name,
		adm_SendHandler.nvcDescription
	from
		adm_SendHandler,
		adm_Adapter,
		adm_Host
	where
		adm_Host.Id = adm_SendHandler.HostId AND
		adm_Adapter.Id = adm_SendHandler.AdapterId
	order by
		adm_Host.Name

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_SendHandler2_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_SendHandler2_Enum] TO BTS_OPERATORS
GO
CREATE PROCEDURE [dbo].[adm_SendHandler2_Delete]
@AdapterName nvarchar(256),
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @sendHandlerId as int, @dependingSP as int, @IsDefault as bit
	select @ErrCode = 0, @sendHandlerId = 0, @dependingSP = 0
	
	declare @bHasOpenedTransaction as int
	select @bHasOpenedTransaction=0
	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		select @bHasOpenedTransaction=1
	end

	select	@IsDefault = adm_SendHandler.IsDefault, @sendHandlerId = adm_SendHandler.Id
	from
		adm_SendHandler,
		adm_Adapter,
		adm_Host
	where
		adm_Adapter.Name = @AdapterName AND
		adm_Host.Name = @HostName AND
		adm_Host.Id = adm_SendHandler.HostId AND
		adm_Adapter.Id = adm_SendHandler.AdapterId
		
	-- disallow if this is a default send handler
	if (@IsDefault = 1)
	begin
		set @ErrCode = 0xC0C0280F	-- CIS_E_ADMIN_CANNOT_DELETE_DEFAULT_SEND_HANDLER
		goto exit_proc
	end	

	-- check if there is any depending SPs
	select @dependingSP = count(*)
	from bts_sendport_transport
	where nSendHandlerID = @sendHandlerId
			
	if ( @dependingSP > 0 )
	begin
		set @ErrCode = 0xC0C02811	-- CIS_E_ADMIN_CANNOT_DELETE_SEND_HANDLER_IN_USE
		goto exit_proc
	end

	delete	adm_SendHandler
	where	Id = @sendHandlerId

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) goto exit_proc

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
		end
	end

	return @ErrCode
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_SendHandler2_Delete] TO BTS_ADMIN_USERS
GO


--========== Basic stored procedures for Send Port object ==========--


--// Update //--
CREATE PROCEDURE [dbo].[adm_SendPort_Update]
@Name nvarchar(256),
@PrimaryTransport int,
@AdapterName nvarchar(256),
@InboundTransportURL nvarchar(1024),
@HostName nvarchar(80),
@Comment nvarchar(1024),
@CustomCfg ntext,
@PipelineName nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ReceiveHandlerId as int, @ErrCode as int
	select @ErrCode=0, @ReceiveHandlerId=0

	begin transaction
		
		-- initialize  @ReceiveHandlerId
		if(IsNULL(@HostName, N'') = N'')
		begin
			select @ReceiveHandlerId = NULL
		end
		else
		begin
			select @ReceiveHandlerId = adm_ReceiveHandler.Id from adm_ReceiveHandler, adm_Host, adm_Adapter
			where
				adm_ReceiveHandler.HostId = adm_Host.Id AND
				adm_ReceiveHandler.AdapterId = adm_Adapter.Id AND
				adm_Host.Name = @HostName AND
				adm_Adapter.Name = @AdapterName
				
			if ( 0 = @@ROWCOUNT)
			begin
				set @ErrCode = 0xC0C025C2 -- CIS_E_ADMIN_INVALID_HANDLER_HOST_NAME
				goto exit_proc
			end
		end
/* TODO - implement UPDATE bts_sendport
		update adm_ReceiveLocation
		set
			ReceiveHandlerId = @ReceiveHandlerId,
			Comment = @Comment,
			OperatingWindowEnabled = @OperatingWindowEnabled,
 			ActiveStartDT=@ActiveStartDT,
 			ActiveStopDT=@ActiveStopDT,
 			SrvWinStartDT=@SrvWinStartDT, 
 			SrvWinStopDT=@SrvWinStopDT, 
			Disabled = @Disabled,
			CustomCfg = @CustomCfg,
			DateModified = GETUTCDATE(), 
			InboundTransportURL = @InboundTransportURL,
			InboundAddressableURL = @InboundAddressableURL,
			ReceivePipelineId = bts_pipeline.Id
		from bts_pipeline
		where
			bts_pipeline.Name = @ReceiveServiceName AND
			adm_ReceiveLocation.Name = @Name
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
*/			

		if ( @ErrCode <> 0 ) goto exit_proc
		
exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_SendPort_Update] TO BTS_ADMIN_USERS
GO


--// Load //--
CREATE PROCEDURE [dbo].[adm_SendPort_Load]
@Name nvarchar(256),
@PrimaryTransport int
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	select @ErrCode = 0
	
		--case (select count(*) from adm_DefaultReceiveHandler where adm_DefaultReceiveHandler.ReceveiHandlerId = adm_ReceiveHandler.Id)
		--	when 0 then 0 else -1 end as DefaultHandler,

	select
		sp.nID,
		sp.nvcName,
		spt.bIsPrimary,
		adapter.Name,
		spt.nvcAddress,
		host.Name,
		N'', -- No comment, to be removed
		spt.nvcTransportTypeData, -- CustomCfg
		pipeline.FullyQualifiedName,
		sp.DateModified
	from
		bts_sendport sp
	inner join bts_sendport_transport spt on spt.nSendPortID = sp.nID
	inner join adm_Adapter adapter on adapter.Id = spt.nTransportTypeId
	left join adm_Host host on host.Id = sp.nApplicationTypeId
	inner join bts_pipeline pipeline on pipeline.Id = sp.nSendPipelineID
	where 
		sp.nvcName = @Name and
		spt.bIsPrimary = @PrimaryTransport
	
	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_SendPort_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_SendPort_Load] TO BTS_OPERATORS
GO

--// Enum //--
CREATE PROCEDURE [dbo].[adm_SendPort_Enum]
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		sp.nID,
		sp.nvcName,
		spt.bIsPrimary,
		adapter.Name,
		spt.nvcAddress,
		host.Name,
		N'', -- No comment, to be removed
		spt.nvcTransportTypeData, -- CustomCfg
		pipeline.FullyQualifiedName,
		sp.DateModified
	from
		bts_sendport sp
	inner join bts_sendport_transport spt on spt.nSendPortID = sp.nID
	inner join adm_Adapter adapter on adapter.Id = spt.nTransportTypeId
	left join adm_Host host on host.Id = sp.nApplicationTypeId
	inner join bts_pipeline pipeline on pipeline.Id = sp.nSendPipelineID

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_SendPort_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_SendPort_Load] TO BTS_OPERATORS
GO

--========== Basic stored procedures for MsgBox Queue class ==========--

--// Load //--
CREATE PROCEDURE [dbo].[adm_Queue_Load]
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		host.Name
	from
		adm_Host host
	where
		host.Name = @HostName

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_Queue_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Queue_Load] TO BTS_OPERATORS
GO
--// Enum //--
CREATE PROCEDURE [dbo].[adm_Queue_Enum]
AS
	select
		host.Name
	from
		adm_Host host
GO
GRANT EXEC ON [dbo].[adm_Queue_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Queue_Enum] TO BTS_OPERATORS
GO


--========== Basic stored procedures for Orchestration class ==========--

--// Update //--
CREATE PROCEDURE [dbo].[adm_Orchestration_Update]
@Name nvarchar(256),
@AssemblyName nvarchar(256),
@AssemblyVersion nvarchar(256),
@AssemblyCulture nvarchar(256),
@AssemblyPKToken nvarchar(256),
@ServiceStatus int
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	begin transaction

		update
			bts_orchestration
		set
			nOrchestrationStatus =
				case	-- Mapping admin WMI state to deployment state
					when (@ServiceStatus = 1 OR @ServiceStatus = 2) then 1	-- eSvcStatusUnbound or eSvcStatusBound
					when  @ServiceStatus = 3 then 2							-- eSvcStatusEnlisted
					when  @ServiceStatus = 4 then 3							-- eSvcStatusStarted
					when  @ServiceStatus = 5 then 4							-- eSvcStatusStopping
				end,
			nAdminHostID =
				case	-- Clear AdminHostID when unenlisting
					when (@ServiceStatus = 1 OR @ServiceStatus = 2) then NULL	-- eSvcStatusUnbound or eSvcStatusBound
					else nAdminHostID
				end
		from
			bts_assembly asm,
			bts_orchestration orch
		where
			orch.nvcFullName = @Name AND
			orch.nAssemblyID = asm.nID AND
			asm.nvcName = @AssemblyName AND
			asm.nvcVersion = @AssemblyVersion AND
			asm.nvcCulture = @AssemblyCulture AND
			asm.nvcPublicKeyToken = @AssemblyPKToken 

		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc
		
exit_proc:
	if(@ErrCode = 0)
		commit transaction
	else
	begin
		rollback transaction
		return @ErrCode
	end

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Orchestration_Update] TO BTS_ADMIN_USERS
GO

--// Load //--
CREATE PROCEDURE [dbo].[adm_Orchestration_Load]
@Name nvarchar(256),
@AssemblyName nvarchar(256),
@AssemblyVersion nvarchar(256),
@AssemblyCulture nvarchar(256),
@AssemblyPKToken nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		orch.nvcFullName,
		asm.nvcName,
		asm.nvcVersion,
		asm.nvcCulture,
		asm.nvcPublicKeyToken,
		orch.dtModified,
		host.Name,
		case	-- Mapping deployment state to admin WMI state
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) > 0) then 1	-- eSvcStatusUnbound
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) = 0) then 2	-- eSvcStatusBound
			when orch.nOrchestrationStatus = 2 then 3		-- eSvcStatusEnlisted
			when orch.nOrchestrationStatus = 3 then 4		-- eSvcStatusStarted
		end
	from
		bts_assembly asm,
		bts_orchestration orch left outer join adm_Host host on orch.nAdminHostID = host.Id
	where
		orch.nAssemblyID = asm.nID AND
		orch.nvcFullName = @Name AND
		asm.nvcName = @AssemblyName AND
		asm.nvcVersion = @AssemblyVersion AND
		asm.nvcCulture = @AssemblyCulture AND
		asm.nvcPublicKeyToken = @AssemblyPKToken

	-- Check whehter load was successful...
	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_Orchestration_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Orchestration_Load] TO BTS_OPERATORS
GO
--// Enum //--
CREATE PROCEDURE [dbo].[adm_Orchestration_Enum]
AS
	set nocount on
	set xact_abort on

	select
		orch.nvcFullName,
		asm.nvcName,
		asm.nvcVersion,
		asm.nvcCulture,
		asm.nvcPublicKeyToken,
		orch.dtModified,
		host.Name,
		case	-- Mapping deployment state to admin WMI state
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) > 0) then 1	-- eSvcStatusUnbound
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) = 0) then 2	-- eSvcStatusBound
			when orch.nOrchestrationStatus = 2 then 3		-- eSvcStatusEnlisted
			when orch.nOrchestrationStatus = 3 then 4		-- eSvcStatusStarted
		end
	from
		bts_assembly asm,
		bts_orchestration orch left outer join adm_Host host on orch.nAdminHostID = host.Id
	where
		orch.nAssemblyID = asm.nID

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Orchestration_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Orchestration_Enum] TO BTS_OPERATORS
GO
--// Enlistment //--
CREATE PROCEDURE [dbo].[adm_Orchestration_Enlistment]
@ServiceGUID uniqueidentifier,
@HostName nvarchar(80)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @bHasOpenedTransaction as int, @OrchestrationID as int, @HostId as int, @HostType as int
	select @ErrCode = 0, @bHasOpenedTransaction=0, @OrchestrationID = 0, @HostId = 0, @HostType = 0

	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		set @bHasOpenedTransaction=1
	end

		-- Resolve the OrchestrationID
		select
			@OrchestrationID = nID
		from
			bts_orchestration
		where
			uidGUID = @ServiceGUID

		-- Check whether load was successful...
		set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
		if ( @ErrCode <> 0 ) goto exit_proc

		-- Resolve the Host ID
		select @HostId = Id, @HostType = HostType
		from adm_Host
		where Name = @HostName

		if ( @@ROWCOUNT < 1 )
		begin
			set @ErrCode = 0xC0C02571	-- CIS_E_ADMIN_SVC_ENLIST_INVALID_HOST
			goto exit_proc
		end
		
		-- Check that the specified host is creatable
		if ( @HostType <> 1 )	-- eHostTypeInProcess
		begin
			set @ErrCode = 0xC0C025C5	-- CIS_E_ADMIN_SVC_ENLIST_INVALID_HOST_TYPE
			goto exit_proc
		end
	
		--	
		-- Invoke Partner Mgmt stored function to check whether Service is fully bound or not
		--
		if ( dbo.bts_OrchestrationBindingComplete(@OrchestrationID) <> 0 )
		begin
			set @ErrCode = 0xC0C02572	-- CIS_E_ADMIN_SVC_ENLIST_NOT_BOUND
			goto exit_proc
		end

		-- Check that there must be at least one MsgBox in the Group before any service can be enlisted
		select Id from adm_MessageBox
			
		if ( @@ROWCOUNT < 1 )
		begin
			set @ErrCode = 0xC0C02577	-- CIS_E_ADMIN_CORE_ZERO_MSGBOX_ENLISTMENT
			goto exit_proc
		end

		-- Check whether all the related RLs are fully configured
		if ( dbo.adm_GetNumMisconfiguredRL(@ServiceGUID) > 0 )
		begin
			set @ErrCode = 0xC0C02573	-- CIS_E_ADMIN_SVC_ENLIST_RL_MISCONFIGURED
			goto exit_proc
		end
		
		-- Update the enlisting Service with the hosting Host's ID
		update
			bts_orchestration
		set
			nAdminHostID = @HostId
		where
			nID = @OrchestrationID

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
			return @ErrCode
		end
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Orchestration_Enlistment] TO BTS_ADMIN_USERS
GO

--// GetPortLrpBinding //--
CREATE PROCEDURE [dbo].[adm_Orchestration_GetPortLrpBinding]
@ServiceGUID uniqueidentifier
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	select @ErrCode = 0

	-- Retrieve the list of (ReceivePort, LRP) binding info
	select
        svcPort.uidGUID as portID,
        lrp.uidGUID as lrpID
	from
		bts_orchestration svc WITH (NOLOCK),
        bts_orchestration_port svcPort WITH (NOLOCK),
        bts_orchestration_port_binding binding WITH (NOLOCK),
        bts_receiveport lrp WITH (NOLOCK)
	where
		svc.uidGUID = @ServiceGUID AND
		svc.nID = svcPort.nOrchestrationID AND
        svcPort.nID = binding.nOrcPortID AND
        binding.nReceivePortID = lrp.nID --AND
        --svcPort.nPolarity = 1	-- inbound port only (confirm with Deployment)

exit_proc:

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Orchestration_GetPortLrpBinding] TO BTS_ADMIN_USERS
GO

--// ToggleRLs //--
CREATE PROCEDURE [dbo].[adm_Orchestration_ToggleRLs]
@ServiceGUID uniqueidentifier,
@Disabled int
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int, @bHasOpenedTransaction as int
	select @ErrCode = 0, @bHasOpenedTransaction=0

	if(@@trancount = 0) -- this sp should be called from DTC
	begin
		begin transaction
		set @bHasOpenedTransaction=1
	end

		-- Verify that all receive locations are properly configured during Enabling (only)
		if ( @Disabled = 0 AND dbo.adm_GetNumMisconfiguredRL(@ServiceGUID) > 0 )
		begin
			set @ErrCode = 0xC0C02573	-- CIS_E_ADMIN_SVC_ENLIST_RL_MISCONFIGURED
			goto exit_proc
		end

		-- Toggle all receive locations associated with the specified service
		update
			adm_ReceiveLocation
		set
			Disabled = @Disabled
		from
			bts_orchestration svc,
			bts_orchestration_port svcPort,
			bts_orchestration_port_binding portBinding,
			bts_receiveport lrp,
			adm_ReceiveLocation rl,
			adm_ReceiveHandler rh
		where
			svc.uidGUID = @ServiceGUID AND
			svc.nID = svcPort.nOrchestrationID AND
			svcPort.nID = portBinding.nOrcPortID AND
			portBinding.nReceivePortID = lrp.nID AND
			lrp.nID = rl.ReceivePortId AND
			rl.ReceiveHandlerId IS NOT NULL		-- only enable RLs which are hosted by receive handler

exit_proc:
	if(0 <> @bHasOpenedTransaction)
	begin
		if(@ErrCode = 0)
			commit transaction
		else
		begin
			rollback transaction
			return @ErrCode
		end
	end

	set nocount off
	return @ErrCode
GO
GRANT EXEC ON [dbo].[adm_Orchestration_ToggleRLs] TO BTS_ADMIN_USERS
GO

		
--// QueryDependencyInfo //--
CREATE PROCEDURE [dbo].[adm_Orchestration_QueryDependencyInfo]
@Direction nchar(1),	-- 'U' upstream / 'D' downstream
@Name nvarchar(256),
@AssemblyName nvarchar(256),
@AssemblyVersion nvarchar(256),
@AssemblyCulture nvarchar(256),
@AssemblyPKToken nvarchar(256)
AS
	set nocount on

	declare @nOrchestrationID as int

	-- Lookup the service ID	
	select
		@nOrchestrationID = orch.nID
	from
		bts_assembly asm,
		bts_orchestration orch
	where
		orch.nAssemblyID = asm.nID AND
		orch.nvcFullName = @Name AND
		asm.nvcName = @AssemblyName AND
		asm.nvcVersion = @AssemblyVersion AND
		asm.nvcCulture = @AssemblyCulture AND
		asm.nvcPublicKeyToken = @AssemblyPKToken

	if ( @@ROWCOUNT = 0 )
		return
		
	-- Execute deployment stored procedure for retrieving relevant info from
	-- service dependency table
	select
		asm1.nvcName as CallerAssemblyName,
		asm1.nvcVersion as CallerAssemblyVersion,
		asm1.nvcCulture as CallerAssemblyCulture,
		asm1.nvcPublicKeyToken as CallerAssemblyPKToken,
		svc1.nvcFullName as CallerService,
		host1.Name as CallerEnlistedHost,
		asm2.nvcName as CalleeAssemblyName,
		asm2.nvcVersion as CalleeAssemblyVersion,
		asm2.nvcCulture as CalleeAssemblyCulture,
		asm2.nvcPublicKeyToken as CalleeAssemblyPKToken,
		svc2.nvcFullName as CalleeService,
		host2.Name as CalleeEnlistedHost,
		dp.CallType as CallType,
		svc1.nOrchestrationStatus as CallerServiceStatus,
		svc2.nOrchestrationStatus as CalleeServiceStatus,
		dp.Depth as Depth
	from
		adm_GetOrchestrationDependencies(@nOrchestrationID, @Direction) dp,
		bts_assembly asm1,
		bts_orchestration svc1 left outer join adm_Host host1 on svc1.nAdminHostID = host1.Id,
		bts_assembly asm2,
		bts_orchestration svc2 left outer join adm_Host host2 on svc2.nAdminHostID = host2.Id
	where
		dp.CallerSvcId = svc1.nID AND
		svc1.nAssemblyID = asm1.nID AND
		dp.CalleeSvcId = svc2.nID AND
		svc2.nAssemblyID = asm2.nID
	
	set nocount off
GO
GRANT EXEC ON [dbo].[adm_Orchestration_QueryDependencyInfo] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_Orchestration_QueryDependencyInfo] TO BTS_OPERATORS
GO


--// adm_GetOrchestrationDependencies //--
CREATE FUNCTION [dbo].[adm_GetOrchestrationDependencies]
(
	@nOrchestrationID int,
	@Direction nchar(1)		-- 'U' upstream / 'D' downstream
)
RETURNS @tblServiceDependency TABLE (CallerSvcId int,
									 CalleeSvcId int,
									 CallType tinyint,
									 Depth int)
AS
BEGIN
	declare @nCurrServiceId as int, @nStackSize as int
	
	-- Declare a Stack
	declare @tblStack TABLE(
		id integer identity(1,1),
		value integer NOT NULL,
		Depth int NOT NULL
	)

	-- Push root into Stack
	insert into @tblStack values(@nOrchestrationID, 0)
	set @nStackSize = 1

	while ( @nStackSize > 0 )
	begin
		-- Pop top entry from Stack
		declare @id as int, @nCurrDepth as int
		select @id = id, @nCurrServiceId = value, @nCurrDepth = Depth from @tblStack order by id asc
		delete from @tblStack where id = @id

		-- Declare Table for storing new dependencies found
		declare @tblNewDependency TABLE(
			CallerSvcId int NOT NULL,
			CalleeSvcId int NOT NULL,
			CallType tinyint NOT NULL,
			Depth int NOT NULL
		)
		
		-- Find the next layer of new dependencies
		insert into @tblNewDependency
			select nOrchestrationID, nInvokedOrchestrationID, nInvokeType, @nCurrDepth+1
			from bts_orchestration_invocation
			where (@Direction = N'D' AND nOrchestrationID = @nCurrServiceId)
					OR
				  (@Direction = N'U' AND nInvokedOrchestrationID = @nCurrServiceId)
			
		if ( @@ROWCOUNT > 0 )
		begin
			-- Push only those new depending ServiceIds into Stack only if they have
			-- not been visited before
			if ( @Direction = N'D' )
				begin
					insert into @tblStack
						select CalleeSvcId, @nCurrDepth+1
						from @tblNewDependency
						where CalleeSvcId <> @nOrchestrationID AND
							CalleeSvcId NOT IN ( select CalleeSvcId
												from @tblServiceDependency )
				end											
			else
				begin
					insert into @tblStack
						select CallerSvcId, @nCurrDepth+1
						from @tblNewDependency
						where CallerSvcId <> @nOrchestrationID AND
							CallerSvcId NOT IN ( select CallerSvcId
												from @tblServiceDependency )
				end											

			-- Aggregate all new dependencies found into @tblServiceDependency
			insert into @tblServiceDependency
				select CallerSvcId, CalleeSvcId, CallType, Depth
				from @tblNewDependency
		end

		-- Reset @tblNewDependency
		delete from @tblNewDependency

		-- Get new stack size		
		select @nStackSize = count(*) from @tblStack
	end

	return
END
GO

CREATE PROCEDURE [dbo].[adm_ReceiveLocationOrchestration_Load]
@RcvLocName nvarchar(256),
@OrchestrationName nvarchar(256),
@OrchestrationAssemblyName nvarchar(256),
@OrchestrationAssemblyVersion nvarchar(256),
@OrchestrationAssemblyCulture nvarchar(256),
@OrchestrationAssemblyPKToken nvarchar(256)
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	select @ErrCode = 0

	select
		rl.Name,
		orch.nvcFullName,
		asm.nvcName,
		asm.nvcVersion,
		asm.nvcCulture,
		asm.nvcPublicKeyToken,
		rl.InboundTransportURL,
		adapter.Name,
		transpHost.Name,
		bts_pipeline.FullyQualifiedName, --@ReceiveServiceName 
		lrp.nvcName, --@ReceivePortName
		rl.Disabled,
		rl.IsPrimary,
		svcHost.Name,
		case	-- Mapping deployment state to admin WMI state
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) > 0) then 1	-- eSvcStatusUnbound
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) = 0) then 2	-- eSvcStatusBound
			when orch.nOrchestrationStatus = 2 then 3		-- eSvcStatusEnlisted
			when orch.nOrchestrationStatus = 3 then 4		-- eSvcStatusStarted
		end,
		case
			when orch.dtModified > rl.DateModified then orch.dtModified
			else rl.DateModified
		end
	from
		bts_assembly asm,
		bts_orchestration orch left outer join adm_Host svcHost on orch.nAdminHostID = svcHost.Id
		join bts_orchestration_port svcPort on orch.nID = svcPort.nOrchestrationID
		join bts_orchestration_port_binding portBinding on svcPort.nID = portBinding.nOrcPortID
		join bts_receiveport lrp on portBinding.nReceivePortID = lrp.nID
		join adm_ReceiveLocation rl on 	lrp.nID = rl.ReceivePortId
		left outer join adm_ReceiveHandler rh on rh.Id = rl.ReceiveHandlerId
		left outer join adm_Host transpHost on rh.HostId = transpHost.Id,
		adm_Adapter adapter,
		bts_pipeline
	where
		orch.nAssemblyID = asm.nID AND
		orch.nvcFullName = @OrchestrationName AND
		adapter.Id = rl.AdapterId AND
		rl.ReceivePipelineId = bts_pipeline.Id AND
		asm.nvcName = @OrchestrationAssemblyName AND
		asm.nvcVersion = @OrchestrationAssemblyVersion AND
		asm.nvcCulture = @OrchestrationAssemblyCulture AND
		asm.nvcPublicKeyToken = @OrchestrationAssemblyPKToken AND
		rl.Name = @RcvLocName

	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
	if ( @ErrCode <> 0 ) goto exit_proc


exit_proc:
	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_ReceiveLocationOrchestration_Load] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_ReceiveLocationOrchestration_Load] TO BTS_OPERATORS
GO
CREATE PROCEDURE [dbo].[adm_ReceiveLocationOrchestration_Enum]
AS
	set nocount on
	set xact_abort on

	declare @ErrCode as int
	select @ErrCode = 0

	select
		rl.Name,
		orch.nvcFullName,
		asm.nvcName,
		asm.nvcVersion,
		asm.nvcCulture,
		asm.nvcPublicKeyToken,
		rl.InboundTransportURL,
		adapter.Name,
		transpHost.Name,
		bts_pipeline.FullyQualifiedName, --@ReceiveServiceName 
		lrp.nvcName, --@ReceivePortName
		rl.Disabled,
		rl.IsPrimary,
		svcHost.Name,
		case	-- Mapping deployment state to admin WMI state
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) > 0) then 1	-- eSvcStatusUnbound
			when (orch.nOrchestrationStatus = 1 AND dbo.bts_OrchestrationBindingComplete(orch.nID) = 0) then 2	-- eSvcStatusBound
			when orch.nOrchestrationStatus = 2 then 3		-- eSvcStatusEnlisted
			when orch.nOrchestrationStatus = 3 then 4		-- eSvcStatusStarted
		end,
		case
			when orch.dtModified > rl.DateModified then orch.dtModified
			else rl.DateModified
		end
	from
		bts_assembly asm,
		bts_orchestration orch left outer join adm_Host svcHost on orch.nAdminHostID = svcHost.Id
		join bts_orchestration_port svcPort on orch.nID = svcPort.nOrchestrationID
		join bts_orchestration_port_binding portBinding on svcPort.nID = portBinding.nOrcPortID
		join bts_receiveport lrp on portBinding.nReceivePortID = lrp.nID
		join adm_ReceiveLocation rl on 	lrp.nID = rl.ReceivePortId
		left outer join adm_ReceiveHandler rh on rh.Id = rl.ReceiveHandlerId
		left outer join adm_Host transpHost on rh.HostId = transpHost.Id,
		adm_Adapter adapter,
		bts_pipeline
	where
		orch.nAssemblyID = asm.nID AND
		adapter.Id = rl.AdapterId AND
		rl.ReceivePipelineId = bts_pipeline.Id
		
exit_proc:
	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_ReceiveLocationOrchestration_Enum] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_ReceiveLocationOrchestration_Enum] TO BTS_OPERATORS
GO

--/====================================================/--
--/========== Admin Utility Stored Functions ==========/--
--/====================================================/--

CREATE FUNCTION [dbo].[adm_CheckRowCount] (@rowCount int)
RETURNS int
AS
BEGIN
	return
		case
			when @rowCount = 1 then 0			-- OKAY
			when @rowCount = 0 then 0xC0C02537	-- CIS_E_ADMIN_CORE_FAILED_INSTANCE_NOT_FOUND
			when @rowCount > 1 then 0xC0C02538	-- CIS_E_ADMIN_CORE_FAILED_TOO_MANY_INSTANCES_FOUND
		end
END
GO

CREATE FUNCTION [dbo].[adm_GetNumMisconfiguredRL] (@ServiceGUID uniqueidentifier)
RETURNS int
AS
BEGIN
	return
		(select
			count(*)
		from
			bts_orchestration svc,
			bts_orchestration_port svcPort,
			bts_orchestration_port_binding portBinding,
			bts_receiveport lrp,
			adm_ReceiveLocation rl,
			adm_ReceiveHandler rh
		where
			svc.uidGUID = @ServiceGUID AND
			svc.nID = svcPort.nOrchestrationID AND
			svcPort.nID = portBinding.nOrcPortID AND
			portBinding.nReceivePortID = lrp.nID AND
			lrp.nID = rl.ReceivePortId AND
			rl.ReceiveHandlerId IS NULL)	-- RL is not associated with any receive handler
END
GO

-- calculate number of conflicts. It is always two times more than number of actual conflicts, since
-- Host1 <-> Host2 conflict, it is counted separately from Host2 <-> Host1 conflict
CREATE FUNCTION [dbo].[adm_GetNumTransportConflictsInOrg] ()
RETURNS int
AS
BEGIN
	return
	(
		select count(*)
		from
			adm_Adapter,
			adm_Server,
			adm_Server2HostMapping as Map1,
			adm_Server2HostMapping as Map2,
			adm_Host as Host1,
			adm_Host as Host2,
			adm_ReceiveHandler as RcvHandler1,
			adm_ReceiveHandler as RcvHandler2
		where
			-- adapter has constraint
			(adm_Adapter.Capabilities & 4) <> 0-- eProtocolRequireSingleInstancePerServer
			-- instance of Host1 exists on a Server
			AND Map1.HostId = Host1.Id
			AND Map1.ServerId = adm_Server.Id
			AND Map1.IsMapped <> 0
			-- receive handler exists for the Host1
			AND RcvHandler1.HostId = Host1.Id
			AND RcvHandler1.AdapterId = adm_Adapter.Id
			-- instance of Host2 exists on a Server
			AND Map2.HostId = Host2.Id
			AND Map2.ServerId = adm_Server.Id
			AND Map2.IsMapped <> 0
			-- receive handler exists for the Host2
			AND RcvHandler2.HostId = Host2.Id
			AND RcvHandler2.AdapterId = adm_Adapter.Id
			-- hosts are different
			AND Host1.Id <> Host2.Id
	) + (
		select count(*)
		from
			adm_Adapter,
			adm_Server,
			adm_Server2HostMapping as Map1,
			adm_Server2HostMapping as Map2,
			adm_Host as Host1,
			adm_Host as Host2,
			adm_SendHandler as SendHandler1,
			adm_SendHandler as SendHandler2
		where
			-- adapter has constraint
			(adm_Adapter.Capabilities & 4) <> 0-- eProtocolRequireSingleInstancePerServer
			-- instance of Host1 exists on a Server
			AND Map1.HostId = Host1.Id
			AND Map1.ServerId = adm_Server.Id
			AND Map1.IsMapped <> 0
			-- receive handler exists for the Host1
			AND SendHandler1.HostId = Host1.Id
			AND SendHandler1.AdapterId = adm_Adapter.Id
			-- instance of Host2 exists on a Server
			AND Map2.HostId = Host2.Id
			AND Map2.ServerId = adm_Server.Id
			AND Map2.IsMapped <> 0
			-- receive handler exists for the Host2
			AND SendHandler2.HostId = Host2.Id
			AND SendHandler2.AdapterId = adm_Adapter.Id
			-- hosts are different
			AND Host1.Id <> Host2.Id
	)
END
GO

CREATE FUNCTION [dbo].[adm_GetNumInstalledHostInstances] (@HostName nvarchar(80))
RETURNS int
AS
BEGIN
    return
        (select count(*)
         from adm_Host host, adm_Server2HostMapping mapping, adm_HostInstance inst
         where host.Name = @HostName
            AND host.Id = mapping.HostId
            AND mapping.Id = inst.Svr2HostMappingId
            AND inst.ConfigurationState = 1   -- counting only the INSTALLED ones
        )
END
GO


--/=====================================================/--
--/========== Admin Utility Stored Procedures ==========/--
--/=====================================================/--

--// adm_AcquireAppLock //--
CREATE PROCEDURE [dbo].[adm_AcquireAppLock]
@ResourceName nvarchar(255),
@WaitForLock int
AS
	set nocount on

	declare @LockResult as int, @TimeOut as int
	select @LockResult = 0, @TimeOut = @@LOCK_TIMEOUT

	if ( @WaitForLock = 0 )
	begin
		-- Set @TimeOut value so that lock request that cannot be granted immediately
		-- should return right away
		set @TimeOut = 0
	end

	-- Acquire applock using input ResourceName
	exec @LockResult = sp_getapplock @ResourceName, 'Exclusive', 'Transaction', @TimeOut

	-- return the lock result back
	select @LockResult

	set nocount off
GO
GRANT EXEC ON [dbo].[adm_AcquireAppLock] TO BTS_ADMIN_USERS
GO

CREATE PROCEDURE [dbo].[adm_ServiceInfo_Lookup]
@Name nvarchar(256),
@AssemblyName nvarchar(256),
@AssemblyVersion nvarchar(256),
@AssemblyCulture nvarchar(256),
@AssemblyPKToken nvarchar(256)
AS

	set nocount on
	set xact_abort on

	declare @ErrCode as int
	set @ErrCode = 0

	select
		svcCls.UniqueId,
		orch.uidGUID,
		asm.nvcFullName,
		grp.Name
	from
		bts_assembly asm,
		bts_orchestration orch,
		adm_ServiceClass svcCls,
		adm_Group grp
	where
		orch.nAssemblyID = asm.nID AND
		orch.nvcFullName = @Name AND
		asm.nvcName = @AssemblyName AND
		asm.nvcVersion = @AssemblyVersion AND
		asm.nvcCulture = @AssemblyCulture AND
		asm.nvcPublicKeyToken = @AssemblyPKToken AND
		svcCls.Name = N'XLANG/s'

	-- Give more specific error code.  If no record is found, then the service has not
	-- been deployed and/or enlisted.  If more than one record are found, this cannot
	-- happen.  But just return the regular error code in that case.
	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)

	set nocount off
	return @ErrCode	
GO
GRANT EXEC ON [dbo].[adm_ServiceInfo_Lookup] TO BTS_ADMIN_USERS
GO
GRANT EXEC ON [dbo].[adm_ServiceInfo_Lookup] TO BTS_OPERATORS
GO

--CREATE PROCEDURE adm_util_MasterSubDB_Lookup
--@MsgBoxDBServerName nvarchar(63),
--@MsgBoxDBName nvarchar(128)
--AS
--	set nocount on
--	set xact_abort on
--
--	declare @ErrCode as int
--	set @ErrCode = 0
--
--	select
--		grp.MasterSubDBServerName,
--		grp.MasterSubDBName
--	from
--		adm_MessageBox msgbox,
--		adm_Group grp
--	where
--		msgbox.DBServerName = @MsgBoxDBServerName and
--		msgbox.DBName = @MsgBoxDBName and
--		msgbox.GroupId = grp.Id
--
--	-- there must be one and only one matching adm_MessageBox record
--	set @ErrCode = dbo.adm_CheckRowCount(@@ROWCOUNT)
--
--	set nocount off
--	return @ErrCode	
--GO


--/==================================/--
--/===== Security related setup =====/--
--/==================================/--

-- BTS_HOST_USERS needs BAM_CONFIG_READER for TDDS to read from MgmtDb
EXEC sp_addrolemember BAM_CONFIG_READER, BTS_HOST_USERS

-- Make BTS_ADMIN_USERS a member of BTS_HOST_USERS in MsgboxDb
EXEC sp_addrolemember BTS_HOST_USERS, BTS_ADMIN_USERS

GO	


--/===================================/--
--/===== Backup processing logic =====/--
--/===================================/--


--///////////////////////////////////////////////////////////////////////////
--// Remove backup procs that may have been added as part of a QFE
--// The sp_removesprocs won't remove these procs because when it is called
--// it is still the RTM version which doesn't have drop statements for 
--// procs added post RTM (QFE) but before SP1
--// This can be removed post SP1 as the SP1 sp_removesprocs will drop these procs
	
	if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_MarkAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_MarkAll]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull_Schedule]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BackupAllFull_Schedule]

	if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BackupAllFull]

	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull_Schedule]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_BackupAllFull_Schedule]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BackupAllFull]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_BackupAllFull]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BuildFullBackupString]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_BuildFullBackupString]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_MarkAll]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_MarkAll]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BlockTDDS]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BlockTDDS]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BuildLogMarkString]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BuildLogMarkString]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_BuildLogBackupString]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		drop procedure [dbo].[sp_BuildLogBackupString]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_ForceFullBackup]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_ForceFullBackup]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_ReleaseBackupWriterLock]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_ReleaseBackupWriterLock]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_AcquireBackupWriterLock]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_AcquireBackupWriterLock]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetLinkedServerQTimeout]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetLinkedServerQTimeout]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetNextBackupSetId]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetNextBackupSetId]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetFileNameFromFilePath]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetFileNameFromFilePath]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_DeleteBackupHistory]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_DeleteBackupHistory]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetBackupHistory]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetBackupHistory]
	
	IF exists (select * from sysobjects where id = object_id(N'[dbo].[sp_GetBackupDatabasesForServer]' ) AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetBackupDatabasesForServer]
	
	IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[sp_GetRemoteServerName]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
		DROP PROCEDURE [dbo].[sp_GetRemoteServerName]
GO

/**************************************************************************************************
	Create the BTS_BACKUP role
	This role will get exec permissions on all backup related procs
	No users are added to this role, this is a manual post configuration step
**************************************************************************************************/
declare @ret int, @Error int

if not exists( select 1 from dbo.sysusers where name=N'BTS_BACKUP_USERS' and issqlrole=1 )
 begin

	exec @ret = sp_addrole N'BTS_BACKUP_USERS'

 end
GO

/**************************************************************************************************
	Create the sp_GetRemoteServerName proc
	This proc resolves the server named used to connected to a server ("server1,5000")
	to the actual server name as returned by serverproperty('servername')->("server1")
**************************************************************************************************/

CREATE PROCEDURE [dbo].[sp_GetRemoteServerName] @ServerName nvarchar(256)
						,@DatabaseName sysname
						,@RemoteServerName sysname OUTPUT
AS
 BEGIN
	
	SET NOCOUNT ON

	DECLARE @real_name sysname
	DECLARE @stmt nvarchar(512)

	IF @ServerName IS NULL OR @DatabaseName IS NULL
		RETURN -1

	SELECT @ServerName = replace( @ServerName, '''', '''''' ), @DatabaseName = replace( @DatabaseName, '''', '''''' )
	
	set @stmt = N'[' + @ServerName + N'].[' + @DatabaseName + N'].[dbo].[sp_GetServerName]'
	
	exec @stmt @name=@real_name output
	
	
	IF @real_name IS NULL
		RETURN -1

	SET @RemoteServerName = @real_name

	RETURN 0		
	
 END
GO

GRANT EXECUTE ON [dbo].[sp_GetRemoteServerName] TO BTS_BACKUP_USERS
GO


CREATE PROCEDURE [dbo].[sp_GetLinkedServerQTimeout]	@server sysname
AS
BEGIN
	set nocount on

	
	DECLARE @timeout int
	
	SELECT	@timeout = querytimeout
	FROM	master.dbo.sysservers
	WHERE	srvname=@server
	
	IF @timeout > 0
		GOTO DONE
	
	IF OBJECT_ID( 'tempdb..#temp' ) IS NOT NULL
		DROP TABLE #temp
	
	CREATE TABLE #temp
	(
		[name]			nvarchar(70)
		,minimum		int
		,maximum		int
		,config_value	int -- what has been set
		,run_value		int -- what is actually currently being used by the system
	)
	
	INSERT #temp EXEC sp_configure 'query timeout' 
	
	SELECT	@timeout = run_value
	FROM	#temp
	
	IF @timeout IS NULL OR @timeout < 0
		GOTO ERROR
	ELSE
		GOTO DONE
	
	ERROR:
		SET @timeout = -1
	
	DONE:
		IF OBJECT_ID( 'tempdb..#temp' ) IS NOT NULL
			DROP TABLE #temp
	
		RETURN @timeout
END

GRANT EXECUTE ON [dbo].[sp_GetLinkedServerQTimeout] TO BTS_BACKUP_USERS
GO


CREATE PROCEDURE [dbo].[sp_GetNextBackupSetId]
AS
 BEGIN
	set nocount on

	DECLARE @id 		bigint
		,@local_tran 	bit
		,@ret 		int
		,@error		int
		,@rowcount	int


	IF @@TRANCOUNT > 0
		SET @local_tran = 0
	ELSE
	 BEGIN
		BEGIN TRANSACTION
		SET @local_tran = 1
	 END

	IF ( SELECT COUNT([NextBackupSetId]) FROM [dbo].[adm_BackupSetId] ) > 1
		GOTO FAILED

	SELECT 	@id = [NextBackupSetId]
	FROM	[dbo].[adm_BackupSetId]	

	IF @id IS NULL OR @id <=0
		GOTO FAILED

	UPDATE [dbo].[adm_BackupSetId] SET [NextBackupSetId] = @id + 1

	SELECT 	@error = @@ERROR
		,@rowcount = @@ROWCOUNT

	IF @rowcount <> 1 OR @error <> 0
		GOTO FAILED

	IF @local_tran = 1
		COMMIT TRANSACTION

	SET @ret = @id
	GOTO DONE


FAILED:
	IF @local_tran > 0
		ROLLBACK TRANSACTION

	SET @ret = -1
	
	GOTO DONE


DONE:	
	RETURN @ret
 END
GO

GRANT EXECUTE ON [dbo].[sp_GetNextBackupSetId] TO BTS_BACKUP_USERS
GO

CREATE PROCEDURE [dbo].[sp_GetFileNameFromFilePath] @FilePath nvarchar(2000), @Name nvarchar(500) OUTPUT, @Location nvarchar(1500) OUTPUT
AS
 BEGIN
	set nocount on

	DECLARE @pos	int
	
	IF @FilePath IS NULL OR len( @FilePath ) = 0
		RETURN -1

	SELECT @pos = len( @FilePath )
	
	WHILE @pos > 0
	 BEGIN
		IF N'\' = substring( @FilePath, @pos, 1 )
			BREAK
	
		SET @pos = @pos - 1
	 END

	IF @pos = 0
		RETURN -1
	
	SELECT @Name = substring( @FilePath, @pos+1, len( @FilePath ) - @pos + 1 )
	SELECT @Location = substring( @FilePath, 0, @pos )

	RETURN 0

 END
GO

GRANT EXECUTE ON [dbo].[sp_GetFileNameFromFilePath] TO BTS_BACKUP_USERS
GO


CREATE PROCEDURE [dbo].[sp_GetBackupDatabasesForServer]
@ServerName sysname = null
AS
	set transaction isolation level read committed
	set deadlock_priority low
	set nocount on

	SELECT ServerName, DatabaseName FROM admv_BackupDatabases
	WHERE @ServerName IS NULL OR (ServerName = @ServerName)
GO

GRANT EXECUTE ON [dbo].[sp_GetBackupDatabasesForServer] TO BTS_BACKUP_USERS
GO


CREATE PROCEDURE [dbo].[sp_GetBackupHistory] @LastBackupSetId bigint = NULL
AS
 BEGIN
	SET NOCOUNT ON

	declare @ret int
	/*
		Reader/writer conflict:
		Reader - Don't want to read records from sets that aren't finished writing
		but can't use a transaction to block readers because the "writing" - backing up a db - 
		can't be rolled back so the write to this table isn't rolled back.  
		Implementation - Use a table to hold the state of the writer and don't read while writing

		Writer - Don't want to start writing records while reader is reading and introduce a partial set
		to their read.
	*/

	exec @ret = sp_AcquireBackupWriterLock
	if (@ret < 0)
	BEGIN
		return @ret
	END

	IF @LastBackupSetId IS NULL
		SELECT @LastBackupSetId = -1

	SELECT		[BackupId]
			,[BackupSetId]
			,[MarkName]
			,[DatabaseName]
			,[ServerName]
			,[BackupFileName]
			,[BackupFileLocation]
			,[BackupType]
			,[BackupDateTime]
			,[SetComplete]
	FROM		[dbo].[adm_BackupHistory]
	WHERE		[BackupSetId] > @LastBackupSetId
	ORDER BY 	[BackupSetId]

	exec @ret = sp_ReleaseBackupWriterLock

	RETURN 0

 END
GO

GRANT EXECUTE ON [dbo].[sp_GetBackupHistory] TO BTS_BACKUP_USERS
GO


CREATE PROCEDURE [dbo].[sp_DeleteBackupHistory] @DaysToKeep smallint = null
AS
 BEGIN
	set nocount on

	IF @DaysToKeep IS NULL OR @DaysToKeep <= 0
		RETURN
	/*
		Only delete full sets
		If a set spans a day such that some items fall into the deleted group and the other don't don't delete the set
	*/
	DELETE [dbo].[adm_BackupHistory] 
	WHERE 	datediff( dd, [BackupDateTime], getdate() ) >= @DaysToKeep
	AND	[BackupSetId] NOT IN ( SELECT [BackupSetId] FROM [dbo].[adm_BackupHistory] [h2] WHERE [h2].[BackupSetId] = [BackupSetId] AND datediff( dd, [h2].[BackupDateTime], getdate() ) < @DaysToKeep )


 END
GO

GRANT EXECUTE ON [dbo].[sp_DeleteBackupHistory] TO BTS_BACKUP_USERS
GO



CREATE PROCEDURE [dbo].[sp_AcquireBackupWriterLock]
AS
 BEGIN
	set nocount on
	declare @ret int

	exec @ret = sp_getapplock  'BTS_BackupJob_Lock', 'Exclusive', 'Session'

	return @ret
 END
GO

GRANT EXECUTE ON [dbo].[sp_AcquireBackupWriterLock] TO BTS_BACKUP_USERS
GO



CREATE PROCEDURE [dbo].[sp_ReleaseBackupWriterLock]
AS
 BEGIN
	set nocount on
	declare @ret int

	exec @ret = sp_releaseapplock 'BTS_BackupJob_Lock', 'Session'
	return @ret
 END
GO

GRANT EXECUTE ON [dbo].[sp_ReleaseBackupWriterLock] TO BTS_BACKUP_USERS
GO



CREATE PROCEDURE [dbo].[sp_ForceFullBackup]
AS
 BEGIN
	set nocount on

	IF EXISTS (	SELECT	1
			FROM	[dbo].[adm_ForceFullBackup] )
	 BEGIN
		UPDATE	[dbo].[adm_ForceFullBackup] 
		SET	[ForceFull] = 1

		IF @@ERROR <> 0
			RETURN -1
		ELSE
			RETURN 0
	 END
	ELSE
	 BEGIN
		INSERT	[dbo].[adm_ForceFullBackup] (
			[ForceFull]
		) VALUES (
			1
		)
	
		IF @@ERROR <> 0
			RETURN -1
		ELSE
			RETURN 0
	 END
 END
GO

GRANT EXECUTE ON [dbo].[sp_ForceFullBackup] TO BTS_BACKUP_USERS
GO

CREATE PROCEDURE [dbo].[sp_GetBackupDatabaseLocation]
@DefaultDatabaseName nvarchar(128)
AS
	SELECT ServerName, DatabaseName FROM adm_OtherBackupDatabases
	WHERE DefaultDatabaseName = @DefaultDatabaseName
GO

GRANT EXECUTE ON [dbo].[sp_GetBackupDatabaseLocation] TO BTS_OPERATORS
GRANT EXECUTE ON [dbo].[sp_GetBackupDatabaseLocation] TO BTS_ADMIN_USERS
GO

/**************************************************************************************************
	Create the sp_BlockTDDS stored proc
	This proc blocks TDDS
**************************************************************************************************/

CREATE PROCEDURE [dbo].[sp_BlockTDDS]
AS
BEGIN

	set nocount on

	declare @ServerName sysname, @DBName sysname, @tsql nvarchar(1024)

	SELECT @ServerName = TrackingDBServerName, @DBName = TrackingDBName FROM [dbo].[adm_Group] 
	WHERE TrackingDBServerName IS NOT NULL AND TrackingDBServerName != '' 

	if ( (@ServerName IS NOT NULL) AND (@DBName IS NOT NULL) )
	BEGIN
		set @tsql = '[' + @ServerName + N'].[' + @DBName + N'].[dbo].[TDDS_BlockTDDS] '
		exec (@tsql)		
	END

	return 0

END
GO

CREATE PROCEDURE [dbo].[sp_BuildFullMarkName]
@MarkName nvarchar(8), 
@TimeStamp datetime = NULL, 
@FullMarkName nvarchar(32) OUTPUT
AS
BEGIN
	declare @date_string nvarchar(128)

	if @TimeStamp is null
		select @TimeStamp = getutcdate()

	select @date_string = convert( nvarchar, @TimeStamp, 121 )
	select @FullMarkName = @MarkName + N'_' + @date_string
	/*
		Scrub @FullMarkName
	*/
	select @FullMarkName = replace( @FullMarkName, ' ', '_' )
	select @FullMarkName = replace( @FullMarkName, '~', '_' )
	select @FullMarkName = replace( @FullMarkName, '!', '_' )
	select @FullMarkName = replace( @FullMarkName, '@', '_' )
	select @FullMarkName = replace( @FullMarkName, '#', '_' )
	select @FullMarkName = replace( @FullMarkName, '$', '_' )
	select @FullMarkName = replace( @FullMarkName, '%', '_' )
	select @FullMarkName = replace( @FullMarkName, '^', '_' )
	select @FullMarkName = replace( @FullMarkName, '&', '_' )
	select @FullMarkName = replace( @FullMarkName, '*', '_' )
	select @FullMarkName = replace( @FullMarkName, '(', '_' )
	select @FullMarkName = replace( @FullMarkName, ')', '_' )
	select @FullMarkName = replace( @FullMarkName, '-', '_' )
	select @FullMarkName = replace( @FullMarkName, '+', '_' )
	select @FullMarkName = replace( @FullMarkName, '+', '_' )
	select @FullMarkName = replace( @FullMarkName, '{', '_' )
	select @FullMarkName = replace( @FullMarkName, '[', '_' )
	select @FullMarkName = replace( @FullMarkName, '}', '_' )
	select @FullMarkName = replace( @FullMarkName, '}', '_' )
	select @FullMarkName = replace( @FullMarkName, '|', '_' )
	select @FullMarkName = replace( @FullMarkName, '\', '_' )
	select @FullMarkName = replace( @FullMarkName, ':', '_' )
	select @FullMarkName = replace( @FullMarkName, ';', '_' )
	select @FullMarkName = replace( @FullMarkName, '''', '' )
	select @FullMarkName = replace( @FullMarkName, '"', '' )
	select @FullMarkName = replace( @FullMarkName, '<', '_' )
	select @FullMarkName = replace( @FullMarkName, '>', '_' )
	select @FullMarkName = replace( @FullMarkName, ',', '_' )
	select @FullMarkName = replace( @FullMarkName, '.', '_' )
	select @FullMarkName = replace( @FullMarkName, '/', '_' )
END
GO
grant execute on [dbo].[sp_BuildFullMarkName] to BTS_BACKUP_USERS
go



/**************************************************************************************************
	Create the sp_MarkBTSLogs stored proc
	This proc blocks the TDDS process and actually marks the logs. We separated it out so UBS 
	could call it directly cause they wanted to use a different backup technology
**************************************************************************************************/
CREATE PROCEDURE [dbo].[sp_MarkBTSLogs]		@MarkName nvarchar(32)
AS
 BEGIN

	SET NOCOUNT ON

	DECLARE @BackupServer sysname, @BackupDB sysname, @RealServerName sysname, @LastServer sysname
		,@ret int ,@error int ,@errorDesc nvarchar(128), @tsql nvarchar(1024)


	declare @localized_string_sp_MarkBTSLogs_Failed_sp_GetRemoteServerNameFailed nvarchar(128)
	set @localized_string_sp_MarkBTSLogs_Failed_sp_GetRemoteServerNameFailed = N'sp_GetRemoteServerName failed to resolve server name %s'

	declare @localized_string_sp_MarkBTSLogs_Failed_Setting_Mark nvarchar(128)
	set @localized_string_sp_MarkBTSLogs_Failed_Setting_Mark = N'Failed running the marking proc on %s'


	/*
		IMPORTANT!!
		The with mark syntax can only be executed once per server (not database) for 
		a given transaction without generating a warning.  The warning flags @@error.  In order to
		avoid these warnings we do 2 things:
			1. Use 2 stored proc to do the markings - sp_SetMark and sp_SetMarkRemote 
			   The Remote version uses the with mark syntax.
			2. Group by the ServerName so we don't get too many servers to connect to.
	*/
	
	/* 
	    In order to handle connecting to the same server using different naming conventions (like port name and such)
		we need to actually go to each server and resolve the name we have to the actual name of the server. This will prevent
		the issue desribed above
	*/

	CREATE TABLE #BackupDBs_MarkBTSLogs (ServerName sysname, DatabaseName sysname, RealServerName sysname)

	DECLARE BackupDB_Cursor insensitive cursor for
	SELECT	ServerName, DatabaseName
	FROM	admv_BackupDatabases
	ORDER BY ServerName
	
	open BackupDB_Cursor

	fetch next from BackupDB_Cursor into @BackupServer, @BackupDB

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		/*
			Get the real name of the server 
			This resolves names like "BTSDbServerName,5000" (or a client server name alias)
			to "BTSDbServerName" (server name as returned by serverproperty('servername'))
		*/
		EXEC @ret = sp_GetRemoteServerName @ServerName = @BackupServer, @DatabaseName = @BackupDB, @RemoteServerName = @RealServerName OUTPUT
	
		IF @@ERROR <> 0 OR @ret IS NULL OR @ret <> 0 OR @RealServerName IS NULL OR len(@RealServerName) <= 0
		 BEGIN
			SET @errorDesc = replace( @localized_string_sp_MarkBTSLogs_Failed_sp_GetRemoteServerNameFailed, N'%s', @BackupServer )
			RAISERROR( @errorDesc, 16, -1 )
			GOTO FAILED
		 END

		INSERT INTO #BackupDBs_MarkBTSLogs (ServerName, DatabaseName, RealServerName) VALUES (@BackupServer, @BackupDB, @RealServerName)
		fetch next from BackupDB_Cursor into @BackupServer, @BackupDB
	END

	close BackupDB_Cursor
	deallocate BackupDB_Cursor

	/* now cursor over the above list and actually mark the logs */

	DECLARE BackupDB_Cursor insensitive cursor for
	SELECT	ServerName, DatabaseName, RealServerName
	FROM	#BackupDBs_MarkBTSLogs
	ORDER BY RealServerName
	
	BEGIN TRANSACTION @MarkName WITH MARK @MarkName

	--First Block TDDS
	exec sp_BlockTDDS

	open BackupDB_Cursor 
	
	fetch next from BackupDB_Cursor into @BackupServer, @BackupDB, @RealServerName
	WHILE (@@FETCH_STATUS = 0)
	BEGIN

		if ( (@RealServerName = CAST(SERVERPROPERTY('servername') as sysname)) OR (@RealServerName = @LastServer) )
		BEGIN
			--we already marked this so don't use the with mark syntax
			set @tsql = '[' + @BackupServer + '].[' + @BackupDB + '].[dbo].[sp_SetMark]'			
		END
		ELSE
		BEGIN
			set @tsql = '[' + @BackupServer + '].[' + @BackupDB + '].[dbo].[sp_SetMarkRemote]'
		END
     
		exec @ret = @tsql @MarkName
		select @error = @@ERROR   
		if @error <> 0 or @ret IS NULL or @ret <> 0
		begin
		     	select @errorDesc = replace( @localized_string_sp_MarkBTSLogs_Failed_Setting_Mark, '%s', @BackupServer + N'.' + @BackupDB )
			goto FAILED     
		end   
	
		set @LastServer = @RealServerName
		fetch next from BackupDB_Cursor into @BackupServer, @BackupDB, @RealServerName

	END

	close BackupDB_Cursor
	deallocate BackupDB_Cursor

	COMMIT TRANSACTION

	goto DONE

FAILED:	

	set @ret = -1
	raiserror( @errorDesc, 16, -1 )
	
	goto DONE


DONE:	
	return @ret
END
GO

/**************************************************************************************************
	Create the sp_MarkAll stored proc
	This proc marks and performs a log backup on all BTS databases
**************************************************************************************************/
CREATE PROCEDURE [dbo].[sp_MarkAll] @MarkName nvarchar(8), @BackupPath nvarchar(128)
AS
 begin

	set nocount on
	set xact_abort on

	declare @localized_string_sp_MarkAll_Failed_Executing_GetNextBackupSetId nvarchar(128)
	set @localized_string_sp_MarkAll_Failed_Executing_GetNextBackupSetId = N'Failed running sp_GetNextBackupSetId'

	declare @localized_string_sp_MarkAll_Failed_Executing_Backup nvarchar(128)
	set @localized_string_sp_MarkAll_Failed_Executing_Backup = N'Failed backing up the databases'

	declare @localized_string_sp_MarkAll_Failed_Executing_GetFileName nvarchar(128)
	set @localized_string_sp_MarkAll_Failed_Executing_GetFileName = N'Failed running sp_GetFileNameFromFilePath'

	declare @localized_string_sp_MarkAll_Timeout_Exceeded nvarchar(256)
	set @localized_string_sp_MarkAll_Timeout_Exceeded = N'Warning: A Remote Query Timeout may have occurred'

	declare @localized_string_sp_MarkAll_Failed_Log_Backup nvarchar(128)
	set @localized_string_sp_MarkAll_Failed_Log_Backup = N'Failed running the log backup on %s'

	declare @localized_string_sp_MarkAll_Failed_MarkBTSLogs nvarchar(128)
	set @localized_string_sp_MarkAll_Failed_MarkBTSLogs = N'sp_MarkAll failed running sp_MarkBTSLogs'


	declare  @ret int ,@error int ,@errorDesc nvarchar(128)
		,@DbCount int ,@BackupSetId bigint ,@FullMarkName nvarchar(32)
		,@BackupServer sysname ,@BackupDB sysname, @TimeStamp datetime
		,@tsql nvarchar(1024)

	set @TimeStamp = GetUTCDate()

	/*
		Get the backup set id
		Don't need to roll this back if we fail - we'll just skip that value
	*/
	exec @BackupSetId = [dbo].[sp_GetNextBackupSetId]

	if @BackupSetId = -1
	 begin
		select @errorDesc = @localized_string_sp_MarkAll_Failed_Executing_GetNextBackupSetId
		goto FAILED
	 end

	SET @DbCount = 0
	exec [dbo].[sp_BuildFullMarkName] @MarkName, @TimeStamp, @FullMarkName OUTPUT

	exec @ret = sp_AcquireBackupWriterLock

	exec @ret = sp_MarkBTSLogs @FullMarkName

	IF @@ERROR <> 0 OR @ret IS NULL OR @ret <> 0
	 BEGIN
		SET @errorDesc = @localized_string_sp_MarkAll_Failed_MarkBTSLogs
		GOTO FAILED
	 END

	
	/*
		Block any log shipping destination readers while history records for the set are written
		This isn't done in a transaction so that errors can be "shown" so an alternative method of blocking
		readers is needed.
	*/
	
	DECLARE BackupDB_Cursor insensitive cursor for
	SELECT	ServerName, DatabaseName
	FROM	admv_BackupDatabases
	ORDER BY ServerName

	open BackupDB_Cursor 
	
	fetch next from BackupDB_Cursor into @BackupServer, @BackupDB
	
	while @@fetch_status = 0
	 begin
		declare @rowcount int, @start datetime, @end datetime, @timeout int, @backup_loc nvarchar(4000), @filename nvarchar(500), @filelocation nvarchar(1500)

		set @start= getdate()    
 
		set @tsql = '[' + @BackupServer + '].[' + @BackupDB + '].[dbo].[sp_BackupBizTalkLog]'
		exec @ret = @tsql @seq=@FullMarkName, @path=@BackupPath, @BackupLocation=@backup_loc output     
		
		select @error = @@ERROR, @end=getdate()        
		if @error<>0 or @ret<>0 or @ret IS NULL      
		begin      
			exec @timeout=[dbo].[sp_GetLinkedServerQTimeout] @BackupServer
		
			if @timeout<=datediff(ss,@start,@end ) and @timeout != -1  
				print @localized_string_sp_MarkAll_Timeout_Exceeded    
			
			select @errorDesc = replace( @localized_string_sp_MarkAll_Failed_Log_Backup, '%s', @BackupServer + N'.' + @BackupDB )
			goto FAILED
		END      
		
		exec @ret = [dbo].[sp_GetFileNameFromFilePath] @FilePath = @backup_loc, @Name = @filename OUTPUT, @Location = @filelocation OUTPUT
		
		select @error = @@ERROR      
		if @error <> 0 or @ret IS NULL or @ret <> 0    
		begin     
			select @errorDesc = @localized_string_sp_MarkAll_Failed_Executing_GetFileName    
			goto FAILED     
		end        
		
		insert adm_BackupHistory(     BackupSetId     ,MarkName     ,DatabaseName    ,ServerName   ,BackupFileName     ,BackupFileLocation     ,BackupType     ,BackupDateTime    ) 
			values (     @BackupSetId     ,@FullMarkName     ,@BackupDB     ,@BackupServer  ,@filename     ,@BackupPath     ,'lg'     ,@TimeStamp    )         
		
		SET @DbCount = @DbCount + 1
		
		fetch next from BackupDB_Cursor into @BackupServer, @BackupDB
	 end
	
	close BackupDB_Cursor 
	deallocate BackupDB_Cursor 

	UPDATE	[dbo].[adm_BackupHistory]
	SET	[SetComplete] = 1
	WHERE	[BackupSetId] = @BackupSetId

	SELECT	@error		= @@ERROR
		,@rowcount	= @@ROWCOUNT

	IF @error <> 0 OR @rowcount <> @DbCount or @rowcount IS NULL
	BEGIN
		SET @errorDesc = @localized_string_sp_MarkAll_Failed_Executing_Backup
		GOTO FAILED
	END	

	goto DONE	

FAILED:	

	set @ret = -1
	raiserror( @errorDesc, 16, -1 )
	
	goto DONE


DONE:	
	/*
		Always attempt to release the writer lock
		Doesn't matter if we have it or not
	*/
	exec @ret = sp_ReleaseBackupWriterLock

	return @ret
end
GO

grant execute on [dbo].[sp_MarkAll] to BTS_BACKUP_USERS
go



/**************************************************************************************************
	Create the sp_BackupAllFull stored proc
	This proc performs a full backup on all BTS databases
**************************************************************************************************/

create procedure [dbo].[sp_BackupAllFull] @MarkName nvarchar(8), @BackupPath nvarchar(128), @TimeStamp datetime = NULL
as
 begin
	set nocount on
	set xact_abort on

	declare @localized_string_sp_BackupAllFull_Failed_Executing_GetNextBackupSetId nvarchar(128)
	set @localized_string_sp_BackupAllFull_Failed_Executing_GetNextBackupSetId = N'Failed running sp_GetNextBackupSetId'

	declare @localized_string_sp_BackupAllFull_Failed_Executing_Backup nvarchar(128)
	set @localized_string_sp_BackupAllFull_Failed_Executing_Backup = N'Failed backing up the databases'

	declare @localized_string_sp_BackupAllFull_Failed_Executing_GetFileName nvarchar(128)
	set @localized_string_sp_BackupAllFull_Failed_Executing_GetFileName = N'Failed running sp_GetFileNameFromFilePath'

	declare @localized_string_sp_BackupAllFull_Failed_Inserting_BackupHistory nvarchar(128)
	set @localized_string_sp_BackupAllFull_Failed_Inserting_BackupHistory = N'Failed inserting into adm_BackupHistory'

	declare @localized_string_sp_BackupAllFull_Failed_Backup nvarchar(128)
	set @localized_string_sp_BackupAllFull_Failed_Backup = N'Failed running the backup on %s'

	declare @localized_string_sp_BackupAllFull_Timeout_Exceeded nvarchar(256)
	set @localized_string_sp_BackupAllFull_Timeout_Exceeded = N'Warning: A Remote Query Timeout may have occurred'

	declare @localized_string_sp_BackupAllFull_sp_GetRemoteServerNameFailed nvarchar(128)
	set @localized_string_sp_BackupAllFull_sp_GetRemoteServerNameFailed = N'sp_GetRemoteServerName failed to resolve server name %s'

	declare  @ret int ,@error int ,@errorDesc nvarchar(256), @rowcount int
		,@DbCount int ,@BackupSetId bigint ,@FullMarkName nvarchar(32)
		,@BackupServer sysname ,@BackupDB sysname
		,@RealServerName sysname ,@backup_loc nvarchar(4000) ,@filelocation nvarchar(4000) ,@filename nvarchar(500) 
		,@tsql nvarchar(512)

	/*
		Get the backup set id
		Don't need to roll this back if we fail - we'll just skip that value
	*/
	exec @BackupSetId = [dbo].[sp_GetNextBackupSetId]

	if @BackupSetId = -1
	 begin
		select @errorDesc = @localized_string_sp_BackupAllFull_Failed_Executing_GetNextBackupSetId
		goto FAILED
	 end

	SET @DbCount = 0
	exec [dbo].[sp_BuildFullMarkName] @MarkName, @TimeStamp, @FullMarkName OUTPUT

	/*
		IMPORTANT NOTE!
		A transaction is not used around the set of inserts into adm_BackupHistory.
		This is because we must know if some backups succeeded and some failed (basically if 
		we have a complete set).  Because you can't rollback a backup action we don't want to 
		rollback that a backup action occurred.  If the set is complete (the number of rows for set
		in adm_BackupHistory matches the number of databases that we expect to back up then we update 
		adm_BackupHistory to indicate that the set is complete.

		The log shipping restore process depends on this functionality!  Do not change this non transactional
		logic without considering how it impacts the restore process under failure conditions.

		Block any log shipping destination readers while history records for the set are written
		This isn't done in a transaction so that errors can be "shown" so an alternative method of blocking
		readers is needed.
	*/

	exec @ret = [dbo].[sp_AcquireBackupWriterLock]

	declare BackupDB_Cursor insensitive cursor for
	select	ServerName, DatabaseName
	from	admv_BackupDatabases
	
	open BackupDB_Cursor 
	
	fetch next from BackupDB_Cursor into @BackupServer, @BackupDB
	
	while @@fetch_status = 0
	 begin
		
		--let's make sure we are linked to this server so that we can call the backup job on it
		exec bts_SafeAddLinkedServer @BackupServer

		set @tsql = '[' + @BackupServer + '].[' + @BackupDB + '].[dbo].[sp_BackupBizTalkFull]'  
		exec @ret = @tsql @seq=@FullMarkName, @path=@BackupPath, @BackupLocation=@backup_loc output      
		
		select @error = @@ERROR
		if @error <> 0 or @ret <> 0 or @ret IS NULL
		begin       
			select @errorDesc = replace( @localized_string_sp_BackupAllFull_Failed_Backup, '%s', @BackupServer + N'.' + @BackupDB )
			goto FAILED     
		end      
		
		exec @ret = [dbo].[sp_GetFileNameFromFilePath] @FilePath = @backup_loc, @Name = @filename OUTPUT, @Location = @filelocation OUTPUT
		
		select @error = @@ERROR
		if @error <> 0 or @ret <> 0 or @ret is NULL
		begin     
			select @errorDesc = @localized_string_sp_BackupAllFull_Failed_Executing_GetFileName
			goto FAILED     
		end        
		
		insert adm_BackupHistory(     BackupSetId     ,DatabaseName    ,ServerName   ,BackupFileName     ,BackupFileLocation     ,BackupType     ,BackupDateTime    ) 
			values (    @BackupSetId    ,@BackupDB   ,@BackupServer   ,@filename     ,@BackupPath    ,'db'     ,@TimeStamp    )     

		SET @DbCount = @DbCount + 1

		fetch next from BackupDB_Cursor into @BackupServer, @BackupDB
	 end
	
	close BackupDB_Cursor 
	deallocate BackupDB_Cursor 

	UPDATE	[dbo].[adm_BackupHistory]
	SET	[SetComplete] = 1
	WHERE	[BackupSetId] = @BackupSetId

	SELECT	@error		= @@ERROR
		,@rowcount	= @@ROWCOUNT

	IF @error <> 0 OR @rowcount <> @DbCount or @rowcount IS NULL
	BEGIN
		SET @errorDesc = @localized_string_sp_BackupAllFull_Failed_Executing_Backup
		GOTO FAILED
	END	

	goto DONE	

FAILED:

	raiserror( @errorDesc, 16, -1 )
	return -1

DONE:
	/*
		Always attempt to release the writer lock
		Doesn't matter if we have it or not
	*/
	exec @ret = sp_ReleaseBackupWriterLock

	return 0

 end
GO



grant execute on [dbo].[sp_BackupAllFull] to BTS_BACKUP_USERS
go



create procedure [dbo].[sp_BackupAllFull_Schedule] @Frequency nchar(1), @MarkName nvarchar(8), @BackupPath nvarchar(128), @ForceFullBackupAfterPartialSetFailure bit = 0
as
 begin	
	set nocount on

	declare @localized_string_sp_BackupAllFull_Schedule_Failed nvarchar(100)
	set @localized_string_sp_BackupAllFull_Schedule_Failed = N'sp_BackupAllFull_Schedule failed'

	declare @localized_string_sp_BackupAllFull_Schedule_Failed_Unknown_Frequency nvarchar(100)
	set @localized_string_sp_BackupAllFull_Schedule_Failed_Unknown_Frequency = N'Unknown value for the parameter @Frequency'

	declare @localized_string_sp_BackupAllFull_Schedule_Failed_Executing_Backup nvarchar(100)
	set @localized_string_sp_BackupAllFull_Schedule_Failed_Executing_Backup = N'Failed running sp_BackupAllFull'

/*
	Start new log shipping strings
*/

	declare @localized_string_sp_BackupAllFull_Schedule_Failed_SelectingForceFull nvarchar(100)
	set @localized_string_sp_BackupAllFull_Schedule_Failed_SelectingForceFull = N'Failed selecting the ForceFull value from the adm_ForceFullBackup table'

	declare @localized_string_sp_BackupAllFull_Schedule_Failed_UpdatingForceFull nvarchar(100)
	set @localized_string_sp_BackupAllFull_Schedule_Failed_UpdatingForceFull = N'Failed updating the ForceFull value in the adm_ForceFullBackup table'

	declare @localized_string_sp_BackupAllFull_Schedule_Failed_SelectHighestPartial nvarchar(100)
	set @localized_string_sp_BackupAllFull_Schedule_Failed_SelectHighestPartial = N'Failed searching for partial backup sets'

/*
	End new log shipping strings
*/

	declare	@ret			int
		,@error			int
		,@rowcount		int
		,@errorDesc		nvarchar(128)
		,@ForceFull		bit
		,@CurrDT 		DateTime

	select 	@CurrDT = getutcdate()
	/*
		Check to see if we need to backup
	*/

	/*
		First check if a forced full backup is requested regardless of any other state
	*/
	select	top 1 @ForceFull = [ForceFull]
	from	[dbo].[adm_ForceFullBackup]

	select	@error		= @@ERROR
		,@rowcount	= @@ROWCOUNT

	if @error <> 0
	 begin
		set @errorDesc = @localized_string_sp_BackupAllFull_Schedule_Failed_SelectingForceFull
		goto FAILED
	 end

	if @ForceFull = 1
		goto DO_BACKUP
	/*
		Now check if we need to do a full backup based on partial set conditions
	*/
	if @ForceFullBackupAfterPartialSetFailure = 1
	 begin
		/*
			If a partial set exists with no complete full backup set after it do a full backup
		*/
		declare @HighestPartial bigint

		select 		@HighestPartial = max(BackupSetId)
		from		[dbo].[adm_BackupHistory]
		where		SetComplete = 0

		if @@ERROR <> 0
		 begin
			set @errorDesc = @localized_string_sp_BackupAllFull_Schedule_Failed_SelectHighestPartial
			goto FAILED
		 end
		
		if @HighestPartial is not null 
		    and not exists(	select		1
					from		[dbo].[adm_BackupHistory]
					where		[BackupType] = 'db'
					and		[BackupSetId] > @HighestPartial
					and		[SetComplete] = 1
					group by	[BackupSetId] )
		 begin
			goto DO_BACKUP
		 end
	 end

	declare @MaxDT DateTime

	select 	@MaxDT = max(BackupDateTime)
	from	[dbo].[adm_BackupHistory]
	where	BackupType='db'
	/*
		If there's nothing in the table do the backup
	*/
	if @MaxDT is null
		goto DO_BACKUP
	/*
		Check to see if we already have a full backup for the specified frequency interval
	*/
	if @Frequency = 'h' or @Frequency = 'H'
	 begin
		if datepart( year, @MaxDT )  = datepart( year, @CurrDT ) and
		   datepart( month, @MaxDT ) = datepart( month, @CurrDT ) and
		   datepart( day, @MaxDT )   = datepart( day, @CurrDT ) and
		   datepart( hour, @MaxDT )  = datepart( hour, @CurrDT )
			goto DONE
	 end
	else if @Frequency = 'd' or @Frequency = 'D'
	 begin
		if datepart( year, @MaxDT )  = datepart( year, @CurrDT ) and
		   datepart( month, @MaxDT ) = datepart( month, @CurrDT ) and
		   datepart( day, @MaxDT )   = datepart( day, @CurrDT )
			goto DONE
	 end
	else if @Frequency = 'w' or @Frequency = 'W'
	 begin
		if datepart( year, @MaxDT )  = datepart( year, @CurrDT ) and
		   datepart( month, @MaxDT ) = datepart( month, @CurrDT ) and
		   datepart( week, @MaxDT )  = datepart( week, @CurrDT )
			goto DONE
	 end
	else if @Frequency = 'm' or @Frequency = 'M'
	 begin
		if datepart( year, @MaxDT )  = datepart( year, @CurrDT ) and
		   datepart( month, @MaxDT ) = datepart( month, @CurrDT )
			goto DONE
	 end
	else if @Frequency = 'y' or @Frequency = 'Y'
	 begin
		if datepart( year, @MaxDT )  = datepart( year, @CurrDT )
			goto DONE
	 end
	else
	 begin
		select @errorDesc = @localized_string_sp_BackupAllFull_Schedule_Failed_Unknown_Frequency
		goto FAILED
	 end

DO_BACKUP:
	exec @ret = [dbo].[sp_BackupAllFull] @MarkName, @BackupPath, @CurrDT

	if @@ERROR <> 0 or @ret <> 0 or @ret IS NULL
	 begin
		select @errorDesc = @localized_string_sp_BackupAllFull_Schedule_Failed_Executing_Backup
		GOTO FAILED
	 end
	else
	 begin
		/*
			If this is a forced backup reset the flag so we don't force another
		*/
		if @ForceFull = 1
		 begin
			update	[dbo].[adm_ForceFullBackup]
			set	[ForceFull] = 0

			if @@ERROR <> 0
			 begin
				select @errorDesc = @localized_string_sp_BackupAllFull_Schedule_Failed_UpdatingForceFull
				GOTO FAILED
			 end
		 end

		GOTO DONE
	 end

FAILED:
	if @errorDesc is null
		select @errorDesc = @localized_string_sp_BackupAllFull_Schedule_Failed

	raiserror( @errorDesc, 16, -1 )
	return -1

DONE:
	return 0

 end

go


grant execute on [dbo].[sp_BackupAllFull_Schedule] to BTS_BACKUP_USERS
go


--/====================================================================/--
--/===== Create Backup Agent Job (only if it doesnt already exist =====/--
--/====================================================================/--


BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT  
  DECLARE @dbname sysname

  set @dbname = db_name()   

  declare @name sysname
  set @name = N'Backup BizTalk Server (' + db_name() + ')'
 
  SET @ReturnCode = 0     

  --need to delete the old job if it is still there
  IF EXISTS (SELECT job_id FROM msdb.dbo.sysjobs WHERE name = N'Backup BizTalk Server')
  BEGIN  
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = N'Backup BizTalk Server'
  END

  SELECT @JobID = job_id FROM msdb.dbo.sysjobs WHERE (name = @name)       
  IF (@JobID IS NULL)    
  BEGIN  
	
	IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'Database Maintenance') < 1 
  		EXECUTE msdb.dbo.sp_add_category @name = N'Database Maintenance'

  	-- Add the job
  	EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = @name, @owner_login_name = N'', @description = N'This job performs full database backups (step 1) and log backups (step 2) of BizTalk Server databases.', @category_name = N'Database Maintenance', @enabled = 0, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
  	BEGIN
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
		RETURN
   	END

  	-- Add the job steps
  	DECLARE @db_name nvarchar(128)
  	SELECT @db_name = isnull( db_name(), N'' )

  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'BackupFull', @command = N'exec [dbo].[sp_BackupAllFull_Schedule] ''d'' /* Frequency */, ''BTS'' /* Name */, ''<destination path>'' /* location of backup files */', @database_name = @db_name, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 3, @on_fail_step_id = 0, @on_fail_action = 2
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
   	BEGIN
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
		RETURN
   	END

  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 2, @step_name = N'MarkAndBackupLog', @command = N'exec [dbo].[sp_MarkAll] ''BTS'' /*  Log mark name */, ''<destination path>'' /* location of backup files */', @database_name = @db_name, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 3, @on_fail_step_id = 0, @on_fail_action = 2
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
   	BEGIN
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
		RETURN
   	END

  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 3, @step_name = N'Clear Backup History', @command = N'exec [dbo].[sp_DeleteBackupHistory] @DaysToKeep=14', @database_name = @db_name, @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
  	BEGIN
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
		RETURN
   	END

  	EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
   	BEGIN
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
		RETURN
   	END

  	-- Add the job schedules
  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'MarkAndBackupLogSched', @enabled = 1, @freq_type = 4, @active_start_date = 20031110, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 15, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
   	BEGIN
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
		RETURN
   	END

  	-- Add the Target Servers
  	EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
   	BEGIN
		IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
		RETURN
   	END

  END
COMMIT TRANSACTION 
GO



IF OBJECT_ID( 'adm_BackupSetId_InsertTrigger' ) IS NOT NULL
	DROP TRIGGER [dbo].[adm_BackupSetId_InsertTrigger]
GO

CREATE TRIGGER adm_BackupSetId_InsertTrigger
ON [dbo].[adm_BackupSetId]
FOR INSERT, UPDATE
AS
 BEGIN	
	set nocount on

	declare @localized_string_adm_BackupSetId_InsertTrigger_Failed_Rowcount nvarchar(128)
	set @localized_string_adm_BackupSetId_InsertTrigger_Failed_Rowcount = N'Rowcount in adm_BackupSetId cannot exceed 1'

	declare @localized_string_adm_BackupSetId_InsertTrigger_Failed_ValueInUse nvarchar(128)
	set @localized_string_adm_BackupSetId_InsertTrigger_Failed_ValueInUse = N'Value cannot exist in adm_BackupHistory.BackupSetId'

	DECLARE @count 		int
		,@updated 	bigint
		,@ErrMsg	nvarchar(128)

	SELECT @count = count([NextBackupSetId]) FROM [dbo].[adm_BackupSetId]

	IF @count > 1 
	 BEGIN
		SET @ErrMsg = @localized_string_adm_BackupSetId_InsertTrigger_Failed_Rowcount
		GOTO ERROR
	 END

	SELECT @updated = NextBackupSetId FROM inserted

	IF EXISTS ( SELECT 1 FROM [dbo].[adm_BackupHistory] WHERE [BackupSetId] = @updated )
	 BEGIN
		SET @ErrMsg = @localized_string_adm_BackupSetId_InsertTrigger_Failed_ValueInUse
		GOTO ERROR
	 END

	GOTO DONE

ERROR:
	ROLLBACK TRANSACTION
	RAISERROR( @ErrMsg, 16, -1 )

DONE:
	
 END
GO

--// Create BAS related stored procs //--
CREATE  PROCEDURE [dbo].[bas_DeleteProperty] @propertyName nvarchar(80)
AS
	DELETE FROM bas_Properties
	WHERE PropertyName = @propertyName
GO

GRANT EXEC ON [dbo].[bas_DeleteProperty] TO BTS_ADMIN_USERS
GO

CREATE  PROCEDURE [dbo].[bas_GetPropertyValue] @propertyName nvarchar(80), @propertyValue nvarchar(260) OUTPUT
AS
	SELECT 	@propertyValue 	= PropertyValue
	FROM bas_Properties
	WHERE PropertyName = @propertyName
GO

GRANT EXEC ON [dbo].[bas_GetPropertyValue] TO BTS_ADMIN_USERS
GO

GRANT EXEC ON [dbo].[bas_GetPropertyValue] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[bas_SetPropertyValue] @propertyName nvarchar(80), @propertyValue nvarchar(260)
AS
	IF (EXISTS(SELECT * FROM bas_Properties WHERE PropertyName = @propertyName))
		BEGIN
			UPDATE bas_Properties
			SET PropertyValue = @propertyValue
			WHERE PropertyName = @propertyName
		END
	ELSE
		BEGIN
			INSERT INTO bas_Properties (PropertyName, PropertyValue)
			VALUES (@propertyName, @propertyValue)
		END
GO

GRANT EXEC ON [dbo].[bas_SetPropertyValue] TO BTS_ADMIN_USERS
GO

--// Create OPs OM related Sprocs
CREATE PROCEDURE [dbo].[ops_MapPredicatePropIDToString]
@nPropertiesCount int OUTPUT
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

	SELECT id, msgtype 
	FROM bt_DocumentSpec 
	WHERE is_property_schema = 1

	set @nPropertiesCount = @@ROWCOUNT

GO
GRANT EXEC ON [dbo].[ops_MapPredicatePropIDToString] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_MapPredicatePropIDToString] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_LoadOrchestrationServiceNames]
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT orch.uidGUID, orch.nvcFullName + N', ' + a.nvcFullName 
FROM bts_orchestration orch WITH (ROWLOCK READPAST)
left outer join bts_assembly a WITH (ROWLOCK READPAST)
ON orch.nAssemblyID = a.nID 

GO
GRANT EXEC ON [dbo].[ops_LoadOrchestrationServiceNames] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadOrchestrationServiceNames] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_LoadSendPortServiceNames]
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT uidGUID, nvcName FROM bts_sendport WITH (ROWLOCK READPAST)

GO
GRANT EXEC ON [dbo].[ops_LoadSendPortServiceNames] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadSendPortServiceNames] TO BTS_OPERATORS
GO


CREATE PROCEDURE [dbo].[ops_LoadReceivePortServiceNames]
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT uidGUID, nvcName FROM bts_receiveport WITH (ROWLOCK READPAST)

GO
GRANT EXEC ON [dbo].[ops_LoadReceivePortServiceNames] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadReceivePortServiceNames] TO BTS_OPERATORS
GO

CREATE PROCEDURE [dbo].[ops_LoadSendPortSpecificFields]
@uidPortID uniqueidentifier
AS

set transaction isolation level read committed
set nocount on
set deadlock_priority low

SELECT st.bIsPrimary, st.bIsServiceWindow, st.dtFromTime, st.dtToTime, sp.nPriority, st.bOrderedDelivery, sp.bStopSendingOnFailure, sp.bRouteFailedMessage
FROM bts_sendport AS sp
LEFT OUTER JOIN bts_sendport_transport AS st ON (sp.nID = st.nSendPortID)
WHERE st.uidGUID = @uidPortID

GO
GRANT EXEC ON [dbo].[ops_LoadSendPortSpecificFields] TO BTS_ADMIN_USERS
GRANT EXEC ON [dbo].[ops_LoadSendPortSpecificFields] TO BTS_OPERATORS
GO

--//This SP is used for looking up parties from the run-time
CREATE PROCEDURE [dbo].[admsvr_GetPartyByAliasNameValue]
@nvcAliasName nvarchar(256),
@nvcAliasQualifier nvarchar(64),
@nvcAliasValue nvarchar(256),
@nvcSID nvarchar(256) OUTPUT,
@nvcName nvarchar(256) OUTPUT
AS
SELECT      @nvcSID = bts_party.nvcSID,
            @nvcName = bts_party.nvcName
FROM bts_party, bts_party_alias
WHERE       UPPER(bts_party_alias.nvcName) = UPPER(@nvcAliasName) AND
            UPPER(bts_party_alias.nvcQualifier) = UPPER(@nvcAliasQualifier) AND
            bts_party_alias.nvcValue LIKE @nvcAliasValue  AND
            bts_party_alias.nPartyID = bts_party.nID

GO
 
CREATE PROCEDURE [dbo].[adm_toggleDefaultAppFlag]
AS
UPDATE bts_application SET isDefault = isDefault - 1
GO

CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetHosts] AS

--SELECT Name FROM adm_Host WITH (NOLOCK)
-- Trying to get AppLock so as to serialize access in case two hosts (in different processes) are trying to access the same info at the same time.
DECLARE @retVal smallint

EXEC  @retVal = sp_getapplock @Resource = 'MsgBoxPerfCounters_adm_HostTable', @LockMode = 'Shared', @LockOwner = 'Session'

IF (@retVal = 0 ) -- Lock granted
BEGIN 
	SELECT Name FROM adm_Host
	EXEC sp_releaseapplock @Resource = 'MsgBoxPerfCounters_adm_HostTable', @LockOwner = 'Session'
END
 -- Else there was a problem getting lock and nothing is returned.
GO
GRANT EXEC ON [dbo].[MsgBoxPerfCounters_GetHosts] TO BTS_HOST_USERS
GO


CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetMACacheRefreshInterval] AS

--SELECT ConfigurationCacheRefreshInterval FROM adm_Group WITH (NOLOCK)
-- Trying to get AppLock so as to serialize access in case two hosts (in different processes) are trying to access the same info at the same time.
DECLARE @retVal smallint

EXEC  @retVal = sp_getapplock @Resource = 'MsgBoxPerfCounters_adm_GroupTable', @LockMode = 'Shared', @LockOwner = 'Session'

IF (@retVal = 0 ) -- Lock granted
BEGIN 
	SELECT ConfigurationCacheRefreshInterval FROM adm_Group
	EXEC sp_releaseapplock @Resource = 'MsgBoxPerfCounters_adm_GroupTable', @LockOwner = 'Session'
END
ELSE
 -- Else there was a problem getting lock - return the default value of 60 in this case
BEGIN
	SELECT 60
END
GO
GRANT EXEC ON [dbo].[MsgBoxPerfCounters_GetMACacheRefreshInterval] TO BTS_HOST_USERS
GO


CREATE PROCEDURE [dbo].[MsgBoxPerfCounters_GetMsgBoxesAndServers] AS

--SELECT DBServerName, DBName FROM adm_MessageBox WITH (NOLOCK)
-- Trying to get AppLock so as to serialize access in case two hosts - in different processes - are trying to access the same info at the same time.
DECLARE @retVal smallint

EXEC  @retVal = sp_getapplock @Resource = 'MsgBoxPerfCounters_adm_MessageBoxTable', @LockMode = 'Shared', @LockOwner = 'Session'

IF (@retVal = 0 ) -- Lock granted
BEGIN 
	SELECT DBServerName, DBName FROM adm_MessageBox
	EXEC sp_releaseapplock @Resource = 'MsgBoxPerfCounters_adm_MessageBoxTable', @LockOwner = 'Session'
END
 -- Else there was a problem getting lock and nothing is returned. Means that things will be considered to be 'deleted' from counters updating point of view.
GO
GRANT EXEC ON [dbo].[MsgBoxPerfCounters_GetMsgBoxesAndServers] TO BTS_HOST_USERS
GO



SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



