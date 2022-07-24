//
//  ContentView.swift
//  MeConverter
//
//  Created by Niezwan Abdul Wahid on 21/07/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var inputUnit:Dimension = UnitTemperature.fahrenheit
    @State private var outputUnit:Dimension = UnitTemperature.kelvin
    @State private var inputValue = 0.0
    @State private var activeUnits = 0;
   
//    Dynamic Converter
    let listOfUnits = ["Temperature", "Length", "Time", "Volume"];
    let listOfMeasurements = [
        [UnitTemperature.fahrenheit, UnitTemperature.kelvin, UnitTemperature.celsius],
        [UnitLength.meters,UnitLength.kilometers, UnitLength.yards, UnitLength.feet,UnitLength.miles],
        [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours],
        [UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
    ]
//    Formatter
    let formatter: MeasurementFormatter
    var result: String {
        let inputMes = Measurement(value: inputValue, unit: inputUnit);
        let outputMes = inputMes.converted(to: outputUnit);
        
        return formatter.string(from: outputMes)
    }
    var body: some View {
        NavigationView{
            Form {
                Section{
                    Picker("Units", selection: $activeUnits){
                        ForEach(0..<listOfUnits.count, id: \.self){
                            Text(listOfUnits[$0])
                        }
                    }
                }
                
                Section {
                    TextField("Value", value: $inputValue, format: .number).keyboardType(.decimalPad)
                }
                Section{
                    
                    Picker("Convert From", selection: $inputUnit){
                        ForEach(listOfMeasurements[activeUnits], id: \.self){
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    
                    Picker("Convert To", selection: $outputUnit){
                        ForEach(listOfMeasurements[activeUnits], id: \.self){
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                }
                
                Section {
                    
                    Text("\(result)")
                }
            }.navigationTitle("MyConverter")
                .onChange(of: activeUnits){ newActiveUnits in
                    let units = listOfMeasurements[newActiveUnits]
                    inputUnit = units[0];
                    outputUnit = units[1];
                }
        }
    
    }
    
    init(){
        formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        formatter.unitOptions = .providedUnit
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
