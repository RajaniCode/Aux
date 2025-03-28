﻿' ----------------------------------------------------------------------------------
' Microsoft Developer & Platform Evangelism
' 
' Copyright (c) Microsoft Corporation. All rights reserved.
' 
' THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
' EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES 
' OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
' ----------------------------------------------------------------------------------
' The example companies, organizations, products, domain names,
' e-mail addresses, logos, people, places, and events depicted
' herein are fictitious.  No association with any real company,
' organization, product, domain name, email address, logo, person,
' places, or events is intended or should be inferred.
' ----------------------------------------------------------------------------------



#Region "Models"
<PropertiesMustMatch("NewPassword",
    "ConfirmPassword",
    ErrorMessage:="The new password and confirmation password do not match.")>
Public Class ChangePasswordModel
    <Required(), DataType(DataType.Password), DisplayName("Current password")>
    Public Property OldPassword As String

    <Required(), ValidatePasswordLength(), DataType(DataType.Password), DisplayName("New password")>
    Public Property NewPassword As String

    <Required(), DataType(DataType.Password), DisplayName("Confirm new password")>
    Public Property ConfirmPassword As String
End Class

Public Class LogOnModel
    <Required(), DisplayName("User name")>
    Public Property UserName As String

    <Required(), DataType(DataType.Password), DisplayName("Password")>
    Public Property Password As String

    <DisplayName("Remember me?")>
    Public Property RememberMe As Boolean
End Class

<PropertiesMustMatch("Password",
    "ConfirmPassword",
    ErrorMessage:="The password and confirmation password do not match.")>
Public Class RegisterModel
    <Required(), DisplayName("User name")>
    Public Property UserName As String

    <Required(), DataType(DataType.EmailAddress), DisplayName("Email address")>
    Public Property Email As String

    <Required(), ValidatePasswordLength(), DataType(DataType.Password), DisplayName("Password")>
    Public Property Password As String

    <Required(), DataType(DataType.Password), DisplayName("Confirm password")>
    Public Property ConfirmPassword As String
End Class
#End Region

#Region "Services"
'The FormsAuthentication type is sealed and contains static members, so it is difficult to
'unit test code that calls its members. The interface and helper class below demonstrate
'how to create an abstract wrapper around such a type in order to make the AccountController
'code unit testable.

Public Interface IMembershipService
    ReadOnly Property MinPasswordLength As Integer

    Function ValidateUser(ByVal userName As String,ByVal password As String) As Boolean

    Function CreateUser(ByVal userName As String, ByVal password As String, ByVal email As String) As MembershipCreateStatus

    Function ChangePassword(ByVal userName As String,ByVal oldPassword As String, ByVal newPassword As String) As Boolean

End Interface

Public Class AccountMembershipService
    Implements IMembershipService

    Private ReadOnly _provider As MembershipProvider

    Public Sub New()
        Me.New(Nothing)
    End Sub

    Public Sub New(ByVal provider As MembershipProvider)
        _provider = If(provider, Membership.Provider)
    End Sub

    Public ReadOnly Property MinPasswordLength As Integer Implements IMembershipService.MinPasswordLength
        Get
            Return _provider.MinRequiredPasswordLength
        End Get
    End Property

    Public Function ValidateUser(ByVal userName As String, ByVal password As String) _
        As Boolean Implements IMembershipService.ValidateUser

        If String.IsNullOrEmpty(userName) Then
            Throw New ArgumentException("Value cannot be null or empty.", "userName")
        End If
        If String.IsNullOrEmpty(password) Then
            Throw New ArgumentException("Value cannot be null or empty.", "password")
        End If

        Return _provider.ValidateUser(userName, password)
    End Function

    Public Function CreateUser(ByVal userName As String, ByVal password As String, ByVal email As String) _
        As MembershipCreateStatus Implements IMembershipService.CreateUser

        If String.IsNullOrEmpty(userName) Then
            Throw New ArgumentException("Value cannot be null or empty.", "userName")
        End If
        If String.IsNullOrEmpty(password) Then
            Throw New ArgumentException("Value cannot be null or empty.", "password")
        End If
        If String.IsNullOrEmpty(email) Then
            Throw New ArgumentException("Value cannot be null or empty.", "email")
        End If

        Dim status As MembershipCreateStatus
        _provider.CreateUser(userName, password, email, Nothing, Nothing, True, Nothing, status)
        Return status
    End Function

    Public Function ChangePassword(ByVal userName As String, ByVal oldPassword As String, ByVal newPassword As String) _
        As Boolean Implements IMembershipService.ChangePassword

        If String.IsNullOrEmpty(userName) Then
            Throw New ArgumentException("Value cannot be null or empty.", "userName")
        End If
        If String.IsNullOrEmpty(oldPassword) Then
            Throw New ArgumentException("Value cannot be null or empty.", "oldPassword")
        End If
        If String.IsNullOrEmpty(newPassword) Then
            Throw New ArgumentException("Value cannot be null or empty.", "newPassword")
        End If

        'The underlying ChangePassword() will throw an exception rather
        'than return false in certain failure scenarios.
        Try
            'userIsOnline
            Dim currentUser = _provider.GetUser(userName, True)
            Return currentUser.ChangePassword(oldPassword, newPassword)
        Catch e1 As ArgumentException
            Return False
        Catch e2 As MembershipPasswordException
            Return False
        End Try

    End Function
End Class

Public Interface IFormsAuthenticationService

    Sub SignIn(ByVal userName As String,
               ByVal createPersistentCookie As Boolean)
    Sub SignOut()

End Interface

Public Class FormsAuthenticationService
    Implements IFormsAuthenticationService

    Public Sub SignIn(ByVal userName As String, ByVal createPersistentCookie As Boolean) Implements IFormsAuthenticationService.SignIn

        If String.IsNullOrEmpty(userName) Then
            Throw New ArgumentException("Value cannot be null or empty.", "userName")
        End If

        FormsAuthentication.SetAuthCookie(userName, createPersistentCookie)
    End Sub

    Public Sub SignOut() Implements IFormsAuthenticationService.SignOut
        FormsAuthentication.SignOut()
    End Sub
End Class
#End Region

#Region "Validation"
Public NotInheritable Class AccountValidation
    Private Sub New()
    End Sub
    Public Shared Function ErrorCodeToString(ByVal createStatus As MembershipCreateStatus) As String
        'See http://go.microsoft.com/fwlink/?LinkID=177550 for
        'a full list of status codes.
        Select Case createStatus
            Case MembershipCreateStatus.DuplicateUserName
                Return "Username already exists. Please enter a different user name."

            Case MembershipCreateStatus.DuplicateEmail
                Return "A username for that e-mail address already exists. Please enter a different e-mail address."

            Case MembershipCreateStatus.InvalidPassword
                Return "The password provided is invalid. Please enter a valid password value."

            Case MembershipCreateStatus.InvalidEmail
                Return "The e-mail address provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidAnswer
                Return "The password retrieval answer provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidQuestion
                Return "The password retrieval question provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidUserName
                Return "The user name provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.ProviderError
                Return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator."

            Case MembershipCreateStatus.UserRejected
                Return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator."

            Case Else
                Return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator."
        End Select
    End Function
End Class

<AttributeUsage(AttributeTargets.Class, AllowMultiple:=True, Inherited:=True)>
Public NotInheritable Class PropertiesMustMatchAttribute
    Inherits ValidationAttribute
    Private Const _defaultErrorMessage = "'{0}' and '{1}' do not match."
    Private ReadOnly _typeId As New Object

    Public Sub New(ByVal originalProperty As String, ByVal confirmProperty As String)
        MyBase.New(_defaultErrorMessage)
        Me.OriginalProperty = originalProperty
        Me.ConfirmProperty = confirmProperty
    End Sub

    Private _ConfirmProperty As String
    Public Property ConfirmProperty As String
        Get
            Return _ConfirmProperty
        End Get
        Private Set(ByVal value As String)
            _ConfirmProperty = value
        End Set
    End Property

    Private _OriginalProperty As String
    Public Property OriginalProperty As String

        Get
            Return _OriginalProperty
        End Get
        Private Set(ByVal value As String)
            _OriginalProperty = value
        End Set
    End Property

    Public Overrides ReadOnly Property TypeId As Object
        Get
            Return _typeId
        End Get
    End Property

    Public Overrides Function FormatErrorMessage(ByVal name As String) As String

        Return String.Format(CultureInfo.CurrentUICulture,ErrorMessageString,OriginalProperty,ConfirmProperty)

    End Function

    Public Overloads Overrides Function IsValid(ByVal value As Object) As Boolean

        Dim properties As PropertyDescriptorCollection = TypeDescriptor.GetProperties(value)
        'ignoreCase
        Dim originalValue As Object = properties.Find(OriginalProperty, True).GetValue(value)
        'ignoreCase
        Dim confirmValue As Object = properties.Find(ConfirmProperty, True).GetValue(value)
        Return Object.Equals(originalValue, confirmValue)

    End Function
End Class

<AttributeUsage(AttributeTargets.Field Or AttributeTargets.Property,
    AllowMultiple:=False,
    Inherited:=True)>
Public NotInheritable Class ValidatePasswordLengthAttribute
    Inherits ValidationAttribute

    Private Const _defaultErrorMessage = "'{0}' must be at least {1} characters long."
    Private ReadOnly _minCharacters As Integer = Membership.Provider.MinRequiredPasswordLength

    Public Sub New()
        MyBase.New(_defaultErrorMessage)
    End Sub

    Public Overrides Function FormatErrorMessage(ByVal name As String) As String
        Return String.Format(CultureInfo.CurrentUICulture, ErrorMessageString, name, _minCharacters)
    End Function

    Public Overloads Overrides Function IsValid(ByVal value As Object) As Boolean

        Dim valueAsString = TryCast(value, String)
        Return (valueAsString IsNot Nothing AndAlso valueAsString.Length >= _minCharacters)

    End Function
End Class
#End Region


