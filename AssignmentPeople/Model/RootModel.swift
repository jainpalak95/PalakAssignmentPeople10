//
//	RootModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class RootModel : NSObject, NSCoding{

	var restaurants : [Restaurant]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		restaurants = [Restaurant]()
		if let restaurantsArray = dictionary["restaurants"] as? [[String:Any]]{
			for dic in restaurantsArray{
				let value = Restaurant(fromDictionary: dic)
				restaurants.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if restaurants != nil{
			var dictionaryElements = [[String:Any]]()
			for restaurantsElement in restaurants {
				dictionaryElements.append(restaurantsElement.toDictionary())
			}
			dictionary["restaurants"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         restaurants = aDecoder.decodeObject(forKey :"restaurants") as? [Restaurant]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if restaurants != nil{
			aCoder.encode(restaurants, forKey: "restaurants")
		}

	}

}