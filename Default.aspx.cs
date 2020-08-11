using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //string s1;
    //string path;
    SqlConnection cnn = new SqlConnection();
    SqlCommand com = new SqlCommand();
    SqlDataAdapter sqlda;
    DataTable dt;
    int id;
    string name;
    string address;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
        }
    }
    private void bindgrid()
    {
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        sqlda = new SqlDataAdapter("SELECT * FROM employee ", con);
        dt = new DataTable();
        sqlda.Fill(dt);
        sqlda.Dispose();
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }
    private void clear()
    {
        txt_name.Text = "";
        txt_Add.Text = "";
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand com = new SqlCommand("insert_employee", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Connection = con;
        com.Parameters.AddWithValue("@name", txt_name.Text);
        com.Parameters.AddWithValue("@address", txt_Add.Text);
       // com.Parameters.AddWithValue("@image", s1);
        com.ExecuteNonQuery();
        com.Dispose();
        bindgrid();
        con.Close();
        clear();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        try
        {
            id = Convert.ToInt32(((Label)(GridView1.Rows[e.RowIndex].FindControl("label2"))).Text);
            SqlCommand com = new SqlCommand("delete_employee", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Connection = con;
            com.Parameters.Add("@id", SqlDbType.Int).Value = id;
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employee where id=@id", con);
            sqlda.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = id;
            DataSet ds = new DataSet();
            sqlda.Fill(ds);
            com.ExecuteNonQuery();
            com.Dispose();
            bindgrid();
        }
        catch (Exception)
        {
        }
    }
    //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    GridView1.EditIndex = e.NewEditIndex;
    //    bindgrid();
    //}
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        id = Convert.ToInt32(((Label)(GridView1.Rows[e.RowIndex].FindControl("Label1"))).Text);
        name = (((TextBox)(GridView1.Rows[e.RowIndex].FindControl("txt_name"))).Text);
        address = (((TextBox)(GridView1.Rows[e.RowIndex].FindControl("txt_Add"))).Text);
        SqlCommand com = new SqlCommand("update_employee", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Connection = con;
        com.Parameters.Add("@id", SqlDbType.Int).Value = id;
        com.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = name;
        com.Parameters.Add("@address", SqlDbType.VarChar, 50).Value = address;
        com.ExecuteNonQuery();
        com.Dispose();
        con.Close();
        GridView1.EditIndex = -1;
        bindgrid();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridView1.PageIndex = e.NewSelectedIndex;
        bindgrid();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
         bindgrid();
    }
}