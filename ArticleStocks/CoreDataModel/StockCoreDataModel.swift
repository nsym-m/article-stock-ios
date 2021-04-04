//
//  StockCoreDataModel.swift
//  ArticleStocks
//
//  Created by 西山幹也 on 2021/04/05.
//

import Foundation
import UIKit
import CoreData

class StockCoreDataModel {
    
    /// Persistent Container
    ///
    /// AppDelegateに定義されたものを参照
    private static var persistentContainer: NSPersistentCloudKitContainer! = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    /// Managed Object Context
    ///
    /// Contextを返却
    private static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    /// 初期化
    ///
    /// インスタンス生成をさせないためのprivate化
    private init() {
    }
    
    /// 挿入
    static func insert(_ object: NSManagedObject) {
        context.insert(object)
    }
    
    /// 削除
    static func delete(_ object: NSManagedObject) {
        context.delete(object)
    }

    /// 保存
    static func save() {
        persistentContainer.saveContext(context: context)
    }
    
    /// 取り消し
    static func rollback() {
        persistentContainer.rollback(context: context)
    }
}

extension CoreDataModel {
    
    /// ユーザー情報一覧取得
    static func allUsers() -> [User] {

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // nicknameでソート
        let sortDescriptor = NSSortDescriptor(key: "nickname", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            return try context.fetch(request) as! [User]
        }
        catch {
            fatalError()
        }
    }
    
    /// 新規ユーザー情報生成
    static func newUser() -> User {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let user = User(entity: entity, insertInto: nil)
        return user
    }
}

let context = persistentContainer.viewContext

var appGroupIdentifier: String {
    #if DEVELOP_CONFIG
        return "group.jp.biosilver.dev.aams.appgroup"
    #else // PRODUCTION_CONFIG
        return "group.jp.co.biosilver.aamspush.appgroup"
    #endif
}

// MARK: - Core Data stack
var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "PushNotification")
    let storeUrl = URL.storeURL(for: appGroupIdentifier, databaseName: "PushNotification")
    let description = NSPersistentStoreDescription(url: storeUrl)
    container.persistentStoreDescriptions = [description]
    container.loadPersistentStores { description, error in
        print("Store description: \(description.description)")
        if let error = error {
            fatalError("Unable to load persistent stores: \(error)")
        }
    }
    return container
}()

// MARK: - Core Data Saving support
func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            // The context couldn't be saved.
            // You should add your own error handling here.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

func addNotificationItem(personName: String?, roomName: String?, alertName: String?, imageData: Data?, streamUrl: String?) {
    print("----\(#function)----")
    let newItem = NotificationItem(context: context)
    newItem.alertName = alertName
    newItem.username = personName
    newItem.roomName = roomName
    newItem.image = imageData
    newItem.video = streamUrl
    newItem.timeline = Date()
    
    do {
        try context.save()
    } catch {
        print("Error saving managed object context: \(error)")
    }
}
