#!/usr/bin/swift
import Cocoa
import AppKit

let pixels: CGFloat = 1024
let bitmap = NSBitmapImageRep(
    bitmapDataPlanes: nil,
    pixelsWide: Int(pixels),
    pixelsHigh: Int(pixels),
    bitsPerSample: 8,
    samplesPerPixel: 4,
    hasAlpha: true,
    isPlanar: false,
    colorSpaceName: .deviceRGB,
    bytesPerRow: 0,
    bitsPerPixel: 0
)!

let context = NSGraphicsContext(bitmapImageRep: bitmap)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = context

let left: CGFloat = 100
let top: CGFloat = 200
let rect = NSRect(x: left, y: top, width: pixels - left * 2, height: pixels - top * 2)

// ===== 背景 =====
let cornerRadius: CGFloat = 140

let bgColor = NSColor(calibratedWhite: 1.0, alpha: 1.0)
let path = NSBezierPath(roundedRect: rect, xRadius: cornerRadius, yRadius: cornerRadius)

// 填充背景
bgColor.setFill()
path.fill()

// 边框
// path.lineWidth = 18
// let borderColor = NSColor(calibratedWhite: 0.525, alpha: 1.0)
// borderColor.setStroke()
// path.stroke()

// ===== 绘制表情 =====
let strokeColor = NSColor(calibratedWhite: 0.525, alpha: 1.0)
strokeColor.setStroke()

let lineWidth: CGFloat = 36
let eyeOffset: CGFloat = 50
let eyeWidth: CGFloat = 140
let leftEyeX: CGFloat = left + cornerRadius
let rightEyeX: CGFloat = pixels - left - cornerRadius

// 左眼 ">"
let leftEye = NSBezierPath()
leftEye.lineWidth = lineWidth
leftEye.lineCapStyle = .square

leftEye.move(to: CGPoint(x: leftEyeX, y: top + cornerRadius + eyeOffset))
leftEye.line(to: CGPoint(x: leftEyeX + eyeWidth, y: pixels * 0.5 + eyeOffset * 0.5))
leftEye.line(to: CGPoint(x: leftEyeX, y: pixels - top - cornerRadius))
leftEye.stroke()

// 右眼 "<"
let rightEye = NSBezierPath()
rightEye.lineWidth = lineWidth
rightEye.lineCapStyle = .square

rightEye.move(to: CGPoint(x: rightEyeX, y: top + cornerRadius + eyeOffset))
rightEye.line(to: CGPoint(x: rightEyeX - eyeWidth, y: pixels * 0.5 + eyeOffset * 0.5))
rightEye.line(to: CGPoint(x: rightEyeX, y: pixels - top - cornerRadius))
rightEye.stroke()

// 嘴巴 "_"
let mouth = NSBezierPath()
mouth.lineWidth = lineWidth
mouth.lineCapStyle = .square

mouth.move(to: CGPoint(x: leftEyeX + eyeWidth + lineWidth + 8, y: top + cornerRadius + eyeOffset - lineWidth * 2))
mouth.line(to: CGPoint(x: rightEyeX - eyeWidth - lineWidth - 8, y: top + cornerRadius + eyeOffset - lineWidth * 2))
mouth.stroke()

NSGraphicsContext.restoreGraphicsState()

// 保存 PNG
if let pngData = bitmap.representation(using: .png, properties: [:]) {
    let url = URL(fileURLWithPath: "Resources/icon.png")
    try? pngData.write(to: url)
    print("✅ 图标已生成: Resources/icon.png (1024x1024)")
} else {
    print("❌ 图标生成失败")
}
