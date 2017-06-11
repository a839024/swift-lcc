import UIKit



class ViewController: UIViewController {



    var timer:Timer?  //Timer類別是用來執行定期性的工作

    var countTime:Int=0

    var countSec:Int=0



    @IBOutlet var btnStart: UIButton!
    @IBOutlet var btnStop: UIButton!

    @IBOutlet var datePicker: UIDatePicker!

    @IBOutlet var stepper: UIStepper!

    @IBOutlet var lableMin: UILabel!
    @IBOutlet var lableSec: UILabel!
    @IBOutlet var lableMsg: UILabel!


    @IBAction func StepperClick(_ sender: UIStepper) {
        lableSec.text="\(Int(stepper.value)) sec"
    }


    @IBAction func StartClick(_ sender: UIButton) {
        lableMin.isHidden=true
        btnStop.isEnabled=true
        btnStart.isEnabled=false
        lableMsg.text=""
        stepper.isEnabled=false
        countSec=Int(stepper.value)
        countTime=Int(datePicker.countDownDuration) + countSec
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(ViewController.CountDown), userInfo: nil, repeats: true)
    }


    @IBAction func StopClick(_ sender: UIButton) {
        StopCountDown()
    }


    func CountDown() {
        countSec -= 1   //秒數減一
        countTime -= 1  //總時間減一
        if(countSec == -1){  //也可寫成countSec<0
            if(countTime < 0){
                lableMsg.text="Times up"
                StopCountDown()
            }
            else{
                countSec=59  //秒數從0－>59
                lableSec.text="\(countSec) sec"
                datePicker.countDownDuration=TimeInterval(countTime) //countDownDuration是datePicker選倒數模式時記錄他的值
                if countTime<60 {
                    lableMin.isHidden=false
                    lableMin.text="0 minute"
                }
            }
        }else{
            lableSec.text="\(countSec)sec"
        }

    }

    func StopCountDown() {
        btnStop.isEnabled=false
        btnStart.isEnabled=true
        lableMin.isHidden=true
        datePicker.isEnabled=true
        stepper.isEnabled=true
        stepper.value=0
        lableSec.text="０sec"
        timer?.invalidate()  //停止timer
        timer=nil  //定時停止並清空，所以給nil
    }



//image size controller
    var imgWidth: CGFloat = 0
    var imgHeight: CGFloat = 0


    @IBOutlet var imgShow: UIImageView!
    @IBOutlet var switchPhoto: UISwitch!
    @IBOutlet var sliderPhoto: UISlider!
    @IBOutlet var labelPercent: UILabel!
    @IBOutlet var editPercent: UITextField!


    @IBAction func switchChange(_ sender: UISwitch) {
        if switchPhoto.isOn {
            sliderPhoto.isEnabled = true
        }else{
            sliderPhoto.isEnabled = false
        }
    }


    @IBAction func slideChange(_ sender: UISlider) {
        if sliderPhoto.value <= 0.3 {
            sliderPhoto.value = 0.3
            return
        }

        imgShow.frame.size.width = imgWidth * CGFloat(sliderPhoto.value)
        imgShow.frame.size.height = imgHeight * CGFloat(sliderPhoto.value)
        labelPercent.text = "\(Int(sliderPhoto.value * 100)) %"
        editPercent.text = "\(Int(sliderPhoto.value * 100))"
    }


    @IBAction func editPercentChange(_ sender: UITextField) {
        let percent = Int(editPercent.text!)
        if percent != nil{
            imgShow.frame.size.width = imgWidth * CGFloat(percent!) / 100
            imgShow.frame.size.height = imgHeight * CGFloat(percent!) / 100
        }
    }


//progress
    var progressTimer: Timer?
    var progressCount: Float = 0


    @IBOutlet var progress: UIProgressView!
    @IBOutlet var progressMsg: UILabel!
    @IBOutlet var btnDownload: UIButton!


    func showProgress(){
        progress.progress = progressCount / 100
        progressMsg.text = "state: \(progressCount) %"
        progressCount += 1
        if progressCount > 100 {
            progressTimer?.invalidate()
            progressTimer = nil
            btnDownload.isEnabled = true
        }
    }


    @IBAction func downloadClick(_ sender: UIButton) {
        btnDownload.isEnabled = false
        progressCount = 0
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.showProgress), userInfo: nil, repeats: true)
    }



    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Upper part
        datePicker.datePickerMode = UIDatePickerMode.countDownTimer      //設定datePicker模式
        stepper.minimumValue=0  //設定最大最小值
        stepper.maximumValue=59
        btnStop.isEnabled=false
        lableMin.isHidden=true

        // Lower part
        imgShow.image = UIImage(named: "img.jpg")
        imgHeight = imgShow.frame.height * 2
        imgWidth = imgShow.frame.width * 2


        //progress
        progress.frame.size.width = 280
        progress.progress = 0
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    
}
