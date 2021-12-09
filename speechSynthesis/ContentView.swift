//
//  ContentView.swift
//  tts
//
//  Created by Kevin Walchko on 12/7/21.
//

import SwiftUI
import AVFoundation

class ViewModel {
    let words: AVSpeechUtterance
    let synthesizer: AVSpeechSynthesizer
    
    init(){
        self.words = AVSpeechUtterance(string: "Bear snacks are great!")
        
        // https://gist.github.com/Koze/d1de49c24fc28375a9e314c72f7fdae4
//        self.words.voice = AVSpeechSynthesisVoice(language: "en-GB")
//        let voice = "com.apple.ttsbundle.siri_female_en-AU_compact"
        let voice = "com.apple.ttsbundle.Karen-compact"
//        let voice = "com.apple.ttsbundle.siri_female_en-GB_compact"
        self.words.voice = AVSpeechSynthesisVoice(identifier: voice)
        print(">> default rate: \(self.words.rate)")
        self.words.rate = 0.5 // 0.5 is normal speed, higher faster, lower slower

        self.synthesizer = AVSpeechSynthesizer()
    }
    
    func play(){
        self.synthesizer.speak(self.words)
    }
}

struct ContentView: View {
    var vm = ViewModel()
    var body: some View {
        Text("Speak")
            .padding()
            .onTapGesture(count: 1) {
                vm.play()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
