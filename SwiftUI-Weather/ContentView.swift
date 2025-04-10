//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Christian Luperon on 4/5/25.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isNight = false
	
    var body: some View {
        ZStack {
			BackgroundView(isNight: $isNight)
			VStack {
				CityTextView(cityName: "Hialeah, FL")
				MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
				WeeklyView()
				Spacer()
				
				Button {
					isNight.toggle()
				} label: {
					ButtonDesign(title: isNight ? "Light Mode!" : "Dark Mode!", textColor: .blue, backgroundColor: .white)
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
	
	@Binding var isNight: Bool
	
	var body: some View {
		LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
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


struct WeeklyView: View {
	
	var days : [String] = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
	
	var body: some View {
		HStack(spacing: 10) {
			WeatherDayView(dayOfWeek: days[1], imageName: "cloud.sun.fill", temp: 74)
			WeatherDayView(dayOfWeek: days[2], imageName: "sun.max.fill", temp: 90)
			WeatherDayView(dayOfWeek: days[3], imageName: "cloud.heavyrain.fill", temp: 82)
			WeatherDayView(dayOfWeek: days[4], imageName: "hurricane", temp: 98)
			WeatherDayView(dayOfWeek: days[5], imageName: "cloud.bolt.rain.fill", temp: 72)
			
		}
	}
}
