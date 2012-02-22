//
//  SixPokemonsDetailTabViewController.m
//  Pokemon
//
//  Created by Kaijie Yu on 2/21/12.
//  Copyright (c) 2012 Kjuly. All rights reserved.
//

#import "SixPokemonsDetailTabViewController.h"

#import "../GlobalConstants.h"
#import "TrainerTamedPokemon.h"
#import "SixPokemonsInfoViewController.h"
#import "SixPokemonsMemoViewController.h"
#import "SixPokemonsSkillViewController.h"
#import "SixPokemonsMoveViewController.h"

@implementation SixPokemonsDetailTabViewController

@synthesize pokemon = pokemon_;
@synthesize sixPokemonsInfoViewController  = sixPokemonsInfoViewController_;
@synthesize sixPokemonsMemoViewController  = sixPokemonsMemoViewController_;
@synthesize sixPokemonsSkillViewController = sixPokemonsSkillViewController_;
@synthesize sixPokemonsMoveViewController  = sixPokemonsMoveViewController_;

-(void)dealloc
{
  [pokemon_ release];
  [sixPokemonsInfoViewController_  release];
  [sixPokemonsMemoViewController_  release];
  [sixPokemonsSkillViewController_ release];
  [sixPokemonsMoveViewController_  release];
  [super dealloc];
}

- (id)initWithPokemon:(TrainerTamedPokemon *)pokemon
{
  self = [super init];
  if (self) {
    // Set View Frame
    self.viewFrame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
    self.pokemon = pokemon;
    
    // Add child view controllers to each tab
    sixPokemonsInfoViewController_  = [[SixPokemonsInfoViewController alloc]  initWithPokemon:self.pokemon];
    sixPokemonsMemoViewController_  = [[SixPokemonsMemoViewController alloc]  initWithPokemon:self.pokemon];
    sixPokemonsSkillViewController_ = [[SixPokemonsSkillViewController alloc] initWithPokemon:self.pokemon];
    sixPokemonsMoveViewController_  = [[SixPokemonsMoveViewController alloc]  initWithPokemon:self.pokemon];
    
    // Set child views' Frame
    CGRect childViewFrame = CGRectMake(0.0f, kTopBarHeight, 320.0f, 480.0f - kTopBarHeight);
    [sixPokemonsInfoViewController_.view  setFrame:childViewFrame];
    [sixPokemonsMemoViewController_.view  setFrame:childViewFrame];
    [sixPokemonsSkillViewController_.view setFrame:childViewFrame];
    [sixPokemonsMoveViewController_.view  setFrame:childViewFrame];
    
    // Add child views as tab bar items
    self.tabBarItems = [NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:@"PokemonDetail_Info.png", @"image", sixPokemonsInfoViewController_, @"viewController", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"PokemonDetail_Area.png", @"image", sixPokemonsMemoViewController_, @"viewController", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"PokemonDetail_Size.png", @"image", sixPokemonsSkillViewController_, @"viewController", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"PokemonDetail_Size.png", @"image", sixPokemonsMoveViewController_, @"viewController", nil],
                        nil];
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
  [super loadView];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  
  self.pokemon = nil;
  self.sixPokemonsInfoViewController  = nil;
  self.sixPokemonsMemoViewController  = nil;
  self.sixPokemonsSkillViewController = nil;
  self.sixPokemonsMoveViewController  = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end