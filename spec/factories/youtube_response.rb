class YoutubeResponse
  attr_reader :code, :body

  def initialize(data)
    @code = data[:code]
    @body = data[:body]
  end
end

FactoryBot.define do
  factory :youtube_response do
    code { 200 }
    body { {}.to_json }

    trait :search do
      body {
        {
          "kind": "youtube#searchListResponse",
          "etag": "vt0g0_4UZ6A4sW6ZgUOPA547_UU",
          "nextPageToken": "CAoQAA",
          "regionCode": "VN",
          "pageInfo": {
            "totalResults": 1000000,
            "resultsPerPage": 10
          },
          "items": [
            {
              "kind": "youtube#searchResult",
              "etag": "SA5IYSoKDf_aWaze13tutZFbrZ0",
              "id": {
                "kind": "youtube#video",
                "videoId": "ezmsrB59mj8"
              },
              "snippet": {
                "publishedAt": "2017-12-19T15:34:56Z",
                "channelId": "UCx96yiXiRJwjDutYUYqk8FQ",
                "title": "ABC Song | Learn ABC Alphabet for Children | Education ABC Nursery Rhymes",
                "description": "ABC Song | Learn ABC Alphabet for Children | Education ABC Nursery Rhymes ABC Alphabet Song Lyrics: ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/ezmsrB59mj8/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/ezmsrB59mj8/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/ezmsrB59mj8/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "Mega Fun Kids Songs & Nursery Rhymes",
                "liveBroadcastContent": "none",
                "publishTime": "2017-12-19T15:34:56Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "D8SiAnpGzblkYAeYZYahIhU4Yeg",
              "id": {
                "kind": "youtube#video",
                "videoId": "71h8MZshGSs"
              },
              "snippet": {
                "publishedAt": "2019-04-12T07:00:00Z",
                "channelId": "UCbCmjCuTUZos6Inko4u57UQ",
                "title": "ABC Song + More Nursery Rhymes &amp; Kids Songs - CoComelon",
                "description": "Subscribe for new videos every week! https://www.youtube.com/c/Cocomelon?sub_confirmation=1 A new compilation video, ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/71h8MZshGSs/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/71h8MZshGSs/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/71h8MZshGSs/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "Cocomelon - Nursery Rhymes",
                "liveBroadcastContent": "none",
                "publishTime": "2019-04-12T07:00:00Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "hDM8iLpxO3KGUguzAFtlJZ9syqY",
              "id": {
                "kind": "youtube#video",
                "videoId": "IuV2y5te2o4"
              },
              "snippet": {
                "publishedAt": "2018-07-16T05:10:44Z",
                "channelId": "UCNy5c6_lG6TC2oqKK13hyFQ",
                "title": "A Con Cá Sấu | Học Bảng Chữ Cái ABC Với Các Nghệ Sĩ Nổi Tiếng - Nhạc Thiếu Nhi Hay 2018",
                "description": "A Con Cá Sấu | Học Bảng Chữ Cái ABC Với Các Nghệ Sĩ Nổi Tiếng Các bạn nhỏ nhớ đăng ký kênh và bấm chuông để nghe ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/IuV2y5te2o4/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/IuV2y5te2o4/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/IuV2y5te2o4/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "VOI TV",
                "liveBroadcastContent": "none",
                "publishTime": "2018-07-16T05:10:44Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "sksCZjZGV4i-YBlVNxdOG43K0Ag",
              "id": {
                "kind": "youtube#video",
                "videoId": "_UR-l3QI2nE"
              },
              "snippet": {
                "publishedAt": "2014-05-01T11:12:58Z",
                "channelId": "UCbCmjCuTUZos6Inko4u57UQ",
                "title": "ABC SONG | ABC Songs for Children - 13 Alphabet Songs &amp; 26 Videos",
                "description": "ABC Song and Alphabet Song Ultimate kids songs and baby songs Collection with 13 entertaining \"English abcd songs\" and 26 a ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/_UR-l3QI2nE/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/_UR-l3QI2nE/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/_UR-l3QI2nE/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "Cocomelon - Nursery Rhymes",
                "liveBroadcastContent": "none",
                "publishTime": "2014-05-01T11:12:58Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "GkJSIf9NjCvHUbolYY7px7PVfY4",
              "id": {
                "kind": "youtube#video",
                "videoId": "qmD5zW1lfC0"
              },
              "snippet": {
                "publishedAt": "2019-05-10T06:33:19Z",
                "channelId": "UCrN4Im61CRrgWsjydAT2fRA",
                "title": "Bài hát ABC cho trẻ  Học tiếng Anh bằng ABC Song",
                "description": "",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/qmD5zW1lfC0/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/qmD5zW1lfC0/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/qmD5zW1lfC0/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "DreGGor",
                "liveBroadcastContent": "none",
                "publishTime": "2019-05-10T06:33:19Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "pZLR5tHTXnA8zzoZy3RqgBKjtB4",
              "id": {
                "kind": "youtube#video",
                "videoId": "yqsux6Y1D1M"
              },
              "snippet": {
                "publishedAt": "2018-07-16T04:59:40Z",
                "channelId": "UCNy5c6_lG6TC2oqKK13hyFQ",
                "title": "ABC Song - Bài hát ABC Tiếng Việt [ Full ] | Giúp Bé Học Chữ Cái Qua Bài hát | VOI TV",
                "description": "Bảng chữ cái Tiếng Việt - Giúp bé yêu học bảng chữ cái, tập nói sớm và phát triển trí tuệ. Các bạn nhỏ nhớ đăng ký kênh và bấm ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/yqsux6Y1D1M/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/yqsux6Y1D1M/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/yqsux6Y1D1M/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "VOI TV",
                "liveBroadcastContent": "none",
                "publishTime": "2018-07-16T04:59:40Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "i2-XrYPIcduFuQydciLM_MF5IVk",
              "id": {
                "kind": "youtube#video",
                "videoId": "bekw252Jp0g"
              },
              "snippet": {
                "publishedAt": "2023-04-22T11:00:22Z",
                "channelId": "UCFBT7aGUewVJl16KKYAAccA",
                "title": "ALL Alphabet Lore Meme | Part 12  (A-Z...)",
                "description": "alphabetlore #numberslore #alphabet #number #vs #lore #bigfootjustice #letters #abc #transform #alphabetreverse #reverse ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/bekw252Jp0g/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/bekw252Jp0g/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/bekw252Jp0g/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "RaNaNa",
                "liveBroadcastContent": "none",
                "publishTime": "2023-04-22T11:00:22Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "i38HAJZO79OygapdxtVQAejhPPs",
              "id": {
                "kind": "youtube#video",
                "videoId": "NvdUSZyCGRs"
              },
              "snippet": {
                "publishedAt": "2021-04-27T10:15:02Z",
                "channelId": "UCx790OVgpTC1UVBQIqu3gnQ",
                "title": "Roma and Diana learn the alphabet / ABC song",
                "description": "Roma and Diana learn the English Alphabet. ABC song for kids Roma's Instagram: https://www.instagram.com/kidsromashow/ ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/NvdUSZyCGRs/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/NvdUSZyCGRs/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/NvdUSZyCGRs/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "★ Kids Roma Show",
                "liveBroadcastContent": "none",
                "publishTime": "2021-04-27T10:15:02Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "Imun6QYlBv8WOuwfvNsUBeEqEyA",
              "id": {
                "kind": "youtube#video",
                "videoId": "xY3Z8acE8ew"
              },
              "snippet": {
                "publishedAt": "2019-03-26T07:00:06Z",
                "channelId": "UCbCmjCuTUZos6Inko4u57UQ",
                "title": "The ABC Song | CoComelon Nursery Rhymes &amp; Kids Songs",
                "description": "It's time to learn the alphabet! Sing the ABCs along with us! Subscribe for new videos every week: ...",
                "thumbnails": {
                  "default": {
                    "url": "https://i.ytimg.com/vi/xY3Z8acE8ew/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/xY3Z8acE8ew/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/xY3Z8acE8ew/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "Cocomelon - Nursery Rhymes",
                "liveBroadcastContent": "none",
                "publishTime": "2019-03-26T07:00:06Z"
              }
            },
            {
              "kind": "youtube#searchResult",
              "etag": "-ci7XvUyL52H-rBaN-WaqEfD_YI",
              "id": {
                "kind": "youtube#video",
                "videoId": "hq3yfQnllfQ"
              },
              "snippet": {
                "publishedAt": "2014-03-06T20:57:50Z",
                "channelId": "UCBnZ16ahKA2DZ_T5W0FPUXg",
                "title": "Phonics Song with TWO Words - A For Apple - ABC Alphabet Songs with Sounds for Children",
                "description": "To download and watch this video anywhere and at any time, get the ChuChu TV Pro app now by clicking the below link!",
                "thumbnails": { "default": {
                    "url": "https://i.ytimg.com/vi/hq3yfQnllfQ/default.jpg",
                    "width": 120,
                    "height": 90
                  },
                  "medium": {
                    "url": "https://i.ytimg.com/vi/hq3yfQnllfQ/mqdefault.jpg",
                    "width": 320,
                    "height": 180
                  },
                  "high": {
                    "url": "https://i.ytimg.com/vi/hq3yfQnllfQ/hqdefault.jpg",
                    "width": 480,
                    "height": 360
                  }
                },
                "channelTitle": "ChuChu TV Nursery Rhymes & Kids Songs",
                "liveBroadcastContent": "none",
                "publishTime": "2014-03-06T20:57:50Z"
              }
            }
          ]
        }.to_json
      }
    end

    initialize_with { new(attributes) }
  end
end
