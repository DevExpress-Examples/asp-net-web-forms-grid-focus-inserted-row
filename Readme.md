<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128534272/15.1.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3588)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Grid View for ASP.NET Web Forms - How to focus the newly inserted row
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128534272/)**
<!-- run online end -->

This example demonstrates how to handle the grid's RowInserted event to focus the newly inserted row.

## Overview

After the grid adds a new row to the data source, you can get the row's key value in the grid's server-side [RowInserted](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.RowInserted) event. To focus the newly inserted row, call the grid's [FindVisibleIndexByKeyValue](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridBase.FindVisibleIndexByKeyValue(System.Object)) method to get the row's visible index and assign that index to the grid's [FocusedRowIndex](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.FocusedRowIndex) property.

```csharp
protected void grid_RowInserted (object sender, ASPxDataInsertedEventArgs e) {
    object newKey = null;
    if (e.AffectedRecords == 1) {
        ICollection objects = uof.GetObjectsToSave();
        if (objects != null && objects.Count == 1) {
            IEnumerator enumeration = objects.GetEnumerator();
            enumeration.MoveNext();
            Customer obj = (Customer)enumeration.Current;
            uof.CommitChanges();
            newKey = obj.Oid;
        }
    }
    grid.FocusedRowIndex = grid.FindVisibleIndexByKeyValue(newKey);
}
```

## Files to Review

* [MyObject.cs](./CS/WebSite/App_Code/MyObject.cs) (VB: [MyObject.vb](./VB/WebSite/App_Code/MyObject.vb))
* [XpoHelper.cs](./CS/WebSite/App_Code/XpoHelper.cs) (VB: [XpoHelper.vb](./VB/WebSite/App_Code/XpoHelper.vb))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))

## More Examples

* [Grid View for ASP.NET MVC - How to focus the newly inserted row](https://github.com/DevExpress-Examples/gridview-how-to-focus-a-newly-inserted-row-e4787)
