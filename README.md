# izziGradient

lightweight package called IzziGradient to simplify the use of gradients in Swift with UIKit. This tool is designed to make creating and customizing gradients both intuitive and efficient, providing developers with an easy way to enhance their app's visual appeal.


## Reference

#### Linear Gradient

| Parameter | Type     | Description                | Defaults |
| :-------- | :------- | :------------------------- | :-------- |
| `gradientColors` | `[UIColor]` | Array of colors to apply in the gradient.| [ ] |
| `colorLocations` | `[NSNumber]` |  Locations for each color in the gradient. | [ ] |
| `startPoint` | `CGPoint` | Starting point for the gradient. | x: 0.0, y: 0.0 |
| `endPoint` | `CGPoint` | Ending point for the gradient. | x: 0.0, y: 1.0 |
| `newColors` | `[UIColor]` | The target colors for animation. | [ ] |
| `duration` | `CFTimeInterval` | Duration of the animation. | 3.0 |
| `repeatCount` | `Float` | Number of animation repetitions. | .infinity |
| `autoReverse` | `Bool` | reverses direction after completion. | true |


#### Radial Gradient

| Parameter | Type     | Description                | Defaults |
| :-------- | :------- | :------------------------- | :-------- |
| `gradientColors` | `[UIColor]` | Array of colors to apply in the gradient.| [ ] |
| `centerPoint` | `CGPoint` | Starting point for the gradient. | x: 0.5, y: 0.5 |
| `radius` | `CGFloat` | Ending point for the gradient. | 100.0 |


## How to use
#### Linear Gradient

```swift
import izziGradient

let gradientView = IzziLinearGradient()
gradientView.gradientColors = [UIColor.white, UIColor.black]
gradientView.colorLocations = [0.5, 0.5]
gradientView.startPoint = CGPoint(x: 0.0, y: 0.0)
gradientView.endPoint = CGPoint(x: 0.4, y: 1.0)
```

#### Animate Linear Gradient
```swift
gradientView.animateColors(to: [UIColor.green, UIColor.yellow], duration: 3.0)
```

#### Animate Linear Gradient Start/End points
```swift
gradientView.animatePoints(to: CGPoint(x: 1.0, y: 0.0), endPoint: CGPoint(x: 0.0, y: 1.0), duration: 3.0)
```

#### Radial Gradient
```swift
import izziGradient

let gradientView = IzziRadialGradient()
gradientView.gradientColors = [UIColor.white, UIColor.black]
gradientView.colorLocations = [0.0, 1.0]
gradientView.centerPoint = CGPoint(x: 0.5, y: 0.3)
gradientView.radius = 200
```

![Static Badge](https://img.shields.io/badge/version-1.1.0-green) ![Static Badge](https://img.shields.io/badge/License-MIT-green)


![Static Badge](https://img.shields.io/badge/Swift-6.0-orange) ![Static Badge](https://img.shields.io/badge/platforms-iOS-orange)
