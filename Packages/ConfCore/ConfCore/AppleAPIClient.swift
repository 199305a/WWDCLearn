//
//  File.swift
//  
//
//  Created by dev on 2021/6/28.
//

import Foundation 
import Siesta

public final class AppleAPIClient {
    fileprivate var environment:Environment
    fileprivate var service:Service
    private var environmentChangeToken:NSObjectProtocol?

    public init(environment:Environment){
        self.environment = environment
        service =  Service(baseURL: environment.baseURL)
        configureService()
        environmentChangeToken = NotificationCenter.default.addObserver(forName: .WWDCEnvironmentDidChange, object: nil, queue: .main, using: { [weak self](_) in
            self?.updateEnvironment()
        })
    }
    deinit {
        if let token = environmentChangeToken {
            NotificationCenter.default.removeObserver(token);
        }
    }

    private func configureService(){
        service.configure("**") { (config) in
            config.pipeline[.parsing].removeTransformers()
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.confCoreFormatter)
//        service.configureTransformer(environment.newsPath) { (entity:Entity<Data>)throws -> [NewsItem]? in
//            <#code#>
//        }

    }

    fileprivate func updateEnvironment()  {

    }
    
}
