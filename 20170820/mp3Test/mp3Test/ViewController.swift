import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myPlayer: AVAudioPlayer = AVAudioPlayer()
    let arrSong: Array<String> = ["greensleeves", "mario", "songbird", "summersong", "tradewinds"]
    var count = 0

    @IBOutlet var labelSongName: UILabel!
    @IBOutlet var slideProgress: UISlider!
    @IBOutlet var slideVolumn: UISlider!
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var buttonPause: UIButton!
    @IBOutlet var buttonStop: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAction(play: true, pause: false, stop: false, progress: true, volumn: true)
        audioInit(res: arrSong[0])
        setSlider(progress: 0)

        let mytimer = Timer(timeInterval: 0.5, target: self, selector: #selector(traceTimer), userInfo: nil, repeats: true)
        print(mytimer.isValid)
    }

    @objc func traceTimer() {
        print(myPlayer.currentTime)
    }

    func setSlider(progress: Float) {
        slideProgress.value = progress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func progressChange(_ sender: UISlider) {
        myPlayer.currentTime = myPlayer.duration * Double(sender.value)
    }

    @IBAction func volumnChange(_ sender: UISlider) {
        myPlayer.volume = slideVolumn.value
    }


    @IBAction func playMusic(_ sender: UIButton) {
        if sender.titleLabel?.text! == "播放" {
            myPlayer.play()
            buttonAction(play: false, pause: true, stop: true, progress: true, volumn: true)
        }else if sender.titleLabel?.text! == "暫停"{
            myPlayer.pause()
            buttonAction(play: true, pause: false, stop: true, progress: true, volumn: true)
        }else{
            myPlayer.stop()
            buttonAction(play: true, pause: false, stop: false, progress: true, volumn: true)
        }

    }

    func audioInit(res: String) {
        do {
            myPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: res, ofType: "mp3")!))
            myPlayer.currentTime = 0.0
            labelSongName.text! = res
            slideProgress.value = 0
        } catch {
            print("AV Audio init failed")
            buttonAction(play: false, pause: false, stop: false, progress: false, volumn: false)
            let alertController = UIAlertController(title: "Error", message: "Play Error!!!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)

        }
    }

    func buttonAction(play: Bool, pause: Bool, stop: Bool, progress: Bool, volumn: Bool) {
        buttonPlay.isEnabled = play
        buttonPause.isEnabled = pause
        buttonStop.isEnabled = stop
        slideProgress.isEnabled = progress
        slideVolumn.isEnabled = volumn
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = arrSong[indexPath.row]
        return cell!;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        audioInit(res: arrSong[indexPath.row])
    }
}

