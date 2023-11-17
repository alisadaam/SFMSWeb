using BMSWeb.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Http;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BMSWeb.Pages
{
    public partial class AddStudents : System.Web.UI.Page
    {
        SFMSEntities SFMSDB = new SFMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGender();
                BindClasses();
                this.GetStudents();
            }
             
        }

        private void GetStudents()
        { 
            using (SFMSEntities dbContect = new SFMSEntities())
            {
                List<tbl_Student> std = new List<tbl_Student>();
                    std = dbContect.tbl_Student.ToList();
                    GridViewStundents.DataSource = std;
                    GridViewStundents.DataBind();
            }

            
        }
        //public IQueryable<tbl_Student> studentsGrid_GetData()
        //{
        //    SFMSEntities db = new SFMSEntities();
        //    var query = db.tbl_Student.ToList();
        //    return query;
        //}

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get tution fee from DB 
            using (SFMSEntities dbContect = new SFMSEntities())
            { 
                if (ddlClass.SelectedValue != "0")
                {
                   int id = Convert.ToInt16(ddlClass.SelectedValue);
                   var clas = dbContect.tbl_Class.FirstOrDefault(s => s.ID == id);
                    if (clas != null)
                    {
                        txtFee.Text = clas.Tution_Fee.ToString();
                    }
                }
            }

        }

        private void BindGender()
        {
            using (var dataContext = new SFMSEntities())
            {
                //bind to Gender COde droplist 
                ddlGender.DataSource = (from p in dataContext.tbl_Gender
                                      orderby p.Gender
                                      select new { p.ID, p.Gender }).ToList();
                ddlGender.DataTextField = "Gender";
                ddlGender.DataValueField = "ID";
                ddlGender.DataBind();
                ddlGender.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "0")); 
            }
        }

        private void BindClasses()
        { 
            using (var dataContext = new SFMSEntities())
            {
                //bind to Class COde droplist
                ddlClass.DataSource = (from p in dataContext.tbl_Class
                                 orderby p.Class
                                 select new { p.ID, p.Class }).ToList();
                ddlClass.DataTextField = "Class";
                ddlClass.DataValueField = "ID";
                ddlClass.DataBind();
                ddlClass.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select", "0"));
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            try
            {
                using (SFMSEntities dbContect = new SFMSEntities())
                {
                    tbl_Student mem = new tbl_Student();
                    if (txtStdID.Text != "")
                    {
                        mem = dbContect.tbl_Student.FirstOrDefault(s => s.ID == Convert.ToInt16(txtStdID.Text));
                        mem.First_Name = txtF_Name.Text;
                        mem.Last_Name = txtL_Name.Text;
                        mem.Class_Id = Convert.ToInt16(ddlClass.SelectedValue);
                        mem.Email = txtEmail.Text;
                        mem.Gender_Id = ddlGender.SelectedIndex;
                        mem.Discount = Convert.ToInt16(txtDiscount.Text);
                        mem.TutionFee = txtFee.Text;
                        dbContect.SaveChanges();
                    }
                    else
                    {
                        mem = new tbl_Student();
                        mem.First_Name = txtF_Name.Text;
                        mem.Last_Name = txtL_Name.Text;
                        mem.Class_Id = Convert.ToInt16(ddlClass.SelectedValue);
                        mem.Email = txtEmail.Text;
                        mem.Gender_Id = ddlGender.SelectedIndex;
                        mem.Discount = Convert.ToInt16(txtDiscount.Text);
                        mem.TutionFee = txtFee.Text;
                        dbContect.tbl_Student.Add(mem);
                        //Update table
                        dbContect.SaveChanges(); 
                    }
                    this.GetStudents();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GridViewStundents_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridViewStundents_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}