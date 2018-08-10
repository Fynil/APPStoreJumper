//
//  ViewController.m
//  APPStoreJumper
//
//  Created by Fynil on 2018/8/10.
//  Copyright © 2018年 Fynil. All rights reserved.
//

#import "ViewController.h"
#import "YFAPPStoreJumper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
@property (nonatomic, strong) YFAPPStoreJumper *jumper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)jumpToAppStore:(UIButton *)sender {
    self.jumper = [[YFAPPStoreJumper alloc] initWithAppID:self.field.text];
    if (self.seg.selectedSegmentIndex) {
        [self.jumper showAPPStoreInVC:self];
    } else {
        [self.jumper jumpToAPPStore];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
