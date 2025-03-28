--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 
------------------------------------------------------------------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Instances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Instances]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstancesPendingOperations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InstancesPendingOperations]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstancesSuspended]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InstancesSuspended]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstancesOperatedOn]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InstancesOperatedOn] 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OperationsProgress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OperationsProgress]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Spool]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Spool]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Fragments]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Fragments]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Parts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Parts]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessagePredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MessagePredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessageParts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MessageParts]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessageProps]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MessageProps]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProcessHeartbeats]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProcessHeartbeats]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TruncateRefCountLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TruncateRefCountLog]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessageRefCountLog1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MessageRefCountLog1]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessageRefCountLog2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MessageRefCountLog2]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessageRefCountLogTotals]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MessageRefCountLogTotals]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PartRefCountLog1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PartRefCountLog1]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PartRefCountLog2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PartRefCountLog2]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PartRefCountLogTotals]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PartRefCountLogTotals]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ActiveRefCountLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ActiveRefCountLog]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MessageZeroSum]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MessageZeroSum]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PartZeroSum]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PartZeroSum]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PredicateGroupZeroSum1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PredicateGroupZeroSum1]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PredicateGroupZeroSum2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PredicateGroupZeroSum2]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Subscription]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Subscription]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UniqueSubscription]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UniqueSubscription]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FirstPassPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FirstPassPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EqualsPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EqualsPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EqualsPredicates2ndPass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EqualsPredicates2ndPass]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ExistsPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ExistsPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LessThanPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LessThanPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LessThanOrEqualsPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LessThanOrEqualsPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GreaterThanPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GreaterThanPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GreaterThanOrEqualsPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GreaterThanOrEqualsPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NotEqualsPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NotEqualsPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BitwiseANDPredicates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BitwiseANDPredicates]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PredicateGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PredicateGroup]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PredicateGroupNames]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PredicateGroupNames]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ConvoySets]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ConvoySets]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ConvoySetInstances]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ConvoySetInstances]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocalizedErrorStrings]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LocalizedErrorStrings]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_ActivationSubscription]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_ActivationSubscription]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_UTCDate]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_UTCDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btsv_LocalDate]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[btsv_LocalDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Release]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Release]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AddRef]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ServiceClasses]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ServiceClasses]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Modules]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Modules]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Services]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Services]
GO


--*********************************************************************
--*
--CREATE TABLES
--*********************************************************************

--Attributes flags are used by the messagebox to figure out what is and is not supported by this service class.
-- 0x1  This service class supports consuming control messages. 

CREATE TABLE [dbo].[ServiceClasses] (
	[nID] 		[bigint] identity(0,1)  NOT NULL, 
	[nvcName] 	[nvarchar] (256) 	NOT NULL,
	[uidServiceClassID] [uniqueidentifier]	NOT NULL,
	[fAttributes]	[bigint]		NOT NULL DEFAULT (0) --properties of the service class
)
GO

INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Messaging InProcess', '{59F295B0-3123-416E-966B-A2C6D65FF8E6}', 1)
INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Orchestration', '{226FC6B9-0416-47A4-A8E8-4721F1DB1A1B}', 1)
INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'MSMQt', '{3D7A3F58-4BFB-4593-B99E-C2A5DC35A3B2}', 0)
INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Messaging Isolated Host', '{683AEDF1-027D-4006-AE9A-443D1A5746FC}', 0)
INSERT INTO [ServiceClasses] (nvcName, uidServiceClassID, fAttributes) VALUES (N'Cache', '{BB3A1470-F5C4-47C3-B71F-EAABC260FBD0}', 0)
GO

--This table is a way of grouping a set of related services together. In the UI these are called applications
CREATE TABLE [dbo].[Modules] (
	[nModuleID] [int] identity(0,1)  NOT NULL, 
	[nvcName] [nvarchar] (256) NOT NULL,
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetUTCDate())
)
GO

CREATE TABLE [dbo].[Services] (
	[uidServiceID] [uniqueidentifier] NOT NULL,
	[uidServiceClassID] [uniqueidentifier] NULL,
	[nModuleID] [int] NULL,
	[fAttributes] [bigint] NOT NULL DEFAULT(0)
)
GO

CREATE TABLE [dbo].[Release] (
	[uidMessageID ] [uniqueidentifier] NOT NULL
) 
GO

CREATE TABLE [dbo].[AddRef] (
	[uidMessageID ] [uniqueidentifier] NOT NULL
) 
GO

CREATE TABLE [dbo].[Instances] (
	[uidAppOwnerID] [uniqueidentifier] NOT NULL,
	[uidInstanceID] [uniqueidentifier] NOT NULL,
	[uidServiceID] [uniqueidentifier] NOT NULL,
	[uidClassID] [uniqueidentifier] NOT NULL,
	[dtCreated] [datetime] NOT NULL CONSTRAINT Instances_dtCreated_Dflt DEFAULT (GetUTCDate()),
	[uidProcessID] [uniqueidentifier] NULL,
	[uidActivationID] [uniqueidentifier] NULL,
	[nvcProcessingServer] [nvarchar] (256) NULL,
	[nState] [smallint] NOT NULL DEFAULT (1),
	[fOptimize] [smallint] NOT NULL DEFAULT (1), --special flag set by services when they dehydrate to indicate if they should run in optimized mode on rehydration. Sometimes failures can't be correctly handled in optiized mode so they switch out
	[nvcUserState] [nvarchar] (256) NULL,	
	[dtValidTime] [datetime] NOT NULL CONSTRAINT Instances_dtValidTime_Dflt DEFAULT (GetUTCDate()),
	[dtSuspendTimeStamp] [datetime] NULL,
	[nErrorCategory] [int] NULL,
	[nvcErrorID] [nvarchar] (512) NULL,
	[nvcErrorDescription] [nvarchar] (1024) NULL,
	[nvcErrorProcessingServer] [nvarchar] (256) NULL,
) 
GO

CREATE TABLE [dbo].[InstancesPendingOperations] (
	[uidInstanceID] [uniqueidentifier] NOT NULL,
	[nPendingOperation] [smallint] NOT NULL DEFAULT (1),
	[dtPendingOperationSubmitTime] [datetime] NULL
)
GO	

CREATE TABLE [dbo].[InstancesSuspended] (
	[uidAppOwnerID] [uniqueidentifier] NOT NULL,
	[uidInstanceID] [uniqueidentifier] NOT NULL,
	[uidServiceID] [uniqueidentifier] NOT NULL,
	[uidClassID] [uniqueidentifier] NOT NULL,
	[dtCreated] [datetime] NOT NULL DEFAULT (GetUTCDate()),
	[nState] [smallint] NOT NULL DEFAULT (1),
	[nvcUserState] [nvarchar] (256) NULL,
	[dtSuspendTimeStamp] [datetime] NULL,
	[nvcAdapter] [nvarchar] (512) NULL,	
	[nvcURI] [nvarchar] (512) NULL,
	[nErrorCategory] [int] NULL, -- DEFAULT (0),
	[nvcErrorID] [nvarchar] (512) NULL,
	[nvcErrorDescription] [nvarchar] (1024) NULL,
	[nvcErrorProcessingServer] [nvarchar] (256) NULL
) 
GO
 
CREATE TABLE [dbo].[InstancesOperatedOn] (
	[uidInstanceID] [uniqueidentifier] NOT NULL,
	[uidClassID] [uniqueidentifier] NOT NULL,
	[uidServiceID] [uniqueidentifier] NOT NULL,
	[nvcHostName] [nvarchar] (128) NOT NULL, 
	[uidAccessorID] [uniqueidentifier] NOT NULL,
	[snOperation] [smallint] NOT NULL DEFAULT (21), -- default required for upgrade situations 	
	[dtOperationStartTime] datetime NOT NULL DEFAULT (GetUTCDate())  -- used to determine which RFRs to delete
)
GO
 
CREATE TABLE [dbo].[OperationsProgress] (	
	[uidAccessorID] [uniqueidentifier] NOT NULL,
	[snSpid] [smallint],
	[nSucceededCount] [int] NOT NULL DEFAULT (0),
	[nFailedCount] [int] NOT NULL DEFAULT (0),
	[nPendingCount] [int] NOT NULL DEFAULT (0),
	[nSkippedCount] [int] NOT NULL DEFAULT (0)	
)
GO

-- IF YOU EDIT THIS TABLE, MAKE SURE TO UPDATE THE ADMIN VIEW AT THE BOTTOM OF THE FILE
CREATE TABLE [dbo].[Subscription] (
	[nID] [bigint] IDENTITY(0,1),	
	[dtTimeStamp] [datetime] NOT NULL CONSTRAINT Subscription_dtTimeStamp_Dflt DEFAULT (GetUTCDate()),
	[nvcName] [nvarchar] (600) NULL ,
	[uidSubID] [uniqueidentifier] NOT NULL ,
	[uidSubGroupID] [uniqueidentifier] NULL DEFAULT (NewID()),
	[snGroupPriority] [smallint] NOT NULL ,
	[nvcApplicationName] [nvarchar] (256) NOT NULL ,
	[uidClassID] [uniqueidentifier] NOT NULL ,
	[dtStartWindow] [datetime] NOT NULL ,
	[dtEndWindow] [datetime] NOT NULL ,
	[dtValid] [datetime] NOT NULL ,
	[uidServiceID] [uniqueidentifier] NOT NULL ,
	[uidInstanceID] [uniqueidentifier] NULL ,
	[uidPortID] [uniqueidentifier] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[fEnabled] [smallint] NOT NULL DEFAULT (1),
	[uidConvoySetID] [uniqueidentifier] NULL ,
	[vtConvoySetProp1DefVal] [sql_variant] NULL ,
	[vtConvoySetProp2DefVal] [sql_variant] NULL ,
	[vtConvoySetProp3DefVal] [sql_variant] NULL ,
	[snPartRetrieval] [smallint] NOT NULL DEFAULT (0),
	[fOrderedDelivery] [int] NOT NULL DEFAULT (0),
	[fIsRequestResponse] [int] NOT NULL DEFAULT (0),
	[fCanActivateConvoySet] [int] NOT NULL DEFAULT (1),
	[uidAppInstanceID] [uniqueidentifier] NULL,
	[uidDBOwnerID] [uniqueidentifier] NULL,
	[snPriority] [smallint] NULL
) 
GO

CREATE TABLE [dbo].[UniqueSubscription] (
	[uidSubscriptionID] [uniqueidentifier] NOT NULL,
	[uidInstanceID] [uniqueidentifier] NULL,
	[uidServiceID] [uniqueidentifier] NOT NULL,
	[nvcName] [nvarchar](256) NOT NULL
)
GO

CREATE TABLE [dbo].[FirstPassPredicates]  (
	[uidBatchID] [uniqueidentifier] NOT NULL,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL,
	[nNumSecondPassPredicates] [int] NOT NULL,
	[uidMessageID ] [uniqueidentifier] NOT NULL,
	[nOrderID] [int] NOT NULL,
	[uidPredicateORGroupID] [uniqueidentifier] NOT NULL
)
GO
				   
CREATE TABLE [dbo].[EqualsPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL 
) 
GO

CREATE TABLE [dbo].[EqualsPredicates2ndPass] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL
) 
GO

CREATE TABLE [dbo].[ExistsPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[tnPass] [tinyint] NOT NULL DEFAULT (1) 
) 
GO

CREATE TABLE [dbo].[LessThanPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[tnPass] [tinyint] NOT NULL DEFAULT (1) 
) 
GO

CREATE TABLE [dbo].[LessThanOrEqualsPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[tnPass] [tinyint] NOT NULL DEFAULT (1) 
) 
GO

CREATE TABLE [dbo].[GreaterThanPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[tnPass] [tinyint] NOT NULL DEFAULT (1) 
) 
GO

CREATE TABLE [dbo].[GreaterThanOrEqualsPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[tnPass] [tinyint] NOT NULL DEFAULT (1) 
) 
GO

CREATE TABLE [dbo].[NotEqualsPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[tnPass] [tinyint] NOT NULL DEFAULT (1) 
) 
GO

CREATE TABLE [dbo].[BitwiseANDPredicates] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtValue] [sql_variant] NULL ,
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL ,
	[tnPass] [tinyint] NOT NULL DEFAULT (1) 
) 
GO


CREATE TABLE [dbo].[ConvoySets] (
	[uidConvoySetID] [uniqueidentifier] NOT NULL,
	[nvcConvoySetName] [nvarchar] (256)  NULL,
	[uidServiceID] [uniqueidentifier] NOT NULL,
	[uidPropertyID1] [uniqueidentifier] NOT NULL,
	[uidPropertyID2] [uniqueidentifier] NULL,
	[uidPropertyID3] [uniqueidentifier] NULL,
) 
GO

CREATE TABLE [dbo].[ConvoySetInstances] (
	[nID] [bigint] IDENTITY(0,1) NOT NULL ,
	[uidConvoySetID] [uniqueidentifier] NOT NULL,
	[vtProp1] [sql_variant] NOT NULL,
	[vtProp2] [sql_variant] NULL,
	[vtProp3] [sql_variant] NULL,
	[uidInstanceID] [uniqueidentifier] NOT NULL,
	[uidDatabaseID] [uniqueidentifier] NOT NULL,
	[uidActivatingMessageID] [uniqueidentifier] NOT NULL,
	[fEnabled] [int] NOT NULL DEFAULT (1)
) 
GO

--Lets create the MSMQt default convoy set. This will just live in our db. Perhaps we
--could later have admin create this, but for now we will just hardcode it
INSERT INTO ConvoySets (uidConvoySetID, nvcConvoySetName, uidServiceID, uidPropertyID1) VALUES ('{3d7a3f58-4bfb-4593-b99e-c2a5dc35a3b2}', 'MSMQtConvoySet', '{0EE2AEC3-F646-41A6-80A1-A1AF5ED4F02B}', '{aea02036-df27-4cdf-a4c4-593ec9ea3e0b}')
--Lets create an internal convoy set for all other messaging ordered delivery ports.
--we convoy on the sendport transport id
INSERT INTO ConvoySets (uidConvoySetID, nvcConvoySetName, uidServiceID, uidPropertyID1) VALUES ('{59F295B0-3123-416E-966B-A2C6D65FF8E6}', 'MessagingConvoySet', '{54ABE27C-1768-469B-8088-5765CD0F8EC2}', '{A2DB8C35-EF73-4C89-9866-5661E330CCE4}')

CREATE TABLE [dbo].[PredicateGroupNames] (
	[uidPredicateGroupID] [uniqueidentifier] NOT NULL,
	[nvcName] [nvarchar] (256)  NOT NULL ,
	[fEnabled] [int] NOT NULL DEFAULT (1)
) 
GO

CREATE TABLE [dbo].[PredicateGroup] (
	[uidPredicateANDGroupID] [uniqueidentifier] NOT NULL ,
	[uidPredicateORGroupID] [uniqueidentifier] NOT NULL ,
	[nNumFirstPassPredicates] [int] NOT NULL,
	[nNumSecondPassPredicates] [int] NOT NULL,
	[fIsDistributionList] [int] NOT NULL DEFAULT (0)
) 
GO

CREATE TABLE [dbo].[MessagePredicates] (
	[uidBatchID] [uniqueidentifier] NOT NULL ,
	[uidMessageID ] [uniqueidentifier] NOT NULL ,
	[uidPropID] [uniqueidentifier] ,
	[vtPropValue] [sql_variant] NOT NULL 
) 
GO

CREATE TABLE [dbo].[Spool] (
	[uidMessageID ] [uniqueidentifier] NOT NULL ,
	[UserName] [sysname] NOT NULL DEFAULT (SUSER_SNAME()),
	[PublishingServer] [sysname] NOT NULL DEFAULT (HOST_NAME()),
	[OriginatorSID] [sysname] NOT NULL DEFAULT (SUSER_SNAME()),
	[OriginatorPID] [nvarchar] (256) NOT NULL DEFAULT ('s-1-5-7'),
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetUTCDate()),
	[dtExpiration] [datetime] NULL,
	[nvcMessageType] [nvarchar](128) NULL ,
	[nNumParts] [int] NOT NULL ,
	[uidBodyPartID] [uniqueidentifier] NULL ,
	[nvcBodyPartName] [nvarchar] (256) NULL ,
	[nCounter] [int] NOT NULL ,
	[imgContext] [image] NULL
) 

-- Inserting Restart Message for use in service recovery
INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'61EAA7FC-AC85-42d9-BF3E-1BED258B82BE', 0, 0, 0xD4E0906C1849D311A24200C04F60A53302000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F007000650072007400690065007300000001000000010820010000000000000000000700000098000000540069006D0065007200490044005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F0078006C0061006E00670073002D00720075006E00740069006D0065002D00700072006F0070006500720074006900650073000000010000000008004A000000300030003000300030003000300030002D0030003000300030002D0030003000300030002D0030003000300030002D003000300030003000300030003000300030003000300030000000)

-- Inserting Suspend Control message
INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'2BE3D5B8-5685-40F2-BD97-51ADA3D02347', 0, 0, 0xD4E0906C1849D311A24200C04F60A53303000000000000001E000000420069007A00540061006C006B0043006F006E00740072006F006C000000020000000008002A000000410064006D0069006E00530075007300700065006E00640049006E007300740061006E00630065000000000000000C0000004A006F006200490044000000020000000008004E0000007B00340037004100450033003300380034002D0031003000410041002D0034003400430033002D0038003200350036002D003200350033003400380045004200390032004200320031007D000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F00700065007200740069006500730000000100000001082001000000000000000000)

-- Inserting Terminate Control message
INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'57E5E753-0207-435D-8BE7-2B9F3C6556F9', 0, 0, 0xD4E0906C1849D311A24200C04F60A53303000000000000001E000000420069007A00540061006C006B0043006F006E00740072006F006C000000020000000008002E000000410064006D0069006E005400650072006D0069006E0061007400650049006E007300740061006E00630065000000000000000C0000004A006F006200490044000000020000000008004E0000007B00350032003500390031004600310031002D0046003700370034002D0034003600330038002D0042004300390041002D003200380034003800380034003600300034003500450032007D000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F00700065007200740069006500730000000100000001082001000000000000000000)

--Inserting Resume in Debug Mode message
INSERT INTO Spool (uidMessageID, nNumParts, nCounter, imgContext) VALUES (N'50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3', 0, 0, 0xD4E0906C1849D311A24200C04F60A53303000000000000001E000000420069007A00540061006C006B0043006F006E00740072006F006C0000000200000000080026000000410064006D0069006E004400650062007500670049006E007300740061006E00630065000000000000000C0000004A006F006200490044000000020000000008004E0000007B00330032003800330030004500450045002D0035004400330041002D0034003700370037002D0041003200440035002D003100320033004100450035004600340044004500420039007D000000090000009800000050006100720074004E0061006D00650073005E0068007400740070003A002F002F0073006300680065006D00610073002E006D006900630072006F0073006F00660074002E0063006F006D002F00420069007A00540061006C006B002F0032003000300033002F006D006500730073006100670065006100670065006E0074002D00700072006F00700065007200740069006500730000000100000001082001000000000000000000)

GO


CREATE TABLE [dbo].[Fragments] (
	[uidPartID] [uniqueidentifier] NOT NULL ,
	[nFragmentNumber] [int] NOT NULL ,
	[nFragmentSize] [int] NOT NULL DEFAULT (-1),
	[nOffsetStart] [int] NOT NULL,
	[nOffsetEnd] [int] NOT NULL,
	[imgFrag] [image] NOT NULL
) 
GO

CREATE TABLE [dbo].[Parts] (
	[uidPartID] [uniqueidentifier] NOT NULL ,
	[nNumFragments] [int] NOT NULL ,
	[nPartSize] [bigint] NOT NULL DEFAULT (0),
	[imgPart] [image] NULL ,
	[imgPropBag] [image] NULL ,
	[uidClonedPartID] [uniqueidentifier] NULL --in case we copy a part when it is referenced twice by the same message
) 
GO

CREATE TABLE [dbo].[MessageParts] (
	[uidMessageID ] [uniqueidentifier] NOT NULL ,
	[uidPartID] [uniqueidentifier] NOT NULL ,
	[nvcPartName] [nvarchar] (256) NOT NULL ,
	[nBodyPart] [smallint] NOT NULL
) 
GO

CREATE TABLE [dbo].[MessageRefCountLog1] (
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetDate()),
	[uidMessageID ] [uniqueidentifier] NOT NULL,
	[uidInstanceID] uniqueidentifier NULL, --can be null for tracked message references
	[tnQueueID] tinyint NOT NULL DEFAULT (0), -- 0=safety refcount, 1=WorkQ, 2=StateQ, 3=SuspendedQ, 4=TrackedMessageRef
	[snRefCount] smallint NOT NULL
)
GO

CREATE TABLE [dbo].[MessageRefCountLog2] (
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetDate()),
	[uidMessageID ] [uniqueidentifier] NOT NULL,
	[uidInstanceID] uniqueidentifier NULL,
	[tnQueueID] tinyint NOT NULL DEFAULT (0),
	[snRefCount] smallint NOT NULL
)
GO

CREATE TABLE [dbo].[MessageRefCountLogTotals] (
	[uidMessageID ] [uniqueidentifier] NOT NULL,
	[snRefCount] int NOT NULL,
	[tnLastTable] tinyint NOT NULL DEFAULT (1)
)

-- Inserting refcounts for restart, suspend and terminate control messages
INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'61EAA7FC-AC85-42d9-BF3E-1BED258B82BE', 1)
INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'57E5E753-0207-435D-8BE7-2B9F3C6556F9', 1)
INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'2BE3D5B8-5685-40F2-BD97-51ADA3D02347', 1)
INSERT INTO MessageRefCountLogTotals (uidMessageID, snRefCount) VALUES (N'50D173AF-5D6F-4D5F-AE23-1A7178CEBDC3', 1)


GO

CREATE TABLE [dbo].[PartRefCountLog1] (
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetDate()),
	[uidPartID] uniqueidentifier NOT NULL,
	[uidMessageID ] [uniqueidentifier] NOT NULL,
	[snRefCount] smallint NOT NULL
)
GO

CREATE TABLE [dbo].[PartRefCountLog2] (
	[dtTimeStamp] [datetime] NOT NULL DEFAULT (GetDate()),
	[uidPartID] uniqueidentifier NOT NULL,
	[uidMessageID ] [uniqueidentifier] NOT NULL,
	[snRefCount] smallint NOT NULL
)
GO

CREATE TABLE [dbo].[PartRefCountLogTotals] (
	[uidPartID] uniqueidentifier NOT NULL,
	[snRefCount] smallint NOT NULL
)
GO

--keep track of which RefCountLog is active for parts and for messages.
--start with table 1 being active
CREATE TABLE [dbo].[ActiveRefCountLog] (
	[fType] [tinyint] NOT NULL,
	[tnActiveTable] [tinyint] NOT NULL
)
GO
INSERT INTO ActiveRefCountLog VALUES (0, 1)
INSERT INTO ActiveRefCountLog VALUES (1, 1)
INSERT INTO ActiveRefCountLog VALUES (2, 1)
GO

--Faster for us to just mark if we have processed the inactive table so we know whether we need to reprocess it or just truncate it in case
--we crash before we do the truncation
CREATE TABLE [dbo].[TruncateRefCountLog] (
	[fType] [tinyint] NOT NULL,
	[fTruncate] [tinyint] NOT NULL
)
GO

INSERT INTO TruncateRefCountLog VALUES (0, 1)
INSERT INTO TruncateRefCountLog VALUES (1, 1)
INSERT INTO TruncateRefCountLog VALUES (2, 1)
GO

CREATE TABLE [dbo].[PredicateGroupZeroSum1] (
	[uidPredicateORGroupID] [uniqueidentifier] NOT NULL,
	[uidPredicateANDGroupID] [uniqueidentifier] NOT NULL
)
GO

CREATE TABLE [dbo].[PredicateGroupZeroSum2] (
	[uidPredicateORGroupID] [uniqueidentifier] NOT NULL,
	[uidPredicateANDGroupID] [uniqueidentifier] NOT NULL
)
GO

CREATE TABLE [dbo].[MessageZeroSum] (
	[uidMessageID ] [uniqueidentifier] NOT NULL,
	[nID] [bigint] NOT NULL IDENTITY(1,1)
)
GO


CREATE TABLE [dbo].[PartZeroSum] (
	[uidPartID] uniqueidentifier NOT NULL,
	[nID] [bigint] NOT NULL IDENTITY(1,1)
)
GO


CREATE TABLE [dbo].[MessageProps] (
	[nOrderID] [int] NOT NULL,
	[uidBatchID] [uniqueidentifier] NOT NULL ,
	[uidMessageID ] [uniqueidentifier] NOT NULL ,
	[uidPropID] [uniqueidentifier] NOT NULL ,
	[vtPropValue] [sql_variant] NULL
)
GO

--This table keeps track of All Active Dequeue Processes (Heart-beat)

CREATE TABLE [dbo].[ProcessHeartbeats](
	[uidProcessID] [uniqueidentifier] NOT NULL,
	[nvcApplicationName] [nvarchar](256) NOT NULL,
   	[dtCreationTime] [datetime] NOT NULL DEFAULT (GetUTCDate()),
   	[dtLastHeartbeatTime] [datetime] NOT NULL DEFAULT (GetUTCDate()),
   	[dtNextHeartbeatTime] [datetime] NOT NULL DEFAULT (GetUTCDate())
)
GO

CREATE TABLE [dbo].[LocalizedErrorStrings] (
	[nID] [int] NOT NULL,
	[nvcError] [nvarchar](256) NOT NULL
)
GO

declare @localized_string_SuspendInstanceErrorMessage nvarchar(256)
set @localized_string_SuspendInstanceErrorMessage = N'Service instance was suspended because the corresponding service (orchestration, sendport, ...) was in the stopped state. Instance can be resumed after corresponding service is started.'
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (1, @localized_string_SuspendInstanceErrorMessage)

declare @localized_string_SuspendMessageErrorMessage nvarchar(256)
set @localized_string_SuspendMessageErrorMessage = N'Activation message was suspended because the corresponding service (orchestration, sendport, ...) was in the stopped state.'
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (2, @localized_string_SuspendMessageErrorMessage)

declare @localized_string_RoutingFailureErrorMessage nvarchar(256)
set @localized_string_RoutingFailureErrorMessage = N'This service instance exists to help debug routing failures for instance "%i". The context of the message associated with this instance contains all the promoted properties at the time of the routing failure.'
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (3, @localized_string_RoutingFailureErrorMessage)

declare @localized_string_AdminSuspendedInstanceErrorMessage nvarchar(256)
set @localized_string_AdminSuspendedInstanceErrorMessage = N'This service instance was suspended by a BizTalk administrator.'
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (4, @localized_string_AdminSuspendedInstanceErrorMessage)
GO

declare @localized_string_ZombieInstance nvarchar (256)
set @localized_string_ZombieInstance = N'The instance completed without consuming all of its messages. The instance and its unconsumed messages have been suspended.'
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (5, @localized_string_ZombieInstance)
GO

declare @localized_string_OperatorAccessFailure nvarchar (256)
set @localized_string_OperatorAccessFailure = N'BizTalk operators do not have permission to execute this method.'
INSERT INTO LocalizedErrorStrings (nID, nvcError) VALUES (6, @localized_string_OperatorAccessFailure)
GO
--*********************************************************************
--*
--END CREATE TABLES
--*********************************************************************

--*********************************************************************
--*
--GRANT PRIVLEDGES ON THE TABLES
--*********************************************************************

--for the HAT dynamic queries, we need to support direct reading from certain tables so we have to grant explicit select privledges
GRANT SELECT ON [Instances] TO BTS_ADMIN_USERS
GRANT SELECT ON [InstancesPendingOperations] TO BTS_ADMIN_USERS
--imgContext field can be accessed by BTS_ADMIN_USERS
GRANT SELECT ON [Spool] TO BTS_ADMIN_USERS
GO

--for the Operations dynamic queries, we need to support direct reading from certain tables so we have to grant explicit select privileges
--Perms for the Applications table is in msgbox_application_schema file
GRANT SELECT ON [InstancesSuspended] TO BTS_ADMIN_USERS
GRANT SELECT ON [Modules] TO BTS_ADMIN_USERS
GRANT SELECT ON [Services] TO BTS_ADMIN_USERS
GRANT SELECT ON [Subscription] TO BTS_ADMIN_USERS
GRANT SELECT ON [OperationsProgress] TO BTS_ADMIN_USERS 
GRANT SELECT ON [InstancesOperatedOn] TO BTS_ADMIN_USERS 

GRANT SELECT ON [Instances] TO BTS_OPERATORS
GRANT SELECT ON [InstancesPendingOperations] TO BTS_OPERATORS
GRANT SELECT ON [InstancesSuspended] TO BTS_OPERATORS 
GRANT SELECT ON [Modules] TO BTS_OPERATORS
GRANT SELECT ON [Services] TO BTS_OPERATORS
GRANT SELECT ON [Subscription] TO BTS_OPERATORS
GRANT SELECT ON [OperationsProgress] TO BTS_OPERATORS 
GRANT SELECT ON [InstancesOperatedOn] TO BTS_OPERATORS 
--exclude the imgContext field as this is considered sensitive for BTS_OPERATORS
GRANT SELECT ON [Spool](uidMessageID, UserName, PublishingServer, OriginatorSID, OriginatorPID, dtTimeStamp, dtExpiration, nvcMessageType, nNumParts, uidBodyPartID, nvcBodyPartName, nCounter) TO BTS_OPERATORS
GO

--*********************************************************************
--*
--CREATE VIEWS
--*********************************************************************
CREATE VIEW [dbo].[btsv_LocalDate]
AS
	SELECT GetDate() AS LocalDate
GO

CREATE VIEW [dbo].[btsv_UTCDate]
AS
	SELECT GetUTCDate() AS UTCDate
GO

CREATE VIEW [dbo].[btsv_ActivationSubscription]
AS
SELECT
	nID,
	dtTimeStamp,
	nvcName,
	uidSubID,
	uidSubGroupID,
	snGroupPriority,
	nvcApplicationName,
	uidClassID,
	dtStartWindow,
	dtEndWindow,
	dtValid,
	uidServiceID,
	uidInstanceID,
	uidPortID,
	uidPredicateGroupID,
	fEnabled,
	uidConvoySetID,
	vtConvoySetProp1DefVal,
	vtConvoySetProp2DefVal,
	vtConvoySetProp3DefVal,
	snPartRetrieval,
	fOrderedDelivery,
	fIsRequestResponse,
	fCanActivateConvoySet,
	uidAppInstanceID,
	uidDBOwnerID,
	snPriority
FROM
	Subscription WITH (READCOMMITTED)
WHERE
	uidInstanceID IS NULL
GO
GRANT SELECT ON [dbo].[btsv_ActivationSubscription] TO BTS_ADMIN_USERS
GO

--*********************************************************************
--*
--END CREATE VIEWS
--*********************************************************************


--*********************************************************************
--*
-- CREATE TRIGGERS
--*********************************************************************

--triggers are BAD. :(

--*********************************************************************
--*
--END CREATE TRIGGERS
--*********************************************************************

--*********************************************************************
--*
--CREATE INDICES
--*********************************************************************

 CREATE  UNIQUE CLUSTERED  INDEX [CIX_Instances] ON [dbo].[Instances]([uidInstanceID]) 
GO

CREATE  NONCLUSTERED INDEX [IX_Instances_Process] ON [dbo].[Instances]([uidProcessID], [uidActivationID], [uidInstanceID]) 
GO

CREATE  NONCLUSTERED INDEX [IX_Instances_MBOM] ON [dbo].[Instances]([dtCreated], [uidClassID], [uidServiceID], [uidInstanceID], [uidAppOwnerID]) 
GO

CREATE  UNIQUE CLUSTERED  INDEX [CIX_InstancesPendingOperations] ON [dbo].[InstancesPendingOperations]([uidInstanceID]) 
GO

 CREATE  CLUSTERED INDEX [CIX_InstancesSuspended_State] ON [dbo].[InstancesSuspended]([uidClassID], [nState])
GO

 CREATE  NONCLUSTERED INDEX [IX_InstancesSuspended_UserState] ON [dbo].[InstancesSuspended]([nvcUserState], [dtCreated], [uidInstanceID]) 
GO

 CREATE  UNIQUE NONCLUSTERED  INDEX [IX_InstancesSuspended_InstanceID] ON [dbo].[InstancesSuspended]([uidInstanceID],[uidAppOwnerID]) 
GO

--CREATE  NONCLUSTERED INDEX [IX_InstancesSuspended_Process] ON [dbo].[InstancesSuspended]([uidProcessID], [uidActivationID], [uidInstanceID]) 
--GO

--CREATE  NONCLUSTERED INDEX [IX_InstancesSuspended_MBOM] ON [dbo].[InstancesSuspended]([dtCreated], [uidClassID], [uidServiceID], [uidInstanceID], [uidAppOwnerID]) 
--GO

CREATE CLUSTERED INDEX [CIX_OperationsProgress] ON [dbo].[OperationsProgress]([uidAccessorID])
GO

CREATE CLUSTERED INDEX [CIX_InstancesOperatedOn] ON [dbo].[InstancesOperatedOn]([uidAccessorID])
GO 

CREATE NONCLUSTERED INDEX [IX_InstancesOperatedOn_Instance] ON [dbo].[InstancesOperatedOn]([uidInstanceID], [snOperation], [nvcHostName])
GO 

 CREATE  UNIQUE CLUSTERED  INDEX [IX_Spool] ON [dbo].[Spool]([uidMessageID ]) 
GO

 CREATE  NONCLUSTERED INDEX [IX_Spool_DateTime] ON [dbo].[Spool]([dtTimeStamp]) 
GO

 CREATE  CLUSTERED  INDEX [CIX_MessageRefCountLog1] ON [dbo].[MessageRefCountLog1]([uidMessageID ]) 
GO

 CREATE  CLUSTERED  INDEX [CIX_MessageRefCountLog2] ON [dbo].[MessageRefCountLog2]([uidMessageID ]) 
GO

 CREATE  UNIQUE CLUSTERED  INDEX [CIX_MessageRefCountLogTotals] ON [dbo].[MessageRefCountLogTotals]([uidMessageID ]) 
GO

 CREATE  NONCLUSTERED  INDEX [IX_MessageRefCountLogTotals] ON [dbo].[MessageRefCountLogTotals]([snRefCount], [tnLastTable]) 
GO

 CREATE  CLUSTERED  INDEX [CIX_PartRefCountLog1] ON [dbo].[PartRefCountLog1]([uidPartID]) 
GO

 CREATE  CLUSTERED  INDEX [CIX_PartRefCountLog2] ON [dbo].[PartRefCountLog2]([uidPartID]) 
GO

 CREATE  UNIQUE CLUSTERED  INDEX [CIX_PartRefCountLogTotals] ON [dbo].[PartRefCountLogTotals]([uidPartID]) 
GO

 CREATE  UNIQUE CLUSTERED  INDEX [CIX_MessageZeroSum] ON [dbo].[MessageZeroSum]([nID]) 
GO

 CREATE  UNIQUE CLUSTERED  INDEX [CIX_PartZeroSum] ON [dbo].[PartZeroSum]([nID]) 
GO

 CREATE  UNIQUE CLUSTERED  INDEX [CIX_ActiveRefCountLog] ON [dbo].[ActiveRefCountLog]([fType]) 
GO

 CREATE  UNIQUE CLUSTERED  INDEX [CIX_TruncateRefCountLog] ON [dbo].[TruncateRefCountLog]([fType]) 
GO

CREATE  UNIQUE CLUSTERED  INDEX [IX_Parts] ON [dbo].[Parts]([uidPartID]) 
GO

CREATE  UNIQUE CLUSTERED  INDEX [IX_Fragments] ON [dbo].[Fragments]([uidPartID], [nFragmentNumber]) 
GO

CREATE  CLUSTERED  INDEX [IX_MessagePredicates] ON [dbo].[MessagePredicates]([uidMessageID ], [uidBatchID]) 
GO

CREATE  UNIQUE CLUSTERED  INDEX [CIX_MessageParts] ON [dbo].[MessageParts]([uidMessageID], [uidPartID]) WITH IGNORE_DUP_KEY 
GO

CREATE  UNIQUE CLUSTERED  INDEX [CIX_MessageProps] ON [MessageProps]([uidBatchID], [uidMessageID ], [uidPropID], [vtPropValue]) WITH IGNORE_DUP_KEY 
GO

CREATE  CLUSTERED INDEX [CIX_Subscription] ON [dbo].[Subscription]([uidPredicateGroupID]) 
GO

CREATE  UNIQUE NONCLUSTERED INDEX [IX_Subscription_1] ON [dbo].[Subscription]([uidSubID], [uidDBOwnerID]) 
GO

CREATE  UNIQUE NONCLUSTERED INDEX [IX_Subscription_2] ON [dbo].[Subscription]([uidServiceID], [uidInstanceID], [uidSubID]) 
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_UniqueSubscription] ON [dbo].[UniqueSubscription]([uidInstanceID], [uidSubscriptionID])
GO

CREATE UNIQUE INDEX [IX_UniqueSubscription] ON [dbo].[UniqueSubscription]([nvcName]) WITH IGNORE_DUP_KEY 
GO

CREATE  UNIQUE CLUSTERED INDEX [CIX_PredicateGroup] ON [dbo].[PredicateGroup]([uidPredicateANDGroupID], [nNumFirstPassPredicates]) 
GO

CREATE  UNIQUE NONCLUSTERED INDEX [IX_PredicateGroup] ON [dbo].[PredicateGroup]([uidPredicateORGroupID], [fIsDistributionList], [uidPredicateANDGroupID]) 
GO

CREATE  CLUSTERED INDEX [CIX_PredicateGroupNames] ON [dbo].[PredicateGroupNames]([uidPredicateGroupID]) 
GO

CREATE  CLUSTERED INDEX [CIX_FirstPassPredicates] ON [dbo].[FirstPassPredicates]([uidBatchID], [uidMessageID ], [uidPredicateGroupID]) 
GO

CREATE  CLUSTERED INDEX [CIX_EqualsPredicates] ON [dbo].[EqualsPredicates]([uidPropID], [vtValue]) 
GO

CREATE  INDEX [IX_EqualsPredicates] ON [dbo].[EqualsPredicates]([uidPredicateGroupID]) 
GO

CREATE  CLUSTERED INDEX [CIX_EqualsPredicates2ndPass] ON [dbo].[EqualsPredicates2ndPass]([uidPredicateGroupID]) 
GO

CREATE  CLUSTERED INDEX [CIX_LessThanPredicates] ON [dbo].[LessThanPredicates]([tnPass], [uidPropID], [vtValue]) 
GO

CREATE  INDEX [IX_LessThanPredicates] ON [dbo].[LessThanPredicates]([uidPredicateGroupID], [tnPass], [uidPropID], [vtValue]) 
GO

CREATE  CLUSTERED INDEX [CIX_LessThanOrEqualsPredicates] ON [dbo].[LessThanOrEqualsPredicates]([tnPass], [uidPropID], [vtValue]) 
GO

CREATE  INDEX [IX_LessThanOrEqualsPredicates] ON [dbo].[LessThanOrEqualsPredicates]([uidPredicateGroupID], [tnPass], [uidPropID], [vtValue]) 
GO

CREATE  CLUSTERED INDEX [CIX_GreaterThanPredicates] ON [dbo].[GreaterThanPredicates]([tnPass], [uidPropID], [vtValue]) 
GO

CREATE  INDEX [IX_GreaterThanPredicates] ON [dbo].[GreaterThanPredicates]([uidPredicateGroupID], [tnPass], [uidPropID], [vtValue]) 
GO

CREATE  CLUSTERED INDEX [CIX_GreaterThanOrEqualsPredicates] ON [dbo].[GreaterThanOrEqualsPredicates]([tnPass], [uidPropID], [vtValue]) 
GO

CREATE  INDEX [IX_GreaterThanOrEqualsPredicates] ON [dbo].[GreaterThanOrEqualsPredicates]([uidPredicateGroupID], [tnPass], [uidPropID], [vtValue]) 
GO

CREATE  CLUSTERED INDEX [CIX_NotEqualsPredicates] ON [dbo].[NotEqualsPredicates]([tnPass], [uidPropID], [vtValue]) 
GO

CREATE  INDEX [IX_NotEqualsPredicates] ON [dbo].[NotEqualsPredicates]([uidPredicateGroupID], [tnPass], [uidPropID], [vtValue]) 
GO

CREATE  CLUSTERED INDEX [CIX_ExistsPredicates] ON [dbo].[ExistsPredicates]([tnPass], [uidPropID]) 
GO

CREATE  INDEX [IX_ExistsPredicates] ON [dbo].[ExistsPredicates]([uidPredicateGroupID], [tnPass], [uidPropID]) 
GO

CREATE  CLUSTERED INDEX [CIX_BitwiseANDPredicates] ON [dbo].[BitwiseANDPredicates]([tnPass], [uidPropID], [vtValue]) 
GO

CREATE  INDEX [IX_BitwiseANDPredicates] ON [dbo].[BitwiseANDPredicates]([uidPredicateGroupID], [tnPass], [uidPropID], [vtValue]) 
GO

CREATE  UNIQUE CLUSTERED INDEX [CIX_ConvoySetInstances] ON [dbo].[ConvoySetInstances]([uidConvoySetID], [vtProp1], [vtProp2], [vtProp3]) WITH IGNORE_DUP_KEY 
GO

CREATE  INDEX [IX_ConvoySetInstances] ON [dbo].[ConvoySetInstances]([uidInstanceID], [uidConvoySetID], [fEnabled]) 
GO

CREATE  INDEX [IX2_ConvoySetInstances] ON [dbo].[ConvoySetInstances]([nID], [uidActivatingMessageID], [uidInstanceID], [uidDatabaseID]) 
GO

CREATE  CLUSTERED INDEX [CIX_ConvoySets] ON [dbo].[ConvoySets]([uidConvoySetID]) 
GO

CREATE CLUSTERED INDEX [CIX_ProcessHeartbeats] ON [dbo].[ProcessHeartbeats]( [uidProcessID] )
GO

CREATE CLUSTERED INDEX [CIX_PredicateGroupZeroSum1] ON [dbo].[PredicateGroupZeroSum1]([uidPredicateANDGroupID]) 
GO

CREATE CLUSTERED INDEX [CIX_PredicateGroupZeroSum2] ON [dbo].[PredicateGroupZeroSum2]([uidPredicateANDGroupID])
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Services] ON [dbo].[Services]( [uidServiceID] )
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_Modules] ON [dbo].[Modules]( [nModuleID] )
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Modules] ON [dbo].[Modules]( [nvcName] ) WITH IGNORE_DUP_KEY 
GO

--*********************************************************************
--*
--END CREATE INDICES
--*********************************************************************

sp_configure 'show advanced options', 1
GO

RECONFIGURE WITH OVERRIDE
GO

sp_configure 'max degree of parallelism', 1
GO

RECONFIGURE WITH OVERRIDE
GO

declare @dbName sysname
set @dbName = DB_NAME()
EXEC ('ALTER DATABASE [' + @dbName + '] SET AUTO_CREATE_STATISTICS OFF')
GO

declare @dbName sysname
set @dbName = DB_NAME()
EXEC ('ALTER DATABASE [' + @dbName + '] SET AUTO_UPDATE_STATISTICS OFF')
GO

EXEC sp_indexoption '[dbo].[Instances]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[InstancesPendingOperations]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[InstancesSuspended]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[OperationsProgress]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[InstancesOperatedOn]', 'disallowpagelocks', TRUE
GO 

EXEC sp_indexoption '[dbo].[Spool]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Fragments]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Parts]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[MessagePredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[MessageParts]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[MessageProps]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[ProcessHeartbeats]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[MessageRefCountLog1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[MessageRefCountLog2]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[MessageRefCountLogTotals]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PartRefCountLog1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PartRefCountLog2]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PartRefCountLogTotals]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[ActiveRefCountLog]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[MessageZeroSum]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PartZeroSum]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PredicateGroupZeroSum1]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PredicateGroupZeroSum2]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Subscription]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[UniqueSubscription]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[FirstPassPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[EqualsPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[EqualsPredicates2ndPass]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[ExistsPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[LessThanPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[LessThanOrEqualsPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[GreaterThanPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[GreaterThanOrEqualsPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[NotEqualsPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[BitwiseANDPredicates]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PredicateGroup]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[PredicateGroupNames]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[ConvoySets]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[ConvoySetInstances]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[ServiceClasses]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Modules]', 'disallowpagelocks', TRUE
GO

EXEC sp_indexoption '[dbo].[Services]', 'disallowpagelocks', TRUE
GO

-- This role is specific to the MsgBox, which is the reason why it is not defined in BTS_Security_Logic.sql
-- BTS_SQLAGENT_USER role is to allow SQL agent jobs running on messageboxes on remote servers
-- to update corresponding records on the master msgbox when (bulk) suspend/resume/terminate 
-- operations are performed on instances on the remote messagebox(es) from the Group Hub
-- page in the Admin Console.
--
-- Note that no users are added to this role - adding users to this will be a manual post 
-- install step.
--
-- NOTE: DO NOT add an s to this role name and do not make it bts_sqlagent_users - doing so will
-- cause naming conflicts when adding a BTS host if that host is named sqlagent and will necessitate
-- updating code elsewhere in the Agent. This role should only have one user and so the single form
-- is appropriate.

if not exists (select * from sysusers where name = N'BTS_SQLAGENT_USER' and issqlrole = 1)
	EXEC sp_addrole N'BTS_SQLAGENT_USER'
GO


