import Foundation

extension NetworkManagerNews {
    
    func getSearchUrlString(words: String, country: String, lang: String) -> String { return "https://google-news.p.rapidapi.com/v1/search?q=Elon%20Musk&country=\(country)&lang=\(lang)"
    }
    
    func getSearchBySourceUrlString(source: String, lang: String, country: String) -> String { return "https://google-news.p.rapidapi.com/v1/source_search?source=\(source)&lang=\(lang)&country=\(country)"
    }
    
    func getGeographicHeadlinesUrlString(lang: String, country: String, geo: String) -> String { return "https://google-news.p.rapidapi.com/v1/geo_headlines?lang=\(lang)&country=\(country)&geo=\(geo)"
    }
    
    func getTopicHeadlinesUrlString(lang: String, country: String, topic: String) -> String { return "https://google-news.p.rapidapi.com/v1/topic_headlines?lang=\(lang)&country=\(country)&topic=\(topic)"
    }
    
    func getTopHeadlinesUrlString(lang: String, country: String) -> String { return "https://google-news.p.rapidapi.com/v1/top_headlines?lang=\(lang)&country=\(country)"
    }
}
