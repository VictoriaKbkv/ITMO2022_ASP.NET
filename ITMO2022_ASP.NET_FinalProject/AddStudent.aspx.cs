using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITMO2022_ASP.NET_FinalProject
{
    public partial class AddStudent : System.Web.UI.Page
    {
        string newStudentStatus = "Current";
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("MM.dd.yyyy");
                NewSchoolEntities context = new NewSchoolEntities();
                var CurrentStudents = context.Student
                    .Where(s => s.Status == "Current")
                    .ToList();

                GridViewStudents.DataSource = CurrentStudents;
                GridViewStudents.DataBind();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            try
            {
                NewSchoolEntities context = new NewSchoolEntities();

                Student student = new Student();
                student.LastName = txtLastName.Text;
                student.FirstName = txtFirstName.Text;
                student.Status = newStudentStatus;
                student.EnrollmentDate = DateTime.Parse(txtDate.Text);

                context.Student.Add(student);
                context.SaveChanges();

                LabeUpload.Text = "Uploaded successfully";

                txtLastName.Text = null;
                txtFirstName.Text = null;
                txtDate.Text = DateTime.Now.ToString("MM.dd.yyyy");

                var CurrentStudents = context.Student
                    .Where(s => s.Status == "Current")
                    .ToList();

                GridViewStudents.DataSource = CurrentStudents;
                GridViewStudents.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Uploaded failed')</script>");
            }

        }

        protected void txtLastName_TextChanged(object sender, EventArgs e)
        {
            LabeUpload.Text = null;
        }

        protected void txtFirstName_TextChanged(object sender, EventArgs e)
        {
            LabeUpload.Text = null;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
            LabeUpload.Text = null;

        }
    }
}