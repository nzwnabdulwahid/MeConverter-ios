
# MeConverter - iOS [HWS Challenge 1](https://www.hackingwithswift.com/100/swiftui/19)

<img src="https://raw.githubusercontent.com/nzwnabdulwahid/MeConverter-ios/main/Screenshot.png" width="150">

## #TIL
1. Handle conversions and format output easily(-ish) with [Measurement API](https://developer.apple.com/documentation/foundation/measurement)
2. handle side-effects(?) operation on `@State` change. 

```swift
.onChange(of: activeUnits){ newActiveUnits in
	let units = listOfMeasurements[newActiveUnits]
	inputUnit = units[0];
	outputUnit = units[1];
}
```
