import Foundation

struct CurrentPost {
    
    let status:             String?
    let totalResults:       Int?
    let id:                 String?
    let sourceName:         String?
    let author:             String?
    let title:              String?
    let articleDescription: String?
    let url:                String?
    let urlToImage:         String?
    let publishedAt:        String?
    let content:            String?
    
    
    init?(modelNews: ModelNews) {
        status             = modelNews.status
        totalResults       = modelNews.totalResults
        id                 = modelNews.articles?.first?.source?.id
        sourceName         = modelNews.articles?.first?.source?.name
        author             = modelNews.articles?.first?.author
        title              = modelNews.articles?.first?.title
        articleDescription = modelNews.articles?.first?.articleDescription
        url                = modelNews.articles?.first?.url
        urlToImage         = modelNews.articles?.first?.urlToImage
        publishedAt        = modelNews.articles?.first?.publishedAt
        content            = modelNews.articles?.first?.content
    }
}
