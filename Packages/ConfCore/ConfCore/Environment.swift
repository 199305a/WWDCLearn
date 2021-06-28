//
//  File.swift
//
//
//  Created by dev on 2021/6/28.
//

import Foundation

public extension Notification.Name {
    static let WWDCEnvironmentDidChange = Notification.Name("WWDCEnvironmentDidChange")
}

public struct Environment: Equatable {
    public let baseURL: String
    public let cocoaHubBaseURL: String
    public let configPath: String
    public let sessionsPath: String
    public let newsPath: String
    public let liveVideosPath: String
    public let featuredSectionsPath: String
    public init(baseURL: String, cocoaHubBaseURL: String, configPath: String, sessionsPath: String, newsPath: String, liveVideosPath: String, featuredSectionsPath: String) {
        self.baseURL = baseURL
        self.cocoaHubBaseURL = cocoaHubBaseURL
        self.configPath = configPath
        self.sessionsPath = sessionsPath
        self.newsPath = newsPath
        self.liveVideosPath = liveVideosPath
        self.featuredSectionsPath = featuredSectionsPath
    }

    public static func setCurrent(_ environment:Environment){
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        let shouldNotify = (environment != Environment.current)
    }
}
extension Environment {
    public static let defaultCocoaHubBaseURL = "https://cocoahub.wwdc.io"
    public static var current:Environment {
        return .test
    }

    public static let production = Environment(baseURL: "http://api2021.wwdc.io", cocoaHubBaseURL:Self.defaultCocoaHubBaseURL, configPath: "/config.json", sessionsPath: "/contents.json", newsPath: "/news.json", liveVideosPath: "/video_live.json", featuredSectionsPath: "/_featured.json")

    public static let test = Environment(baseURL: "http://localhost:9042", cocoaHubBaseURL:Self.defaultCocoaHubBaseURL, configPath: "/config.json", sessionsPath: "/contents.json", newsPath: "/news.json", liveVideosPath: "/video_live.json", featuredSectionsPath: "/_featured.json")
}
