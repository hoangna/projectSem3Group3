using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DataTransferObject
{
    public class FAQ
    {
        public string ID { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }

        public FAQ()
        {

        }

        #region[FAQ IDataReader]
        public FAQ FAQIDatareader(IDataReader dr)
        {
            FAQ faq = new FAQ();
            faq.ID = (dr["Id"] is DBNull) ? string.Empty : dr["Id"].ToString();
            faq.Question = (dr["Question"] is DBNull) ? string.Empty : dr["Question"].ToString();
            faq.Answer = (dr["Answer"] is DBNull) ? string.Empty : dr["Answer"].ToString();
            

            return faq;
        }
        #endregion
    }
}
