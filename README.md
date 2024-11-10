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

                                                
#### Radial Gradient

| Parameter | Type     | Description                | Defaults |
| :-------- | :------- | :------------------------- | :-------- |
| `gradientColors` | `[UIColor]` | Array of colors to apply in the gradient.| [ ] |
| `centerPoint` | `CGPoint` | Starting point for the gradient. | x: 0.5, y: 0.5 |
| `radius` | `CGFloat` | Ending point for the gradient. | 100.0 |


## How to use
#### Linear Gradient

```bash
import izziGradient

let gradientView = IzziLinearGradient()
gradientView.gradientColors = [.white, .black]
gradientView.colorLocations = [0.5, 0.5]
gradientView.startPoint = CGPoint(x: 0.0, y: 0.0)
gradientView.endPoint = CGPoint(x: 0.4, y: 1.0)
```
    
#### Radial Gradient
```swift
import izziGradient

let gradientView = IzziRadialGradient()
gradientView.gradientColors = [.white, .black]
gradientView.colorLocations = [0.5, 0.5]
gradientView.centerPoint = CGPoint(x: 0.5, y: 0.3)
gradientView.radius = 200
```
