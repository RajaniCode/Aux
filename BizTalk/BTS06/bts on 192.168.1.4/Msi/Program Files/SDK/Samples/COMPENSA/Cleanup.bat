@REM --------------------------------------------------------------------
@REM File: Cleanup.bat
@REM
@REM Summary: Calls scripts and programs to stop and undeploy the sample.
@REM
@REM Sample: Hello World
@REM
@REM --------------------------------------------------------------------
@REM This file is part of the Microsoft BizTalk Server 2006 SDK
@REM
@REM Copyright (c) Microsoft Corporation. All rights reserved.
@REM
@REM This source code is intended only as a supplement to Microsoft BizTalk
@REM Server 2006 release and/or on-line documentation. See these other
@REM materials for detailed information regarding Microsoft code samples.
@REM
@REM THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
@REM KIND, WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
@REM IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
@REM PURPOSE.
@REM --------------------------------------------------------------------

@SETLOCAL

@CALL "%VS80COMNTOOLS%vsvars32.bat"

@SET OrchestrationName=Microsoft.Samples.BizTalk.Compensation.UpdateContact
@SET AssemblyName=CompensationOrchestration
@SET SendPortName=ToCustomerSendPort
@SET ReceivePortName=WebPort_CompensationOrchestrationWebServiceProxy/Microsoft_Samples_BizTalk_Compensation_UpdateContact_FromCustomer
@SET WebServiceName=CompensationOrchestrationWebServiceProxy
@SET SampleDatabase=BTSCompensationSampleMailingList

@ECHO.
@ECHO Calling the WMI script to stop and unenlist the orchestration...

@CScript /NoLogo "..\..\Admin\WMI\Stop Orchestration\VBScript\StopOrch.vbs" %OrchestrationName% %AssemblyName% Unenlist

@ECHO.
@ECHO Undeploying the assembly...

@BTSDeploy Remove Assembly=bin\Development\%AssemblyName%.dll Uninstall=True Log=Undeploy

@ECHO.
@ECHO Calling the WMI script to remove the send port...

@CScript /NoLogo "..\..\Admin\WMI\Remove Send Port\VBScript\RemoveSendPort.vbs" %SendPortName%

@ECHO.
@ECHO Calling the WMI script to remove the receive port...

@CScript /NoLogo "..\..\Admin\WMI\Remove Receive Port\VBScript\RemoveReceivePort.vbs" %ReceivePortName%

@ECHO.
@ECHO Removing assemblies from the GAC...
@gacutil -uf updatecrm
@gacutil -uf updatemailinglist

@ECHO.
@ECHO Removing sample database...
@osql -E -Q "DROP DATABASE %SampleDatabase%"

@ECHO.
@ECHO Removing sample web wervice...
@CScript /NoLogo "RemoveVirDir.vbs" %WebServiceName%
@ECHO.

@ENDLOCAL

@PAUSE