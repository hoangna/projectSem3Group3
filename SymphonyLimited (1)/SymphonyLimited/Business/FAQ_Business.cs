using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data;
using DataTransferObject;

namespace Business
{
    public class FAQ_Business
    {
        public static FAQ_Data db = new FAQ_Data();

        public static List<FAQ> getAllFAQ()
        {
            return db.getAllFAQ();
        }


        public static bool insertFAQ(FAQ faq)
        {
            return db.insertFAQ(faq);
        }
    }        
}
