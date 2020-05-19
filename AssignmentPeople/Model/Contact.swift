//
//	Contact.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Contact : NSObject, NSCoding{

	var formattedPhone : String!
	var phone : String!
	var twitter : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		formattedPhone = dictionary["formattedPhone"] as? String
		phone = dictionary["phone"] as? String
		twitter = dictionary["twitter"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if formattedPhone != nil{
			dictionary["formattedPhone"] = formattedPhone
		}
		if phone != nil{
			dictionary["phone"] = phone
		}
		if twitter != nil{
			dictionary["twitter"] = twitter
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         formattedPhone = aDecoder.decodeObject(forKey: "formattedPhone") as? String
         phone = aDecoder.decodeObject(forKey: "phone") as? String
         twitter = aDecoder.decodeObject(forKey: "twitter") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if formattedPhone != nil{
			aCoder.encode(formattedPhone, forKey: "formattedPhone")
		}
		if phone != nil{
			aCoder.encode(phone, forKey: "phone")
		}
		if twitter != nil{
			aCoder.encode(twitter, forKey: "twitter")
		}

	}

}