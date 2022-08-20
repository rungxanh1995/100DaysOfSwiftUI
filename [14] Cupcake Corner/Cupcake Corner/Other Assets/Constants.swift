//
//  Constants.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-19.
//

import Foundation

struct Constants {
	private static let decorativeCupcakeImageUrls: [URL?] = [
		URL(string: "https://cdn.dribbble.com/users/21264/screenshots/1282595/media/e38f40834c14e52559a1c65cec518c98.png"),
		URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
		URL(string: "https://img.freepik.com/premium-vector/set-cupcakes-illustrations-desserts-cartoon-style_313437-646.jpg?w=600"),
		URL(string: "https://img.freepik.com/premium-vector/delicious-cupcakes-vector-sprinkles-muffin-set-isolated-white-background-eps-10_505557-888.jpg?w=600"),
		URL(string: "https://img.freepik.com/premium-vector/icon-set-yummy-colored-cupcakes_124848-178.jpg?w=600"),
		URL(string: "https://img.freepik.com/premium-vector/cute-raspberry-dessert-vector-illustration_650511-572.jpg?w=600"),
		URL(string: "https://img.freepik.com/premium-vector/cupcakes-with-swirled-rainbow-icing-tasty-shiny-muffins-with-colorful-cream_499431-714.jpg?w=600"),
		URL(string: "https://www.seekpng.com/png/detail/199-1999573_cute-cupcake-clip-art-cute-cartoon-image-halloween.png"),
		URL(string: "https://t3.ftcdn.net/jpg/04/98/88/88/360_F_498888820_SwV5fIv8XMcAFLfZghofHrWgoj4JNMjw.jpg")
	]
			
	static var randomDecorativeCupcakeUrl: URL? {
		let randomIndex = Int.random(in: 0..<Self.decorativeCupcakeImageUrls.count)
		return Self.decorativeCupcakeImageUrls[randomIndex]
	}
	
	static let deliveryTruckImageName: String = "deliveryTruck"
}
