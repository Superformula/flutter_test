final Map<String, dynamic> response = {
  "data": {
    "search": {
      "total": 5056,
      "business": [
        {
          "id": "faPVqws-x-5k2CQKDNtHxw",
          "name": "Yardbird Southern Table & Bar",
          "price": "\$\$",
          "rating": 4.5,
          "photos": [
            "https:///s3-media4.fl.yelpcdn.com/bphoto/_zXRdYX4r1OBfF86xKMbDw/o.jpg"
          ],
          "location": {
            "formatted_address": "102 Lakeside Ave Seattle, WA 98122"
          },
          "reviews": [
            {
              "id": "sjZoO8wcK1NeGJFDk5i82Q",
              "rating": 5,
              "user": {
                "id": "BuBCkWFNT_O2dbSnBZvpoQ",
                "image_url":
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "name": "Gina T.",
              },
              "text":
                  "I love this place! The food is amazing and the service is great."
            },
            {
              "id": "okpO9hfpxQXssbTZTKq9hA",
              "rating": 5,
              "user": {
                "id": "0x9xu_b0Ct_6hG6jaxpztw",
                "image_url":
                    "https://images.unsplash.com/photo-1584999734482-0361aecad844?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "name": "Crystal L.",
              },
              "text": "Greate place to eat"
            },
          ]
        }
      ]
    }
  }
};

Map<String, dynamic> mockedRestaurant(
        {bool isOpen = false, String name = "Southern Bar"}) =>
    {
      "id": "faPVqws-x-5109203",
      "name": name,
      "price": "\$\$",
      "rating": 4.5,
      "photos": [""],
      "location": {"formatted_address": "102 Lakeside Ave Seattle, WA 98122"},
      "hours": [
        {"is_open_now": isOpen}
      ],
      "reviews": [
        {
          "id": "sjZoO8wcK1NeGJFDk5i82Q",
          "rating": 5,
          "user": {
            "id": "BuBCkWFNT_O2dbSnBZvpoQ",
            "image_url":
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "name": "Gina T.",
          },
          "text":
              "I love this place! The food is amazing and the service is great."
        },
        {
          "id": "okpO9hfpxQXssbTZTKq9hA",
          "rating": 5,
          "user": {
            "id": "0x9xu_b0Ct_6hG6jaxpztw",
            "image_url":
                "https://images.unsplash.com/photo-1584999734482-0361aecad844?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "name": "Crystal L.",
          },
          "text": "Greate place to eat"
        },
      ]
    };
