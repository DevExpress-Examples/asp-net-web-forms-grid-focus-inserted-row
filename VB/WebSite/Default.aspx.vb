Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Xpo
Imports DevExpress.Web.Data
Imports System.Collections

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private uof As UnitOfWork = XpoHelper.GetNewUnitOfWork()
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		XpoDataSource1.Session = uof
	End Sub

	Protected Sub grid_RowInserted(ByVal sender As Object, ByVal e As ASPxDataInsertedEventArgs)
		Dim newKey As Object = Nothing
		If e.AffectedRecords = 1 Then
			Dim objects As ICollection = uof.GetObjectsToSave()
			If objects IsNot Nothing AndAlso objects.Count = 1 Then
				Dim enumeration As IEnumerator = objects.GetEnumerator()
				enumeration.MoveNext()
				Dim obj As Customer = CType(enumeration.Current, Customer)
				uof.CommitChanges()
				newKey = obj.Oid
			End If
		End If
		grid.FocusedRowIndex = grid.FindVisibleIndexByKeyValue(newKey)
	End Sub
End Class
