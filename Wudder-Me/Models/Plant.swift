//
//  Plant.swift
//  Wudder-Me
//
//  Created by Liana Norman on 9/16/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct AirTableResponse: Codable {
    let plantWrapper: [PlantWrapper]
    
    enum CodingKeys: String, CodingKey {
        case plantWrapper = "records"
    }
}

struct PlantWrapper: Codable {
    let plant: Plant
    
    enum CodingKeys: String, CodingKey {
        case plant = "fields"
    }
}

struct Plant: Codable {
    
    let name: String
    let image: [ImageWrapper]
    let duration: String
    let hours: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case image = "Attachments"
        case duration = "Duration"
        case hours = "Hours"
        case description = "Description"
        
    }
    
    struct ImageWrapper: Codable {
        let url: String
    }
    
    
    static func getPlants(from jsonData: Data) throws -> [Plant] {
        let response = try JSONDecoder().decode(AirTableResponse.self, from: jsonData)
        return response.plantWrapper.map {$0.plant}
    }
    
}

//{
//    "records": [
//    {
//    "id": "rec9Xpw2anoaovouU",
//    "fields": {
//    "Name": "Parlor Palm",
//    "Attachments": [
//    {
//    "id": "attXJnVeWTpngAXIN",
//    "url": "https://dl.airtable.com/.attachments/d06e61dcae28865bfc1fcfc7fe0530d0/f95535ab/Parlor-Palm.jpg",
//    "filename": "Parlor-Palm.jpg",
//    "size": 80610,
//    "type": "image/jpeg",
//    "thumbnails": {
//    "small": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/1564171e0a8ed73c0f602b3f23ff0a6e/3ce9e656",
//    "width": 24,
//    "height": 36
//    },
//    "large": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/1c8cb2411afacb27ee561571d0225c46/333be5f4",
//    "width": 512,
//    "height": 770
//    },
//    "full": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/b7f34f6e55f2888afe5b228d1d90b2b8/8555e2cb",
//    "width": 3000,
//    "height": 3000
//    }
//    }
//    }
//    ],
//    "Duration": "6",
//    "Hours": "480",
//    "Description": "Like many palms, they are sensitive to overwatering and cannot tolerate being waterlogged. Even moisture is ideal, but err on the side of slightly too dry rather than too wet. Water even less during the winter when the plant is not actively growing. Brown leaf tips often indicate overwatering, while yellow fronds tell you the plant needs a bit more water."
//    },
//    "createdTime": "2019-09-16T14:55:03.000Z"
//    },
//    {
//    "id": "recJ8j01gk6mBmVK9",
//    "fields": {
//    "Name": "Monstera Deliciosa",
//    "Attachments": [
//    {
//    "id": "att8cEABmyspiS9yZ",
//    "url": "https://dl.airtable.com/.attachments/b1b4da6d396302dc21ef857c2a95b784/6131c6f4/tumblr_ooje6oEeAz1s8tqb9o1_400.jpg",
//    "filename": "tumblr_ooje6oEeAz1s8tqb9o1_400.jpg",
//    "size": 91476,
//    "type": "image/jpeg",
//    "thumbnails": {
//    "small": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/f7a3723fe6078eac8233abdd660827b6/b9c83201",
//    "width": 27,
//    "height": 36
//    },
//    "large": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/6028d99be0406966d87f2908c89cf36e/ade1bb6f",
//    "width": 400,
//    "height": 533
//    },
//    "full": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/df07208c011d90839039630c13bf9438/d3bbb773",
//    "width": 3000,
//    "height": 3000
//    }
//    }
//    }
//    ],
//    "Duration": "17                                                                                                                                                                                                                                                                                                                                                                                                                                                       ,                            ,,,,,,,,, ,khkj  k k",
//    "Hours": "408",
//    "Description": "When its soil becomes dry to a depth of 1-2”, water your monstera directly into the pot so not to moisten foliage and just enough to keep the soil from completely drying out. Your Monstera is somewhat drought tolerant, so you don’t need to worry about keeping up with the watering all the time. Don’t allow the pot to stand in water, as this will cause root rot."
//    },
//    "createdTime": "2019-09-16T14:32:43.000Z"
//    },
//    {
//    "id": "recMucyAXfZx9avdm",
//    "fields": {
//    "Name": "Snake Plant",
//    "Attachments": [
//    {
//    "id": "attaOi653NXvzRPTi",
//    "url": "https://dl.airtable.com/.attachments/b94814f7948fb30761c69d7537637b55/94218ef7/tumblr_inline_o19uywMh6t1tl5ahs_400.png",
//    "filename": "tumblr_inline_o19uywMh6t1tl5ahs_400.png",
//    "size": 300898,
//    "type": "image/png",
//    "thumbnails": {
//    "small": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/bf6845986a61a4907228366254e11239/0c96340e",
//    "width": 24,
//    "height": 36
//    },
//    "large": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/40f291246962b1ba437d666174ef58d9/4ebbd26c",
//    "width": 400,
//    "height": 599
//    },
//    "full": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/2676cb88fca2a66ace96b96b9c25cb12/94b806b9",
//    "width": 3000,
//    "height": 3000
//    }
//    }
//    }
//    ],
//    "Duration": "21",
//    "Hours": "504",
//    "Description": "Your Sansevieria does not need much water, and overwatering can cause the plant to rot. Be sure to keep the leaves dry when watering and allow the soil to dry in between waterings. Reduce watering down to once a month during the winter."
//    },
//    "createdTime": "2019-09-16T14:33:34.000Z"
//    },
//    {
//    "id": "recdCBy495d3a28eR",
//    "fields": {
//    "Name": "Fiddle Leaf Fig",
//    "Attachments": [
//    {
//    "id": "attcIsXcIJ4j5LVF7",
//    "url": "https://dl.airtable.com/.attachments/de919d97e8197228f2a60c0f119ea780/8a1b1ff7/1.-Ficus-lyrata-Fiddle-Leaf-Fig-Tree-Leaves.jpg",
//    "filename": "1.-Ficus-lyrata-Fiddle-Leaf-Fig-Tree-Leaves.jpg",
//    "size": 81390,
//    "type": "image/jpeg",
//    "thumbnails": {
//    "small": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/f0e052719a048e616fa6e201722c0efb/d72a8329",
//    "width": 86,
//    "height": 36
//    },
//    "large": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/a44465a98eda5d033c346235180c339f/67b22f03",
//    "width": 1200,
//    "height": 500
//    },
//    "full": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/6338e9c87ccba8447626958dde9282f8/b9d545f0",
//    "width": 3000,
//    "height": 3000
//    }
//    }
//    }
//    ],
//    "Duration": "7",
//    "Hours": "168",
//    "Description": "Water when the top inch of the soil becomes dry, then thoroughly drench until the water drains into the saucer. Empty the saucer if the water level is high so not to drown the roots. If your plant does not get enough water, the leaves will become limp and floppy, eventually turning brown or yellow before falling off."
//    },
//    "createdTime": "2019-09-16T14:34:25.000Z"
//    },
//    {
//    "id": "rechwmMrm2zbJLsh1",
//    "fields": {
//    "Name": "Bird of Paradise",
//    "Description": "Keep the soil moist, but not soggy during the spring through fall. In the winter, allow two inches of soil to dry out between waterings. The Bird of Paradise cannot handle ‘wet feet’, meaning its roots should not sit in wet soil. It’s best to keep your Bird of Paradise on the dry side.",
//    "Duration": "14",
//    "Hours": "336",
//    "Attachments": [
//    {
//    "id": "atttPE7QEzanyU9YK",
//    "url": "https://dl.airtable.com/.attachments/b08febeae13b78378ec1b2ad471a4d6f/c789a946/birdOfParadise.jpg",
//    "filename": "birdOfParadise.jpg",
//    "size": 70142,
//    "type": "image/jpeg",
//    "thumbnails": {
//    "small": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/95362941ff80c45db7cefe55effe60c8/5c8ff7f5",
//    "width": 36,
//    "height": 36
//    },
//    "large": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/0023fd77c0a6228ab473384064dedd3b/b38a7028",
//    "width": 470,
//    "height": 470
//    },
//    "full": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/5bf0201a3e1714844cdf2d9e879a34f0/581cd844",
//    "width": 3000,
//    "height": 3000
//    }
//    }
//    }
//    ]
//    },
//    "createdTime": "2019-09-16T14:32:31.000Z"
//    },
//    {
//    "id": "recriuWrqh8wmEqtC",
//    "fields": {
//    "Name": "Chinese Money Tree",
//    "Attachments": [
//    {
//    "id": "attdEB97mB2sHyECo",
//    "url": "https://dl.airtable.com/.attachments/e9f3fabb39b88f4ffe714153dbd37e08/a6511503/PP-Plant.jpg",
//    "filename": "PP-Plant.jpg",
//    "size": 161474,
//    "type": "image/jpeg",
//    "thumbnails": {
//    "small": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/322761795b1f87403e72768f221f77b2/59c0b072",
//    "width": 48,
//    "height": 36
//    },
//    "large": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/07aa5bfe1a04108254ab61a7d21bc86e/11c4ccf7",
//    "width": 683,
//    "height": 512
//    },
//    "full": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/6354ba293700cdcd2f58de47f5524898/b27efc70",
//    "width": 3000,
//    "height": 3000
//    }
//    }
//    }
//    ],
//    "Duration": "7",
//    "Hours": "504",
//    "Description": "Your Pilea appreciates a complete and thorough soak when it’s watered. What matters is how often you’re doing the soaking, not how saturated the potting mix gets. Here’s how you do it: fill a shallow container with 1-2 inches of water. It should be large enough for your pot to fit in comfortably—a sink works great! Make sure your pot has a drainage hole and no pebbles at the bottom so the water can actually get to the potting mix. Allow the plant to sit in the water until the top of the potting mix is moist. This means the mix has wicked up exactly the amount it needs to be fully saturated. It can take a little while if the potting mix has totally dried out, so be patient! Remove it from the water and then allow it to drain before returning to your Pilea to its normal spot! Make sure not standing water in the saucer. Easy breezy!"
//    },
//    "createdTime": "2019-09-16T14:55:37.000Z"
//    },
//    {
//    "id": "recvhwTUQzldhsEtR",
//    "fields": {
//    "Name": "Rubber Tree",
//    "Attachments": [
//    {
//    "id": "attlNcNVAA0i6v9dN",
//    "url": "https://dl.airtable.com/.attachments/ecf1d6e09a246a57c38a8a6d583086db/ca06fcbb/09538697e046506a5d74f95d2cb2b304--rubber-plant-rubber-tree.jpg",
//    "filename": "09538697e046506a5d74f95d2cb2b304--rubber-plant-rubber-tree.jpg",
//    "size": 41442,
//    "type": "image/jpeg",
//    "thumbnails": {
//    "small": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/6449e7e04be29c3c8f22cdbfcd22c08d/a5b1ac70",
//    "width": 36,
//    "height": 36
//    },
//    "large": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/3379445229dd7d603d18849f0c0ff144/63fb9a77",
//    "width": 512,
//    "height": 512
//    },
//    "full": {
//    "url": "https://dl.airtable.com/.attachmentThumbnails/4085653083ea7b1b9f83eae348d6b163/6ce56b7b",
//    "width": 3000,
//    "height": 3000
//    }
//    }
//    }
//    ],
//    "Duration": "21",
//    "Hours": "504",
//    "Description": "Water when the top inch of the soil becomes dry, then thoroughly drench until the water drains into the saucer. Empty the saucer if the water level is high so not to drown the roots. Do not splash water on the leaves, this can cause stains. The worst thing you can do to your Rubber Tree is to over water it."
//    },
//    "createdTime": "2019-09-16T14:47:21.000Z"
//    }
//    ]
//}
