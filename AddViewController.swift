//
//  AddViewController.swift
//  CoreDataBooks
//
//  Translated by OOPer in cooperation with shlab.jp, on 2014/09/07.
//
//
/*
     File: AddViewController.h
     File: AddViewController.m
 Abstract: The table view controller responsible managing addition of a new book to the application.
  When editing ends, the controller sends a message to its delegate (in this case, the root view controller) to tell it that it finished editing and whether the user saved their changes. It's up to the delegate to actually commit the changes.
 The view controller needs a strong reference to the managed object context to make sure it doesn't disappear while being used (a managed object doesn't have a strong reference to its context).

  Version: 1.5

 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.

 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.

 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.

 Copyright (C) 2014 Apple Inc. All Rights Reserved.

 */

import CoreData


@objc(AddViewControllerDelegate)
protocol AddViewControllerDelegate {
    func add(_ controller: AddViewController, didFinishWithSave save: Bool)
}


@objc(AddViewController)
class AddViewController: DetailViewController {
    weak var delegate: AddViewControllerDelegate?
    var managedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the undo manager and set editing state to YES.
        setUpUndoManager()
        self.isEditing = true
    }
    
    
    @IBAction func cancel(_ sender: AnyObject) {
        self.delegate?.add(self, didFinishWithSave: false)
    }
    
    
    @IBAction func save(_ sender: AnyObject) {
        self.delegate?.add(self, didFinishWithSave: true)
    }
    
    deinit {
        cleanUpUndoManager()
    }
    
    
}
