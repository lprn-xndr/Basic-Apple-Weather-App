//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Christian Luperon on 4/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
			BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
			VStack {
				CityTextView(cityName: "Hialeah, FL")
				MainWeatherStatusView(imageName: "cloud.sun.fill", temp: 76)
				HStack(spacing: 10) {
					WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 74)
					WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temp: 90)
					WeatherDayView(dayOfWeek: "THU", imageName: "cloud.heavyrain.fill", temp: 82)
					WeatherDayView(dayOfWeek: "FRI", imageName: "hurricane", temp: 98)
					WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.bolt.rain.fill", temp: 72)
					
				}
				Spacer()
				
				Button {
					print("tapped")
				} label: {
					ButtonDesign(title: "Light/Dark Mode!", textColor: .blue, backgroundColor: .white)
				}
				Spacer()
			}
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
	
	var dayOfWeek: String
	var imageName: String
	var temp: Int
	
	var body: some View {
		VStack {
			Text(dayOfWeek)
				.font(.system(size: 16, weight: .medium, design: .default))
				.foregroundColor(.white)
				.padding()
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 40, height: 40)
			Text("\(temp)°")
				.font(.system(size: 28, weight: .medium))
				.foregroundColor(.white)
		}
		
	}
}

struct BackgroundView: View {
	
	var topColor: Color
	var bottomColor: Color
	
	var body: some View {
		LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
					   startPoint: .topLeading,
					   endPoint: .bottomTrailing)
		.edgesIgnoringSafeArea(.all)
	}
}

struct CityTextView: View {
	
	var cityName: String
	var body: some View {
		Text(cityName)
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundColor(.white)
			.padding()
	}
}

struct MainWeatherStatusView: View {
	
	var imageName: String
	var temp: Int
	
	var body: some View {
		VStack(spacing: 8) {
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 180, height: 180)
			
			Text("\(temp)°")
				.font(.system(size: 70, weight: .medium))
				.foregroundColor(.white)
		}
	}
}

