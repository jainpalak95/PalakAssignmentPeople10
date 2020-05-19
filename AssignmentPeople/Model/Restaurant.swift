//
//	Restaurant.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Restaurant : NSObject, NSCoding{

	var backgroundImageURL : String!
	var category : String!
	var contact : Contact!
	var location : Location!
	var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		backgroundImageURL = dictionary["backgroundImageURL"] as? String
		category = dictionary["category"] as? String
		if let contactData = dictionary["contact"] as? [String:Any]{
			contact = Contact(fromDictionary: contactData)
		}
		if let locationData = dictionary["location"] as? [String:Any]{
			location = Location(fromDictionary: locationData)
		}
		name = dictionary["name"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if backgroundImageURL != nil{
			dictionary["backgroundImageURL"] = backgroundImageURL
		}
		if category != nil{
			dictionary["category"] = category
		}
		if contact != nil{
			dictionary["contact"] = contact.toDictionary()
		}
		if location != nil{
			dictionary["location"] = location.toDictionary()
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         backgroundImageURL = aDecoder.decodeObject(forKey: "backgroundImageURL") as? String
         category = aDecoder.decodeObject(forKey: "category") as? String
         contact = aDecoder.decodeObject(forKey: "contact") as? Contact
         location = aDecoder.decodeObject(forKey: "location") as? Location
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if backgroundImageURL != nil{
			aCoder.encode(backgroundImageURL, forKey: "backgroundImageURL")
		}
		if category != nil{
			aCoder.encode(category, forKey: "category")
		}
		if contact != nil{
			aCoder.encode(contact, forKey: "contact")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}