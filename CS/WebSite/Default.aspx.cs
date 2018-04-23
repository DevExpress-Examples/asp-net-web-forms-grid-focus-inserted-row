using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;
using DevExpress.Web.Data;
using System.Collections;

public partial class _Default : System.Web.UI.Page {
    UnitOfWork uof = XpoHelper.GetNewUnitOfWork();
    protected void Page_Init (object sender, EventArgs e) {
        XpoDataSource1.Session = uof;
    }

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
}
