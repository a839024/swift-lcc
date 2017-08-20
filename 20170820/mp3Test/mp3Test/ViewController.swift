import UIKit
import AVFoundation

class ViewController: UIViewController {

    var myPlayer: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            myPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "mario", ofType: "mp3")!))
        } catch {

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playMusic(_ sender: UIButton) {
        if sender.titleLabel?.text! == "PLAY" {
            myPlayer.play()
            sender.titleLabel?.text! = "STOP"
        }else{
        }
    }

}

