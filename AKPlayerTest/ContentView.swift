//
//  ContentView.swift
//  AKPlayerTest
//
//  Created by Matthew Hoopes on 6/10/21.
//

import SwiftUI
import AudioKit

class AKDemo {
  var engine = AudioEngine()
  var currTime: Double = 0

  var player: AudioPlayer

  init() {
    let url = Bundle.main.url(forResource: "two_seconds", withExtension: "mp3")!
    player = AudioPlayer()
    try! player.load(url: url)

    player.completionHandler = self.onComplete

    engine.output = player

    try! engine.start()
  }

  func play() {
    player.play()
  }

  func onComplete() {
    currTime = player.getCurrentTime()
    print ("Curr time: \(currTime)") // !!!
  }
}

struct ContentView: View {

  @State var demo = AKDemo()

  var body: some View {
    Button("Play!") {
      demo.play()
    }
  }
}
