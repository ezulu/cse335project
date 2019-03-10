//
//  ViewController.swift
//  zacharyDienstbierCSE335
//
//  Created by Guest User on 3/5/19.
//  Copyright © 2019 Guest User. All rights reserved.
//
import CoreData
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var workoutTable: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var disWorkouts = [Workout]()
    
    func fetchRecords() -> Int{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
        var x = 0
        disWorkouts = ((try? context.fetch(fetchRequest)) as? [Workout])!
        
        x = disWorkouts.count
        
        print(x)
        
        return x
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchRecords()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = disWorkouts[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == .delete
        {
            
            // delete the selected object from the managed
            // object context
            context.delete(disWorkouts[indexPath.row])
            // remove it from the fetch results array
            disWorkouts.remove(at:indexPath.row)
            
            do {
                // save the updated managed object context
                try context.save()
            } catch {
                
            }
            // reload the table after deleting a row
            workoutTable.reloadData()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        let entity = NSEntityDescription.entity(forEntityName: "Workout", in: context)
        let newWorkout = NSManagedObject(entity: entity!, insertInto:context)
        
        newWorkout.setValue("Workout2", forKey: "title")
        
        do{
            try context.save()
        }catch{
            print("Failed saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Workout")
        
        request.returnsObjectsAsFaults = false
        
        
        do{
            let result  = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "title") as! String)
            }
        }
        catch{
            print("failed")
        }
         ß*/
    }
    
    


}

