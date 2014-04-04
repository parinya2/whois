//
//  StageSelectorController.m
//  WhoIs
//
//  Created by PRINYA on 3/30/2557 BE.
//  Copyright (c) 2557 PRINYA. All rights reserved.
//

#import "StageSelectorController.h"
#import "QuizListController.h"

@interface StageSelectorController ()

@end

@implementation StageSelectorController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 3;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StageSelectorCell" forIndexPath:indexPath];
  
  if (indexPath.row == 0 && indexPath.section == 0) {
    cell.backgroundColor = [UIColor grayColor];
  } else {
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock_icon"]];
    cell.backgroundView.contentMode = UIViewContentModeScaleAspectFit;
    cell.backgroundColor = [UIColor whiteColor];
  }

  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
  if([collectionView cellForItemAtIndexPath:indexPath].backgroundColor == [UIColor grayColor]){
    QuizListController *quizListController = [storyboard instantiateViewControllerWithIdentifier:@"QuizList"];
    quizListController.navigationItem.title = [NSString stringWithFormat:@"Level %d", indexPath.section*3+indexPath.row+1];
    [self.navigationController pushViewController:quizListController animated:YES];
  }
}

#pragma mark - UICollectionView Layout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(5, 5, 5, 5);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//  return 22.0;
//}

@end
