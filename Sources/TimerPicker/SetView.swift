//
//  SetView.swift
//  
//
//  Created by wada on 2024/01/27.
//

import SwiftUI

struct SetView: UIViewRepresentable {
    @Binding var second: TimeInterval

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPickerView {
        let picker = UIPickerView()
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator

        let hourIndex = second.toHour()
        let minuteIndex = second.toMinute()
        let secondIndex = second.toSecond()
        picker.selectRow(hourIndex, inComponent: 0, animated: true)
        picker.selectRow(minuteIndex, inComponent: 2, animated: true)
        picker.selectRow(secondIndex, inComponent: 4, animated: true)
        let fontSize:CGFloat = 20
        let labelWidth:CGFloat = picker.frame.size.width / CGFloat(picker.numberOfComponents)
        let y:CGFloat = (picker.frame.size.height / 2) - (fontSize / 2)

        for i in [1, 3, 5] {
            let label = UILabel()
            switch i {
            case 1:
                label.text = "時"
            case 3:
                label.text = "分"
            default:
                label.text = "秒"
            }
            label.frame = CGRect(x: labelWidth * CGFloat(i), y: y, width: labelWidth, height: fontSize)
            label.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
            label.backgroundColor = .clear
            label.textAlignment = NSTextAlignment.center
            picker.addSubview(label)
        }

        return picker
    }

    func updateUIView(_ uiView: UIPickerView, context: Context) {
    }

    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var setView: SetView
        var dataList = [["0"], [""], ["0"], [""], ["0"], [""]]

        init(_ view: SetView) {
            self.setView = view

            for i in 1...23 {
                dataList[0].append("\(i)")
            }
            for i in 1...59 {
                dataList[2].append("\(i)")
            }
            for i in 1...59 {
                dataList[4].append("\(i)")
            }
        }

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return dataList.count
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return dataList[component].count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return dataList[component][row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let h = TimeInterval(setView.second.toHour() * 3600)
            let m = TimeInterval(setView.second.toMinute() * 60)
            let s = TimeInterval(setView.second.toSecond())
            switch component {
            case 0:
                setView.second = TimeInterval(row * 3600) + m + s
            case 2:
                setView.second = TimeInterval(row * 60) + h + s
            case 4:
                setView.second = TimeInterval(row) + h + m
            default: break
            }
        }
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let label = (view as? UILabel) ?? UILabel()
            label.text = self.dataList[component][row]
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .light)
            return label
        }
    }
}

#Preview {
    SetView(second: .constant(0))
}
