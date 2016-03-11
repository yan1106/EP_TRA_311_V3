using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using MySql.Data.MySqlClient;



public partial class Default : System.Web.UI.Page
{

    MySql.Data.MySqlClient.MySqlConnection conn;
    public List<string> temp_Data = new List<string>();
    public List<string> por_golden_condition = new List<string>();
    public List<string> por_golden_data = new List<string>();

    

    public string Conninf = "server=10.14.41.200;uid=new;" + "pwd=new; database=dbbu3;";
    protected void DBInit()
    {
        string strSQL = string.Format("SELECT * FROM npiimportdata");
        try
        {
            clsMySQL db = new clsMySQL(); //Connection MySQL
            clsMySQL.DBReply dr = db.QueryDS(strSQL);
            //Repeater1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
            //Repeater1.DataBind();
            db.Close();
        }
        catch (Exception ex)
        {
            lblError.Text = "Exception Error Message----  " + ex.ToString() + ">>>>>>>>>>" + strSQL;
        }
    }


    protected bool check_Customer_data(string mySQL, string ConnStr)
    {
        string TableFild = "";
        int FieldCunt = 0;
        bool sign = false;
        int i;
        List<string> Customerdata = new List<string>();

        MySqlConnection MySqlConn = new MySqlConnection(ConnStr);
        MySqlConn.Open();

        
        

        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        MySqlDataReader SelData4 = MySqlCmd.ExecuteReader();
        
        while (SelData4.Read())
        {
           

            TableFild = SelData4.GetString(FieldCunt);
            Customerdata.Add(TableFild);
            FieldCunt++;

        }

        SelData4.Close();
        MySqlConn.Close();
       

        for (i = 0; i < FieldCunt; i++) {
            if (Customer_TB.Text == Customerdata[i])
            {
                sign = true;
                break;
            }
            else
                sign = false;
            }
        if (sign)
            return true;
        else
            return false;
        
    }

    protected bool check_NewDevice_data(string mySQL, string ConnStr)
    {
        string TableFild = "";
        int FieldCunt = 0;
        bool sign = false;
        int i;
        List<string> NewDevicedata = new List<string>();

        MySqlConnection MySqlConn = new MySqlConnection(ConnStr);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        MySqlDataReader SelData3 = MySqlCmd.ExecuteReader();

        while (SelData3.Read())
        {


            TableFild = SelData3.GetString(FieldCunt);
            NewDevicedata.Add(TableFild);
            FieldCunt++;

        }

        SelData3.Close();
        MySqlConn.Close();
       

        for (i = 0; i < FieldCunt; i++)
        {
            if (ND_TB.Text == NewDevicedata[i])
            {
                sign = true;
                break;
            }
            else
                sign = false;
        }
        if (sign)
            return true;
        else
            return false;

    }





    protected string receive_npiimportdata(string mySQL, string ConnStr, int i)
    {
        string TableFild = "";
        int FieldCunt = 0;


       // clsMySQL db = new clsMySQL();
      
        //MySqlDataReader mydr = db.QueryDataReader(mySQL);
        MySqlConnection MySqlConn = new MySqlConnection(ConnStr);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();


        while (mydr.Read())
        {
            // for (FieldCunt = 0; FieldCunt <= 0; FieldCunt++)
            //{

            TableFild = mydr.GetString(0);//SelData.GetString(0);
            temp_Data.Add(TableFild);
            //}

        }
        mydr.Close();
        MySqlConn.Close();
        return temp_Data[i];
    }

    protected void receive_npiappmanualdata()
    {
        clsMySQL db = new clsMySQL();
        string customer_sign = Customer_TB.Text;
        string New_Device_sign = ND_TB.Text;

        //Repeater1.Visible = true;
        string strSQL1 = " select * From npiapp,npimanual where npiapp.New_Customer = '" + customer_sign + "' and npiapp.New_Device = '" + New_Device_sign + "'and npimanual.New_Customer = '" + customer_sign + "' and npimanual.New_Device = '" + New_Device_sign + "'";
        // string strSQL1 = "  select * From npimanual where New_Device = '" + New_Device_sign + " ' and New_Customer = '"+ customer_sign  + "'  ";
        //string strSQL1 = "  select * From npimanual where New_Customer='AMD-CPU' and New_Device = 'KINGSTON' ";
        EPTRA_Repeater.DataSource = db.QueryDataSet(strSQL1);
        EPTRA_Repeater.DataBind();
        db.Close();
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        string myConnectionString = "server=10.14.41.200;uid=new;" +
                "pwd=new;database=dbbu3;";
        
        // string mySelectQuery = " select * From npiimportdata";
        // MySqlConnection(myConnectionString, mySelectQuery,0);
        EPTRA_Repeater.Visible = true;

        //CPSP_Panel.Visible = false;

        if (!Page.IsPostBack)
        {
            //DBInit();
        }

       
        /*
        Label1.Text = Device ;
        Label2.Text = Request.QueryString["Production_Site"];
        Label3.Text = Request.QueryString["PKG"];
        Label4.Text = Request.QueryString["Wafer"] ;
        Label5.Text = Request.QueryString["fab"];
        Label6.Text = Request.QueryString["WaferPSV"] ;
        Label7.Text = Request.QueryString["RVSI"];
        Label8.Text = Request.QueryString["Customer"];
        */

        /*for(i=0;i<8;i++)
        {
            Response.Write(rec_por_golden[i]+"<br />");
        }
        */

    }


    protected void POR_Butt_Click1(object sender, EventArgs e)
    {
        

        //日期輸入的頁面，將 TextBox 以 TextBoxId 網址參數傳給日期頁面 
        /*  sUrl = "POR_Golden.aspx?Device="+ this.por_golden_data[0] + "Production_Site=" + this.por_golden_data[1] + "PKG=" + this.por_golden_data[2] +
                      "Wafer=" + this.por_golden_data[3] + "Name_fab=" + this.por_golden_data[4] + "WaferPSV=" + this.por_golden_data[5] +
                      "RVSI=" + this.por_golden_data[6] + "Customer=" + this.por_golden_data[7];*/
        // sScript = "window.open('POR_Golden.aspx','','height=1024,width=1100,status=no,toolbar=no,menubar=no,location=no','')";
        // this.Label1.Attributes["onclick"] = sScript;

        string strScript = string.Format("<script language='javascript'>AddWork();</script>");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
    

    }

  
  
    protected void cmdFilter_Click(object sender, EventArgs e)
    {
      
        Label1.Text = Session["value1"].ToString();
        Label2.Text = Session["value2"].ToString();
        Label3.Text = Session["value3"].ToString();
        Label4.Text = Session["value4"].ToString();
        Label5.Text = Session["value5"].ToString();
        Label6.Text = Session["value6"].ToString();
        Label7.Text = Session["value7"].ToString();
        Label8.Text = Session["value8"].ToString();

        por_golden_condition.Add(Label1.Text);
        por_golden_condition.Add(Label2.Text);
        por_golden_condition.Add(Label3.Text);
        por_golden_condition.Add(Label4.Text);
        por_golden_condition.Add(Label5.Text);
        por_golden_condition.Add(Label6.Text);
        por_golden_condition.Add(Label7.Text);
        por_golden_condition.Add(Label8.Text);

        //por_baseline(Label1.Text, Label2.Text, Label3.Text, Label4.Text, Label5.Text, Label6.Text, Label7.Text, Label8.Text);
        //por_baseline_one();
}
    /*
    public string por_baseline(string strSQL , int i)
    {
       
        clsMySQL db = new clsMySQL(); //Connection MySQL
        MySqlDataReader mydr = db.QueryDataReader(strSQL);


        while(mydr.Read())
        {
            por_golden_data.Add(mydr.GetString(0));

        }
        return por_golden_data[i];
    }


   public void por_baseline(string por1,string por2,string por3,string por4,string por5,string por6,string por7,string por8)
    {
        clsMySQL db = new clsMySQL();

        string strSQL1 = " select * From npipor where POR_17 = '" + por1 + "' and POR_01 = '" + por2 + "'and POR_02 = '" + por3 + "' and POR_03 = '" + por4 + "'and POR_04 = '" + por5 +"'and POR_05 = '"+ por6 + "'and POR_11 ='" + por7 + "'and POR_14 ='" + por8 + "'" ;
       //string strSQL1 = " select * From npipor where POR_17 = '" + por1 + "'and POR_01 = '"+ por2;
        EPTRA_Repeater.DataSource = db.QueryDataSet(strSQL1);
        EPTRA_Repeater.DataBind();
        db.Close();

    } 

    public string por_baseline_one()
    {
        string strSQL= " select POR_15 From npipor where POR_15 = '" + Label1.Text + "' and POR_01 = '" + Label2.Text+ "'and POR_02 = '" + Label3.Text+ "' and POR_03 = '" + Label4.Text + "'and POR_04 = '" + Label5.Text + "'and POR_05 = '" + Label6.Text+ "'and POR_11 ='" + Label7.Text + "'and POR_14 ='" + Label8.Text+ "'";
        int i = 1;
         string ConnStr = "server=10.14.41.200;uid=new;" + "pwd=new; database=dbbu3;";
        string TableFild = "";
        clsMySQL db = new clsMySQL(); //Connection MySQL
        //MySqlDataReader mydr = db.QueryDataReader(strSQL);

        MySqlConnection MySqlConn = new MySqlConnection(ConnStr);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(strSQL, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();


        while (mydr.Read())
        {
            TableFild = mydr.GetString(0);
            por_golden_data.Add(TableFild);
            //return mydr.GetString(0);
        }
        return por_golden_data[0];
        
    }
    */

    protected void Customer_TB_TextChanged(object sender, EventArgs e)
    {

    }
}