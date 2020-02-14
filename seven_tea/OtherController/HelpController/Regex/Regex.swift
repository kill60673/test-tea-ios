
//用戶名驗證（允許使用小寫字母、數字、底線、橫槓，一共3~16个字符）
//^[a-z0-9_-]{3,16}$

//Email驗證
//"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"

//手機號碼驗證
//^09[0-9]{8}$

//URL驗證
//^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$

//IP地址驗證
//^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$

//html標籤驗證
//^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$



import Foundation
var regex_message = ""
var regex_phonenumber = ""
var regex_account = ""
var regex_password = ""
var regex_VerificationCode = ""
var regex_email = ""
//驗證格式

// 這條是用來判斷電話號碼的正規表示式
func checkValidPhoneNumber(input : String) -> Bool {
    // self matches是特定寫法而且不區別大小寫，代表input值必須符合參數pattern要求的格式
    let pattern = "09[0-9]{8}"
    let predicate = NSPredicate(format : "self matches %@" , pattern)
    let isValid = predicate.evaluate(with : input)
    if (input == "")
    {
        regex_phonenumber = "＊請輸入電話號碼"
    }
    else
    {
        regex_phonenumber = "輸入欄位不正確"
    }
    return isValid
}

// 這條是用來判斷帳號的正規表示式
func checkValidAccount(input : String) -> Bool {
    // self matches是特定寫法而且不區別大小寫，代表input值必須符合參數pattern要求的格式
    let pattern = "^[a-z0-9_-]{3,16}$"
    let predicate = NSPredicate(format : "self matches %@" , pattern)
    let isValid = predicate.evaluate(with : input)
    if (input == "")
    {
        regex_account = "＊請輸入帳號"
    }
    else
    {
        regex_account = "＊輸入格式不正確"
    }
    return isValid
}
// 這條是用來判斷密碼的正規表示式
func checkValidPassword(input : String)-> Bool{
    let pattern = "^[a-z0-9_-]{3,16}$"
    let predicate = NSPredicate(format: "self matches %@", pattern)
    let isValid = predicate.evaluate(with : input)
    if (input == "")
    {
        regex_password = "＊請輸入密碼"
    }
    else
    {
        regex_password = "＊請輸入格式不正確"
    }
    return isValid
}
// 這條是用來判斷驗證碼的正規表示式
func checkValidVerificationCode(input : String)-> Bool{
    let pattern = "[0-9]{6}"
    let predicate = NSPredicate(format : "self matches %@" , pattern)
    let isValid = predicate.evaluate(with : input)
    if(input == "")
    {
        regex_VerificationCode = "＊請輸入電話驗證碼"
    }
    else
    {
        regex_VerificationCode = "＊輸入格式不正確"
    }
    return isValid
}
// 這條是用來判斷email的正規表示式
func checkValidEmail(input: String) -> Bool {
    let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
    //                                                  \\.為想跳脫.的特殊功能的符號
    let predicate = NSPredicate(format : "self matches %@" , pattern)
    let isValid = predicate.evaluate(with : input)
    if(input == "")
    {
        regex_email = "＊請輸入信箱"
    }
    else
    {
        regex_email = "＊輸入格式不正確"
    }
    return isValid
}







