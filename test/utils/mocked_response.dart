final Map<String, dynamic> mockedResponse = {
  "total": 10,
  "business": [
    {
      "id": "1",
      "name": "Restaurant Name Goes Here And Wraps 2 Lines One",
      "price": "\$",
      "rating": 4.5,
      "photos": [
        "https://i.natgeofe.com/n/04cf2a79-4a49-45eb-90f8-38356167690d/image00037.jpeg",
      ],
      "categories": [
        {
          "alias": "italian",
          "title": "Italian",
        }
      ],
      "hours": [
        {
          "is_open_now": true,
        }
      ],
      "reviews": [
        {
          "id": "r1",
          "rating": 5,
          "text":
              "Review text goes here. Review text goes here. This is a review. This is a review that is 3 lines long.",
          "user": {
            "id": "u1",
            "image_url": "https://example.com/user1.jpg",
            "name": "John Doe",
          },
        },
        {
          "id": "r2",
          "rating": 2,
          "text":
              "Review text goes here. Review text goes here. This is a review. This is a review that is 3 lines long.",
          "user": {
            "id": "u1",
            "image_url": "https://example.com/user1.jpg",
            "name": "John Doe",
          },
        },
        {
          "id": "r3",
          "rating": 4,
          "text": "Amazing food and atmosphere!",
          "user": {
            "id": "u1",
            "image_url": "https://example.com/user1.jpg",
            "name": "John Doe",
          },
        }
      ],
      "location": {
        "formatted_address": "123 Main St, New York, NY",
      },
    },
    {
      "id": "2",
      "name": "Restaurant Name Goes Here And Wraps 2 Lines Two",
      "price": "\$",
      "rating": 4.0,
      "photos": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMh9wiF1vxFv2KBN2QWkxbC1RekcuVeDKFdw&s",
      ],
      "categories": [
        {
          "alias": "mexican",
          "title": "Mexican",
        }
      ],
      "hours": [
        {
          "is_open_now": false,
        }
      ],
      "reviews": [],
      "location": {
        "formatted_address": "456 Broadway, Los Angeles, CA",
      },
    },
    {
      "id": "3",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Three",
      "price": "\$",
      "rating": 3.5,
      "photos": [
        "https://media.cntraveler.com/photos/654bd5e13892537a8ded0947/16:9/w_2560%2Cc_limit/phy2023.din.oss.Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines-lr.jpg",
      ],
      "categories": [
        {
          "alias": "chinese",
          "title": "Chinese",
        }
      ],
      "hours": [
        {
          "is_open_now": true,
        }
      ],
      "reviews": [
        {
          "id": "r3",
          "rating": 3,
          "text": "Average experience, nothing special.",
          "user": {
            "id": "u3",
            "image_url": "https://example.com/user3.jpg",
            "name": "Alice Brown",
          },
        }
      ],
      "location": {
        "formatted_address": "789 Market St, San Francisco, CA",
      },
    },
    {
      "id": "4",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Four",
      "price": "\$",
      "rating": 4.8,
      "photos": [
        "https://i.natgeofe.com/n/04cf2a79-4a49-45eb-90f8-38356167690d/image00037.jpeg",
      ],
      "categories": [
        {
          "alias": "french",
          "title": "French",
        }
      ],
      "hours": [
        {
          "is_open_now": false,
        }
      ],
      "reviews": [
        {
          "id": "r4",
          "rating": 5,
          "text": "Exquisite dining experience.",
          "user": {
            "id": "u4",
            "image_url": "https://example.com/user4.jpg",
            "name": "Charlie Green",
          },
        }
      ],
      "location": {
        "formatted_address": "321 Park Ave, Boston, MA",
      },
    },
    {
      "id": "5",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Five",
      "price": "\$",
      "rating": 4.2,
      "photos": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMh9wiF1vxFv2KBN2QWkxbC1RekcuVeDKFdw&s",
      ],
      "categories": [
        {
          "alias": "indian",
          "title": "Indian",
        }
      ],
      "hours": [
        {
          "is_open_now": true,
        }
      ],
      "reviews": [
        {
          "id": "r5",
          "rating": 4,
          "text": "Authentic Indian cuisine, loved it.",
          "user": {
            "id": "u5",
            "image_url": "https://example.com/user5.jpg",
            "name": "David Lee",
          },
        }
      ],
      "location": {
        "formatted_address": "654 Elm St, Chicago, IL",
      },
    },
    {
      "id": "6",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Six",
      "price": "\$",
      "rating": 4.6,
      "photos": [
        "https://media.cntraveler.com/photos/654bd5e13892537a8ded0947/16:9/w_2560%2Cc_limit/phy2023.din.oss.Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines-lr.jpg",
      ],
      "categories": [
        {
          "alias": "japanese",
          "title": "Japanese",
        }
      ],
      "hours": [
        {
          "is_open_now": false,
        }
      ],
      "reviews": [
        {
          "id": "r6",
          "rating": 5,
          "text": "Amazing sushi and service.",
          "user": {
            "id": "u6",
            "image_url": "https://example.com/user6.jpg",
            "name": "Emily White",
          },
        }
      ],
      "location": {
        "formatted_address": "987 Sunset Blvd, Miami, FL",
      },
    },
    {
      "id": "7",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Seven",
      "price": "\$",
      "rating": 4.3,
      "photos": [
        "https://i.natgeofe.com/n/04cf2a79-4a49-45eb-90f8-38356167690d/image00037.jpeg",
      ],
      "categories": [
        {
          "alias": "thai",
          "title": "Thai",
        }
      ],
      "hours": [
        {
          "is_open_now": true,
        }
      ],
      "reviews": [
        {
          "id": "r7",
          "rating": 4,
          "text": "Great flavors, but service was slow.",
          "user": {
            "id": "u7",
            "image_url": "https://example.com/user7.jpg",
            "name": "Michael Brown",
          },
        }
      ],
      "location": {
        "formatted_address": "852 Ocean Ave, Seattle, WA",
      },
    },
    {
      "id": "8",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Eight",
      "price": "\$",
      "rating": 3.9,
      "photos": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMh9wiF1vxFv2KBN2QWkxbC1RekcuVeDKFdw&s",
      ],
      "categories": [
        {
          "alias": "burger",
          "title": "Burger",
        }
      ],
      "hours": [
        {
          "is_open_now": true,
        }
      ],
      "reviews": [
        {
          "id": "r8",
          "rating": 4,
          "text": "Great burgers for a reasonable price.",
          "user": {
            "id": "u8",
            "image_url": "https://example.com/user8.jpg",
            "name": "Jessica Johnson",
          },
        }
      ],
      "location": {
        "formatted_address": "753 Central St, Austin, TX",
      },
    },
    {
      "id": "9",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Nine",
      "price": "\$",
      "rating": 4.9,
      "photos": [
        "https://media.cntraveler.com/photos/654bd5e13892537a8ded0947/16:9/w_2560%2Cc_limit/phy2023.din.oss.Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines-lr.jpg",
      ],
      "categories": [
        {
          "alias": "steakhouse",
          "title": "Steakhouse",
        }
      ],
      "hours": [
        {
          "is_open_now": false,
        }
      ],
      "reviews": [
        {
          "id": "r9",
          "rating": 5,
          "text": "Best steakhouse in town.",
          "user": {
            "id": "u9",
            "image_url": "https://example.com/user9.jpg",
            "name": "Chris Blue",
          },
        }
      ],
      "location": {
        "formatted_address": "369 High St, Dallas, TX",
      },
    },
    {
      "id": "10",
      "name":
          "Restaurant Name Goes Here And Wraps 2 Lines Name Goes Here And Wraps 2 Lines Ten",
      "price": "\$\$",
      "rating": 3.8,
      "photos": [
        "https://i.natgeofe.com/n/04cf2a79-4a49-45eb-90f8-38356167690d/image00037.jpeg",
      ],
      "categories": [
        {
          "alias": "pizza",
          "title": "Pizza",
        }
      ],
      "hours": [
        {
          "is_open_now": true,
        }
      ],
      "reviews": [
        {
          "id": "r10",
          "rating": 3,
          "text": "Good pizza, but nothing special.",
          "user": {
            "id": "u10",
            "image_url": "https://example.com/user10.jpg",
            "name": "Tom Green",
          },
        }
      ],
      "location": {
        "formatted_address": "258 Oak St, Orlando, FL",
      },
    }
  ],
};

final Map<String, dynamic> mockedApiResponse = {
  "data": {
    "search": mockedResponse,
  },
};
