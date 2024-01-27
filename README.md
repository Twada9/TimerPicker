# TimerPicker
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

PickerView for UIKit time setting available in SwiftUI

## Demo
<img src="https://github.com/Twada9/TimerPicker/assets/50700090/366c240d-a434-4f5f-b68a-e0ff8d2b2ef7" width="200">

## Usage
``` Swift
import SwiftUI
import TimerPicker

struct ContentView: View {
    @State var time: TimeInterval = 100
    var body: some View {
        VStack {
            TimerPicker(timeInterval: $time)
        }
    }
}
```
## Installation
1. From the File menu, select Add Packages...
2. Enter "https://github.com/Twada9/TimerPicker.git" into the package repository URL text field
3. import TimerPicker 
