//
//	Location.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Location : NSObject, NSCoding{

	var address : String!
	var cc : String!
	var city : String!
	var country : String!
	var crossStreet : String!
	var formattedAddress : [String]!
	var lat : Double!
	var lng : Double!
	var postalCode : String!
	var state : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		address = dictionary["address"] as? String
		cc = dictionary["cc"] as? String
		city = dictionary["city"] as? String
		country = dictionary["country"] as? String
		crossStreet = dictionary["crossStreet"] as? String
		formattedAddress = dictionary["formattedAddress"] as? [String]
		lat = dictionary["lat"] as? Double
		lng = dictionary["lng"] as? Double
		postalCode = dictionary["postalCode"] as? String
		state = dictionary["state"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if address != nil{
			dictionary["address"] = address
		}
		if cc != nil{
			dictionary["cc"] = cc
		}
		if city != nil{
			dictionary["city"] = city
		}
		if country != nil{
			dictionary["country"] = country
		}
		if crossStreet != nil{
			dictionary["crossStreet"] = crossStreet
		}
		if formattedAddress != nil{
			dictionary["formattedAddress"] = formattedAddress
		}
		if lat != nil{
			dictionary["lat"] = lat
		}
		if lng != nil{
			dictionary["lng"] = lng
		}
		if postalCode != nil{
			dictionary["postalCode"] = postalCode
		}
		if state != nil{
			dictionary["state"] = state
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "address") as? String
         cc = aDecoder.decodeObject(forKey: "cc") as? String
         city = aDecoder.decodeObject(forKey: "city") as? String
         country = aDecoder.decodeObject(forKey: "country") as? String
         crossStreet = aDecoder.decodeObject(forKey: "crossStreet") as? String
         formattedAddress = aDecoder.decodeObject(forKey: "formattedAddress") as? [String]
         lat = aDecoder.decodeObject(forKey: "lat") as? Double
         lng = aDecoder.decodeObject(forKey: "lng") as? Double
         postalCode = aDecoder.decodeObject(forKey: "postalCode") as? String
         state = aDecoder.decodeObject(forKey: "state") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if cc != nil{
			aCoder.encode(cc, forKey: "cc")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if crossStreet != nil{
			aCoder.encode(crossStreet, forKey: "crossStreet")
		}
		if formattedAddress != nil{
			aCoder.encode(formattedAddress, forKey: "formattedAddress")
		}
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lng != nil{
			aCoder.encode(lng, forKey: "lng")
		}
		if postalCode != nil{
			aCoder.encode(postalCode, forKey: "postalCode")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}

	}

}
