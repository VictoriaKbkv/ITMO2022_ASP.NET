using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ITMO2022_ASP.NET_FinalProject
{
    public partial class ViewGrades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            NewSchoolEntities context = new NewSchoolEntities();
            var CurrentStudents = context.Student
                .Where(s => s.Status == "Current")
                .ToList();

            var SelectedGrades = context.StudentGrade
                .Where(s => s.GradeDate >= Calendar1.SelectedDate && s.GradeDate <= Calendar2.SelectedDate)
                .OrderBy(s => s.GradeDate)
                .ToList();

            var GradesToDisplay = from student in CurrentStudents
                      join grade in SelectedGrades
                      on student.StudentID equals grade.StudentID
                      select new
                      {
                          StudentID = student.StudentID,
                          LastName = student.LastName,
                          FirstName = student.FirstName,
                          GradeDate = grade.GradeDate,
                          Grade = grade.Grade
                      };


            DataTable dt = new DataTable();

            DataColumn column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "StudentID";
            column.Unique = false;
            dt.Columns.Add(column);

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "LastName";
            column.Unique = false;
            dt.Columns.Add(column);

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "FirstName";
            column.Unique = false;
            dt.Columns.Add(column);

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "Sum of Grades";
            column.Unique = false;
            dt.Columns.Add(column);

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Double");
            column.ColumnName = "Average Grade";
            column.Unique = false;
            dt.Columns.Add(column);

            DataColumnCollection columns = dt.Columns;
            foreach (var element in SelectedGrades)
            {
                string columnName = element.GradeDate.ToShortDateString();
                if (columns.Contains(columnName))
                {

                }
                else
                {
                    columns.Add(columnName);
                }

            };

            int Index = 0;

            foreach (var student in CurrentStudents)
            {
                var data = GradesToDisplay.Where(x => x.StudentID == student.StudentID).OrderBy(x => x.GradeDate);
                var sum = data.Sum(d => d.Grade);
                double average;
                try
                {
                    average = data.Average(d => d.Grade);
                }
                catch (Exception ex)
                {
                    average = 0;
                };

                DataRow dr = dt.NewRow();
                dr["StudentID"] = student.StudentID;
                dr["LastName"] = student.LastName;
                dr["FirstName"] = student.FirstName;
                dr["Sum of Grades"] = sum;
                dr["Average Grade"] = average;
                dt.Rows.Add(dr);

                foreach (var element in data)
                {
                    string columnName = element.GradeDate.ToShortDateString();
                    if (columns.Contains(columnName))
                    {
                        dt.Rows[Index][columnName] = element.Grade;
                    }
                };


                Index++;
            }

            GridViewResults.DataSource = dt;
            GridViewResults.DataBind();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = Calendar2.SelectedDate.ToShortDateString();
        }
    }
}