--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 

/******************************************************************************\
||||||||||||||||||||||||||||| btf_message_receiver |||||||||||||||||||||||||||||
\******************************************************************************/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[btf_message_receiver]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	PRINT 'Dropping table btf_message_receiver'
	DROP TABLE [dbo].[btf_message_receiver]
END
GO

PRINT 'Creating Table [dbo].[btf_message_receiver]'
CREATE TABLE [dbo].[btf_message_receiver] (
		[identity]		[varchar](256)	NOT NULL,
		[expires_at]	[datetime]		NOT NULL
)
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_BTF_Receiver] ON [dbo].[btf_message_receiver]( [identity] ) WITH IGNORE_DUP_KEY
GO

exec sp_addextendedproperty N'MS_Description', N'BizTalk framework pipeline component message tracking table for receiver', N'user', N'dbo', N'table', N'btf_message_receiver'

/******************************************************************************\
||||||||||||||||||||||||||||||| btf_message_sender |||||||||||||||||||||||||||||
\******************************************************************************/

/****** Object:  Table [dbo].[btf_message_sender]	Script Date: 2/6/2003 6:39:15 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[btf_message_sender]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	begin
		print 'Dropping Table btf_message_sender'
		drop table [dbo].[btf_message_sender]
	end
GO

PRINT 'Creating Table [dbo].[btf_message_sender]'
CREATE TABLE [dbo].[btf_message_sender] (
		[identity]		[varchar](256)	NOT NULL,
		[expires_at]	[datetime]		NOT NULL,
		[acknowledged]	[char](1)		NOT NULL
)
GO

CREATE UNIQUE CLUSTERED INDEX [CIX_BTF_Sender] ON [dbo].[btf_message_sender]( [identity] ) WITH IGNORE_DUP_KEY
GO


exec sp_addextendedproperty N'MS_Description', N'BizTalk framework pipeline component message tracking table for sender', N'user', N'dbo', N'table', N'btf_message_sender'
