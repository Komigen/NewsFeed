import Foundation

struct ModelNews: Decodable {
    let contentType, date, server, via: String
    let xAmzApigwID, xAmzCFID, xAmzCFPop, xAmznRemappedContentLength: String
    let xAmznRequestid, xAmznTraceID, xCache, xRapidapiRegion: String
    let xRapidapiVersion, contentLength, connection: String

    enum CodingKeys: String, CodingKey {
        case contentType = "content-type"
        case date, server, via
        case xAmzApigwID = "x-amz-apigw-id"
        case xAmzCFID = "x-amz-cf-id"
        case xAmzCFPop = "x-amz-cf-pop"
        case xAmznRemappedContentLength = "x-amzn-remapped-content-length"
        case xAmznRequestid = "x-amzn-requestid"
        case xAmznTraceID = "x-amzn-trace-id"
        case xCache = "x-cache"
        case xRapidapiRegion = "x-rapidapi-region"
        case xRapidapiVersion = "x-rapidapi-version"
        case contentLength = "content-length"
        case connection
    }
}
