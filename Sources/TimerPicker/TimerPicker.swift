import SwiftUI

/// timeInterval: seconds
public struct TimerPicker: View {
    @Binding var timeInterval: TimeInterval
    public init(timeInterval: Binding<TimeInterval>) {
        self._timeInterval = timeInterval
    }
    public var body: some View {
        SetView(second: $timeInterval)
    }
}
