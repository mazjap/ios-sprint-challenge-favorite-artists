//
//  JACArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Jordan Christensen on 11/9/19.
//  Copyright © 2019 Mazjap Co. All rights reserved.
//

#import "JACArtistsTableViewController.h"
#import "JACArtistViewController.h"
#import "JACArtistController.h"
#import "JACArtist.h"

@interface JACArtistsTableViewController ()

@end

@implementation JACArtistsTableViewController

JACArtistController *controller;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        controller = [[JACArtistController alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return controller.favoriteArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    JACArtist *artist = [controller.favoriteArtists objectAtIndex:indexPath.row];
    [cell.textLabel setText:artist.name];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"Formed in %d", artist.yearFormed]];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JACArtistViewController *destinationVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"ShowAddNewArtistSegue"]) {
        destinationVC.controller = controller;
    } else if ([segue.identifier isEqualToString:@"ShowAddNewArtistSegue"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.artist = controller.favoriteArtists[indexPath.row];
        destinationVC.controller = controller;
    }
}

@end
