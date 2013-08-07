using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for Validator
/// </summary>
public class Validator
{
	public Validator()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //only Alphabets N numbers
    public static string isAlphaNumeric(string strToCheck)
    {
        //regular expression pattern for only alphabets n numbers
        Regex rg = new Regex("^[a-zA-Z0-9]*$");
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Only Alphabets or Numbers.";
        }
        else
        {
            return "";
        }
    }

    //check Name
    public static string isName(string strToCheck)
    {
        //regular expression pattern for only alphabets n numbers
        Regex rg = new Regex("^([a-zA-Z' ]+)$");
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Only Alphabets";
        }
        else
        {
            return "";
        }
    }

    //check Name
    public static string isNameNum(string strToCheck)
    {
        //regular expression pattern for only alphabets n numbers
        Regex rg = new Regex("^([a-zA-Z0-9' ]+)$");
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Only Alphabets or Numberssadas";
        }
        else
        {
            return "";
        }
    }

    //only Alphabets
    public static string isAlphabets(string strToCheck)
    {
        //regular expression pattern for only alphabets
        Regex rg = new Regex("^[a-zA-Z]*$");
        //check string with Regex
        bool rs = rg.IsMatch(strToCheck);
        if (rs == false)
        {
            return "Only Alphabets.";
        }
        else
        {
            return "";
        }
    }

    //only Numbers
    public static string isNumbers(string strToCheck)
    {
        //regular expression pattern for only alphabets
        Regex rg = new Regex("^[0-9]*$");
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Only Numbers.";
        }
        else
        {
            return "";
        }
    }

    //check Phone Numbers
    public static string isPNumber(string strToCheck)
    {
        //regular expression pattern for only alphabets
        Regex rg = new Regex("^[+]*[0-9]*$");
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Only Numbers OR Example: +XXXXXXX";
        }
        else
        {
            return "";
        }
    }

    //check Username
    public static string isUName(string strToCheck)
    {
        //regular expression pattern for only alphabets n numbers
        Regex rg = new Regex("^[0-9]*[a-zA-Z]+[0-9]*$");
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Invalid Email format. You must type some letters, not only numbers";
        }
        else
        {
            return "";
        }
    }

    //chekc email
    public static string isEmail(string strToCheck)
    {
        //regular expression pattern for valid email
        //addresses, allows for the following domains:
        //com,edu,info,gov,int,mil,net,org,biz,name,museum,coop,aero,pro,tv
        //string partten1 = @"^[a-zA-Z0-9][-.a-zA-Z0-9]*@[-.a-zA-Z0-9]+(\.[-.a-zA-Z0-9]+)*\.(com|edu|info|gov|int|mil|net|org|biz|name|museum|coop|aero|pro|tv|[a-zA-Z]{2})$)";
        string partten = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z][a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
        //Regular expression object
        Regex rg = new Regex(partten, RegexOptions.IgnorePatternWhitespace);
        //boolean variable to return to calling method
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Invalid Email format,Example: abc@gmail.com.";
        }
        else
        {
            return "";
        }
    }

    //check date
    public static string isDate(string strToCheck)
    {
        //Please enter a valid date in dd-MM-yyyy format.
        string strCheck = @"^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\d\d$";
        Regex rg = new Regex(strCheck);
        //check string with Regex
        if (!rg.IsMatch(strToCheck))
        {
            return "Invalid Date format. Example: dd-mm-yyyy";
        }
        else
        {
            return "";
        }
    }
}