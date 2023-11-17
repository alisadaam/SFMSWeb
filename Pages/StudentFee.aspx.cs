using BMSWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BMSWeb.Pages
{
    public partial class StudentFee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindStudents();
                BindFeeType();
                this.GetStudentsFee();
            }
        }

        private void GetStudentsFee()
        {
            using (SFMSEntities dbContect = new SFMSEntities())
            {
                List<v_StudentFee> std = new List<v_StudentFee>();
                std = dbContect.v_StudentFee.ToList();
                GridViewFee.DataSource = std;
                GridViewFee.DataBind();
            }


        }

        private void BindStudents()
        {
            using (var dataContext = new SFMSEntities())
            {
                //bind to Gender COde droplist 
                ddlStudent.DataSource = (from p in dataContext.tbl_Student
                                        orderby p.First_Name
                                        select new { p.ID, p.First_Name }).ToList();
                ddlStudent.DataTextField = "First_Name";
                ddlStudent.DataValueField = "ID";
                ddlStudent.DataBind();
                ddlStudent.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "0"));
            }
        }
        private void BindFeeType()
        {
            using (var dataContext = new SFMSEntities())
            {
                //bind to Gender COde droplist 
                ddlFeeType.DataSource = (from p in dataContext.tbl_Fee_Type
                                         orderby p.Fee_Type
                                         select new { p.ID, p.Fee_Type }).ToList();
                ddlFeeType.DataTextField = "Fee_Type";
                ddlFeeType.DataValueField = "ID";
                ddlFeeType.DataBind();
                ddlFeeType.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "0"));
            }
        }

        protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get Tution Fee  
            using (SFMSEntities dbContect = new SFMSEntities())
            {
                if (ddlStudent.SelectedValue != "0")
                {
                    int id = Convert.ToInt16(ddlStudent.SelectedValue);
                    var fee = dbContect.tbl_Student.FirstOrDefault(s => s.ID == id);
                    if (fee != null)
                    {
                        txtDueAmt.Text = fee.TutionFee.ToString();
                    }
                }
            }
        }

        protected void ddlFeeType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SFMSEntities dbContect = new SFMSEntities())
                {
                    tbl_Student_Fee mem = new tbl_Student_Fee(); 
                    mem.Student_Id = Convert.ToInt16(ddlStudent.SelectedValue);
                    mem.Fee_Type_Id = Convert.ToInt16(ddlFeeType.SelectedValue); ;
                    mem.Amount_Due = Convert.ToDecimal(txtDueAmt.Text);
                    mem.Amount_Pending = Convert.ToDecimal(txtpendAmt.Text);
                    mem.Amount_Received = Convert.ToDecimal(txtRecAmt.Text);
                    dbContect.tbl_Student_Fee.Add(mem); 
                    dbContect.SaveChanges(); 
                }
                this.GetStudentsFee();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GridViewFee_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridViewFee_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void txtRecAmt_TextChanged(object sender, EventArgs e)
        {
            txtpendAmt.Text = Convert.ToString(Convert.ToInt16(txtDueAmt.Text) - Convert.ToInt16(txtRecAmt.Text));  
        }
    }
}