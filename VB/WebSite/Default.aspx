<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v11.1.Web, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>ASPxGridView - How to focus newly inserted rows</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="XpoDataSource1"
			KeyFieldName="Oid" OnRowInserted="grid_RowInserted">
			<SettingsPager PageSize="5" />
			<SettingsBehavior AllowFocusedRow="true" />
			<Columns>
				<dx:GridViewCommandColumn VisibleIndex="0">
					<EditButton Visible="True" />
					<NewButton Visible="True" />
				</dx:GridViewCommandColumn>
				<dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="1" SortIndex="0"
					SortOrder="Ascending">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="4">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="5">
				</dx:GridViewDataTextColumn>
			</Columns>
		</dx:ASPxGridView>
		<dx:XpoDataSource ID="XpoDataSource1" runat="server" TypeName="Customer">
		</dx:XpoDataSource>
	</div>
	</form>
</body>
</html>