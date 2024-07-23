//
//  MusicListTableViewCell.swift
//  outgoer
//
//  Created by DREAMWORLD on 26/10/23.
//

import UIKit
import AVFoundation

class MusicListTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var musicTitleLbl: UILabel!
    @IBOutlet weak var musicSingerLbl: UILabel!
    @IBOutlet weak var playMusic: UIButton!
    
    var progressLayer: CAShapeLayer!
    var shapeLayer: CAShapeLayer!
    var totalTime = 0
    var timer: Timer?
    var player: AVPlayer?
    var audioUrl = ""
    
    var onPlay: ((Int)->())!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addProgressLayer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func addProgressLayer() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: playMusic.bounds.midX, y: playMusic.bounds.midY), radius: 13, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
        shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor // Set the progress color
        shapeLayer.lineWidth = 2 // Set the progress line width
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        playMusic.layer.addSublayer(shapeLayer)
        shapeLayer.isHidden = true
        
        progressLayer = CAShapeLayer()
        progressLayer.path = circularPath.cgPath
        progressLayer.strokeColor = UIColor.yellow.cgColor // Set the progress color
        progressLayer.lineWidth = 2 // Set the progress line width
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = 0
        playMusic.layer.addSublayer(progressLayer)
        progressLayer.isHidden = true
    }
    
    @IBAction func btnPlay_Clk(_ sender: UIButton) {
        if onPlay != nil {
            onPlay(sender.tag)
        }
    }
    
    func playSound() {
        guard let url = URL(string: audioUrl) else {
            print("Invalid URL")
            return
        }

        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)

        // Ensure that the device's ringer is not muted
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch let error {
            print("Error setting audio session category: \(error.localizedDescription)")
        }
        // Add an observer for the player's current time
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.1, preferredTimescale: timeScale)
        
        playMusic.setImage(UIImage(named: "ic_post_pause"), for: .normal)
        progressLayer.isHidden = false
        player?.addBoundaryTimeObserver(forTimes: [NSValue(time: time)], queue: DispatchQueue.main) { [weak self] in
            // Start the timer when the player is playing
            self?.startTimer()
        }
        // Play the audio
        player?.play()
    }
    
    func startTimer() {
        self.totalTime = 0
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playMusic.setImage(UIImage(named: "ic_post_pause"), for: .normal)
    }
    
    @objc func updateTimer() {
        if totalTime != 30 {
            totalTime += 1 // increase counter timer
            progressLayer.strokeEnd = CGFloat(totalTime) / 30
            progressLayer.isHidden = false
        } else {
            shapeLayer.isHidden = true
            stopTimer()
        }
    }
    
    func stopTimer() {
        if let timer = self.timer {
            player?.pause()
            timer.invalidate()
            self.timer = nil
            progressLayer.strokeEnd = 0.0
            playMusic.setImage(UIImage(named: "ic_post_play"), for: .normal)
            progressLayer.isHidden = true
        }
    }
}
