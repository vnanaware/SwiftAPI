
import UIKit


class Constant: NSObject
{
    struct GlobalConstants
    {
        // GLOBLE COLOR DEFINE
        
        static let kColor_Gray: UIColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        static let screenWidth=UIScreen.main.bounds.size.width
        static let screenHeight=UIScreen.main.bounds.size.height
        static let Imgbase_URL="http://13.126.3.151/job_stream/userPhoto/"
        static let theAppDelegate=UIApplication.shared.delegate as! AppDelegate
        static let BaseUrl="http://13.126.3.151/job_stream/"
    }
}

//Mark: For UIView Animation
/*button=UIView(frame: CGRect(x: 0, y: self.view.frame.size.height/2, width: self.view.frame.size.width,height:0))
button.backgroundColor = .green
self.view.addSubview(button)


var frame1 = CGRect()
var vscreenSize=CGRect()
var vscreenHeight=CGFloat()
var vscreenWidth=CGFloat()

frame1=button.frame
frame1=CGRect(x:0,y:0,width:self.view.frame.size.width ,height: self.view.frame.size.height)


UIView.animate(withDuration: 0.8,
               animations: {
                self.button.frame=frame1
},
               completion: { finished in
                vscreenSize=self.button.frame
                vscreenHeight=vscreenSize.size.height
                vscreenWidth=vscreenSize.size.width
})
*/
