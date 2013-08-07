using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataTransferObject;

namespace Data
{
    public class FAQ_Data : SqlDataProvider
    {
        #region[getAllFAQ]
        public List<FAQ> getAllFAQ()
        {
            List<FAQ> list = new List<FAQ>();
            using (SqlCommand cmd = GetCommand("sp_getAllFAQ", CommandType.StoredProcedure))
            {
                FAQ faq = new FAQ();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(faq.FAQIDatareader(dr));
                        }
                    }
                    faq = null;
                }
                return list;
            }
        }
        #endregion

        #region [insertFAQ]
        public bool insertFAQ(FAQ faq)
        {
            using (SqlCommand cmd = GetCommand("sp_insertFAQ", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Question", faq.Question);
                AddParameter(cmd, "@Answer", faq.Answer);                
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion
    }

    
}
