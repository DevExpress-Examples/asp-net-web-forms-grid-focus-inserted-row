# Grid View for ASP.NET Web Forms - How to focus the newly inserted row
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e3588/)**
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

## More examples

* [Grid View for ASP.NET MVC - How to focus the newly inserted row](https://github.com/DevExpress-Examples/gridview-how-to-focus-a-newly-inserted-row-e4787)
