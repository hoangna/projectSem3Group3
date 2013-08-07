using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataTransferObject;
using Business;


namespace Presentation.Admin
{
    public partial class InsertFAQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            FAQ faq = new FAQ();
            faq.Question = txtQuestion.Text;
            faq.Answer = txtAnswer.Text;

            FAQ_Business.insertFAQ(faq);
        }
    }
}