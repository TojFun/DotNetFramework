using System.Data;
using System.Data.OleDb;
using System.Web;

/// <summary>
/// מחלקה המהווה ממשק בין האפליקציה לבסיס הנתונים
/// DataBase Type: Microsoft Access
/// The Database file should be located in the folder: App_Data
/// </summary>

public class AdoHelper
{
    public AdoHelper() { }

    /// <summary>
    /// הפעולה מקבלת שם קובץ.
    /// הפעולה מייצרת ומחזירה אוביקט קישור לבסיס הנתונים
    /// </summary>
    public static OleDbConnection ConnectToDb(string fileName)
    {
        string path = HttpContext.Current.Server.MapPath("../App_Data/") + fileName; //מיקום מסד בפורוייקט
        string connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data source=" + path; //נתוני ההתחברות הכוללים מיקום וסוג המסד
        return new OleDbConnection(connString);
    }

    /// <summary>
    /// To Execute Update / Insert / Delete queries
    /// הפעולה מקבלת שם קובץ ושאילתא לביצוע.
    /// הפעולה מפעילה את השאילתא על בסיס הנתונים
    /// </summary>
    public static void DoQuery(string fileName, string sql)
    {
        var conn = ConnectToDb(fileName);
        conn.Open();
        var com = new OleDbCommand(sql, conn);
        com.ExecuteNonQuery();
        com.Dispose();
        conn.Close();
    }

    /// <summary>
    /// To Execute Update / Insert / Delete queries
    /// הפעולה מקבלת שם קובץ ושאילתא לביצוע.
    /// הפעולה מבצעת את השאילתא ומחזירה את מספר השורות שהושפעו כתוצאה מכך
    /// </summary>
    public int RowsAffected(string fileName, string sql)
    {
        var conn = ConnectToDb(fileName);
        conn.Open();
        var com = new OleDbCommand(sql, conn);
        int rowsA = com.ExecuteNonQuery();
        conn.Close();
        return rowsA;
    }

    /// <summary>
    /// הפעולה מקבלת שם קובץ ושאילתא לחיפוש ערך.
    /// הפעולה מחזירה אמת אם הערך נמצא ושקר אחרת
    /// </summary>
    public static bool DoesExist(string fileName, string sql)
    {
        var conn = ConnectToDb(fileName);
        conn.Open();
        var com = new OleDbCommand(sql, conn);
        var data = com.ExecuteReader();
        bool found = data.Read();
        conn.Close();
        return found;
    }

    /// <summary>
    /// הפעולה מקבלת שם קובץ ושאילתת שליפה. 
    /// הפעולה ממירה את הרשומות שהוחזרו לתוך אובייקט מסוג DataTable
    /// </summary>
    public static DataTable ExecuteDataTable(string fileName, string sql)
    {
        var conn = ConnectToDb(fileName);
        conn.Open();
        var tableAdapter = new OleDbDataAdapter(sql, conn);
        var dt = new DataTable();
        tableAdapter.Fill(dt);
        return dt;
    }

    /// <summary>
    /// הפעולה מקבלת שם קובץ ושאילתת שליפה. 
    /// הפעולה מבצעת את השאילתא וממירה את הרשומות שחזרו למחרוזת המכילה טבלת HTML עם הנתונים
    /// </summary>
    public static string PrintDataTable(string fileName, string sql)//הפעולה מקבלת שם קובץ ומשפט בחירת נתון ומחזירה אמת אם הנתונים קיימים ושקר אחרת
    {
        var dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {
                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";

        return printStr;
    }

    /// <summary>
    /// הפעולה מקבלת שם קובץ ושאילתת שליפה. 
    /// הפעולה מחזירה את הרשומה הראשונה מתוך הרשומות שנמצאו מתאימות
    /// </summary>
    public static object[] GetFirstRowData(string fileName, string sql)
    {
        var table = ExecuteDataTable(fileName, sql);
        if (table != null && table.Rows.Count > 0)
        {
            var row = table.Rows[0];
            if (row != null)
                return row.ItemArray;
        }
        return null;
    }

    public static DataRow GetFirstRowObject(string fileName, string sql)
    {
        var table = ExecuteDataTable(fileName, sql);
        if (table != null && table.Rows.Count > 0)
        {
            var row = table.Rows[0];
            if (row != null)
                return row;
        }
        return null;
    }

    /// <summary>
    /// הפעולה מקבלת שם קובץ, שאילתת שליפה ואינדקס שדה לשליפה. 
    /// הפעולה מחזירה את הערך לפי אינדקס השדה מתוך הרשומה הראשונה שנמצאה מתאימה
    /// </summary>
    public static string GetItemRowData(string fileName, string sql, int itemColNum)
    {
        object[] fields = AdoHelper.GetFirstRowData(fileName, sql);
        if (fields != null && itemColNum < fields.Length)
            return (string) fields[itemColNum];
        return "";
    }


}