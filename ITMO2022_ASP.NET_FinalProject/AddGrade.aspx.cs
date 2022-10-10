using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITMO2022_ASP.NET_FinalProject
{
    public partial class AddGrade : System.Web.UI.Page
    {
        int CourseID = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                NewSchoolEntities context = new NewSchoolEntities();
                var CurrentStudents = context.Student
                    .Where(s => s.Status == "Current")
                    .ToList();

                GridViewStudents.DataSource = CurrentStudents;
                GridViewStudents.DataBind();
            }
        }

        protected void GridViewStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewStudents.SelectedRow;
            txtLastName.Text = row.Cells[2].Text;
            txtFirstName.Text = row.Cells[3].Text;
            LabelUpload.Text = null;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
            LabelUpload.Text = null;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;
            
            try
            {
                NewSchoolEntities context = new NewSchoolEntities();

                StudentGrade grade = new StudentGrade();
                grade.CourseID = CourseID;
                grade.StudentID = Convert.ToInt32(GridViewStudents.SelectedRow.Cells[1].Text);
                grade.GradeDate = Calendar1.SelectedDate;
                grade.Grade = Convert.ToInt16(txtGrade.Text);

                context.StudentGrade.Add(grade);
                context.SaveChanges();

                LabelUpload.Text = "Uploaded successfully";
                GridViewStudents.SelectedIndex = -1;
                txtLastName.Text = null;
                txtFirstName.Text = null;
                txtGrade.Text = null;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Uploaded failed')</script>");
            }

        }
    }
}