using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ITMO2022_ASP.NET_FinalProject
{
    public partial class ViewTOP : System.Web.UI.Page
    {
        int TopBottomCount = 5;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            NewSchoolEntities context = new NewSchoolEntities();

            var SelectedGrades = context.StudentGrade
                .Where(s => s.GradeDate >= Calendar1.SelectedDate && s.GradeDate <= Calendar2.SelectedDate)
                .OrderBy(s => s.GradeDate)
                .ToList();


            var CurrentStudents = context.Student
                .Where(s => s.Status == "Current")
                .ToList();
            if  (RadioButtonList1.SelectedValue == "Sum")
            {
                var TopResults = SelectedGrades.GroupBy(g => g.StudentID)
                .Select(g => new
                {
                    SudentID = g.Key,
                    GradeSum = g.Sum(s => s.Grade)

                })
                .OrderByDescending(x => x.GradeSum)
                .Take(TopBottomCount);

                var BottomResults = SelectedGrades.GroupBy(g => g.StudentID)
                    .Select(g => new
                    {
                        SudentID = g.Key,
                        GradeSum = g.Sum(s => s.Grade)

                    })
                    .OrderBy(x => x.GradeSum)
                    .Take(TopBottomCount);
                var TopToDisplay = CurrentStudents.
                    Join(TopResults,
                    a => a.StudentID,
                    b => b.SudentID,
                    (a, b) => new
                    {
                        StudentID = a.StudentID,
                        LastName = a.LastName,
                        FirstName = a.FirstName,
                        Grade = b.GradeSum
                    }).OrderByDescending(x => x.Grade).ToList();

                var BottomToDisplay = CurrentStudents.
                    Join(BottomResults,
                    a => a.StudentID,
                    b => b.SudentID,
                    (a, b) => new
                    {
                        StudentID = a.StudentID,
                        LastName = a.LastName,
                        FirstName = a.FirstName,
                        Grade = b.GradeSum
                    }).OrderByDescending(x => x.Grade).ToList();


                GridViewTop.DataSource = TopToDisplay;
                GridViewTop.DataBind();

                GridViewBottom.DataSource = BottomToDisplay;
                GridViewBottom.DataBind();
            }
            else
            {
                var TopResults = SelectedGrades.GroupBy(g => g.StudentID)
                .Select(g => new
                {
                    SudentID = g.Key,
                    GradeSum = g.Average(s => s.Grade)

                })
                .OrderByDescending(x => x.GradeSum)
                .Take(TopBottomCount);

                var BottomResults = SelectedGrades.GroupBy(g => g.StudentID)
                    .Select(g => new
                    {
                        SudentID = g.Key,
                        GradeSum = g.Average(s => s.Grade)

                    })
                    .OrderBy(x => x.GradeSum)
                    .Take(TopBottomCount);

                var TopToDisplay = CurrentStudents.
                Join(TopResults,
                a => a.StudentID,
                b => b.SudentID,
                (a, b) => new
                {
                    StudentID = a.StudentID,
                    LastName = a.LastName,
                    FirstName = a.FirstName,
                    Grade = b.GradeSum
                }).OrderByDescending(x => x.Grade).ToList();

                var BottomToDisplay = CurrentStudents.
                    Join(BottomResults,
                    a => a.StudentID,
                    b => b.SudentID,
                    (a, b) => new
                    {
                        StudentID = a.StudentID,
                        LastName = a.LastName,
                        FirstName = a.FirstName,
                        Grade = b.GradeSum
                    }).OrderByDescending(x => x.Grade).ToList();


                GridViewTop.DataSource = TopToDisplay;
                GridViewTop.DataBind();

                GridViewBottom.DataSource = BottomToDisplay;
                GridViewBottom.DataBind();
            }
            

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