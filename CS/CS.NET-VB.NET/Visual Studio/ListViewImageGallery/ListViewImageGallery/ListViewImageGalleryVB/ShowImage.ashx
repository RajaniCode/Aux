﻿<%@ WebHandler Language="vb" Class="ShowImage" %>

Imports System
Imports System.Configuration
Imports System.Web
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Public Class ShowImage
	Implements IHttpHandler
	Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
		Dim picid As Int32
		If Not context.Request.QueryString("id") Is Nothing Then
			picid = Convert.ToInt32(context.Request.QueryString("id"))
		Else
			Throw New ArgumentException("No parameter specified")
		End If

		context.Response.ContentType = "image/jpeg"
		Dim strm As Stream = ShowAlbumImage(picid)
		Dim buffer As Byte() = New Byte(4095){}
		Dim byteSeq As Integer = strm.Read(buffer, 0, 4096)

		Do While byteSeq > 0
			context.Response.OutputStream.Write(buffer, 0, byteSeq)
			byteSeq = strm.Read(buffer, 0, 4096)
		Loop
		'context.Response.BinaryWrite(buffer);
	End Sub

	Public Function ShowAlbumImage(ByVal picid As Integer) As Stream
		Dim conn As String = ConfigurationManager.ConnectionStrings("albumConnString").ConnectionString
		Dim connection As SqlConnection = New SqlConnection(conn)
		Dim sql As String = "SELECT pic FROM Album WHERE Pic_ID = @ID"
		Dim cmd As SqlCommand = New SqlCommand(sql, connection)
		cmd.CommandType = CommandType.Text
		cmd.Parameters.AddWithValue("@ID", picid)
		connection.Open()
		Dim img As Object = cmd.ExecuteScalar()
		Try
			Return New MemoryStream(CType(img, Byte()))
		Catch
			Return Nothing
		Finally
			connection.Close()
		End Try
	End Function

	Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
		Get
			Return False
		End Get
	End Property


End Class
