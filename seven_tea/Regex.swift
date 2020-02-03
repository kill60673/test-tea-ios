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

//驗證格式
struct Regex {
    let regex: NSRegularExpression?
    
    init(_ pattern: String) {
        regex = try? NSRegularExpression(pattern: pattern,
                                         options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        if let matches = regex?.matches(in: input,options: [],range: NSMakeRange(0, (input as NSString).length)) {
            return matches.count > 0
        } else {
            return false
        }
    }
}






