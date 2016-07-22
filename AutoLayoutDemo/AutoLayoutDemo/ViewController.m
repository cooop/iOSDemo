//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by 金鑫 on 16/7/21.
//  Copyright © 2016年 Cooop. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *blueView;
@property (strong, nonatomic) IBOutlet UIView *redView;
@property (strong, nonatomic) IBOutlet UIView *greenView;
@property (strong, nonatomic) IBOutlet UIView *yellowView;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    


//    self.label.text = @"aaaaaaaaaaaaaaa";
//    [self.label setContentHuggingPriority:752 forAxis:UILayoutConstraintAxisHorizontal];
//    [self.label setContentCompressionResistancePriority:752 forAxis:UILayoutConstraintAxisHorizontal];
    
    
//    [self.view removeConstraints:self.view.constraints];
//    [self.yellowView removeConstraints:self.yellowView.constraints];
//    [self.label removeConstraints:self.label.constraints];
    
//    [self layoutUsingCode];
//    [self layoutUsingVFL];
//    [self layoutUsingMasonry];
//    [self layoutUsingAnchor];
    
}



- (void)layoutUsingCode{
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.greenView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeTrailing multiplier:1 constant:8]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.yellowView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.yellowView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeBottom multiplier:1 constant:8]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.greenView attribute:NSLayoutAttributeTrailing multiplier:1 constant:8]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeBottom multiplier:1 constant:8]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.yellowView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.yellowView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    constraint.priority = 751;
    [self.view addConstraint:constraint];
}

- (void)layoutUsingVFL{
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blueView(==redView)]-8-[redView]-0-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"blueView":self.blueView, @"redView":self.redView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[greenView(==yellowView)]-8-[yellowView]-0-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"greenView":self.greenView, @"yellowView":self.yellowView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blueView(==greenView)]-8-[greenView]-0-|" options:NSLayoutFormatAlignAllLeading metrics:nil views:@{@"blueView":self.blueView, @"greenView":self.greenView}]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[redView(==yellowView)]-8-[yellowView]-0-|" options:NSLayoutFormatAlignAllLeading metrics:nil views:@{@"redView":self.redView, @"yellowView":self.yellowView}]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.yellowView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.yellowView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[label(60@751)]" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"label":self.label}]];
    
}

- (void)layoutUsingMasonry{
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.equalTo(self.view);
        make.width.equalTo(self.redView);
        make.height.equalTo(self.greenView);
    }];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.blueView.mas_trailing).with.offset(8);
        make.trailing.and.top.equalTo(self.view);
        make.height.equalTo(self.yellowView);
    }];
    
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.bottom.equalTo(self.view);
        make.width.equalTo(self.yellowView);
        make.top.equalTo(self.blueView.mas_bottom).with.offset(8);
    }];
    
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.and.bottom.equalTo(self.view);
        make.top.equalTo(self.redView.mas_bottom).with.offset(8);
        make.leading.equalTo(self.greenView.mas_trailing).with.offset(8);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.yellowView);
        make.width.mas_equalTo(60).with.priority(751);
    }];

}

- (void)layoutUsingAnchor{
    
    [self.blueView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.blueView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.blueView.widthAnchor constraintEqualToAnchor:self.redView.widthAnchor].active = YES;
    [self.blueView.heightAnchor constraintEqualToAnchor:self.greenView.heightAnchor].active = YES;
    
    [self.redView.leadingAnchor constraintEqualToAnchor:self.blueView.trailingAnchor constant:8].active = YES;
    [self.redView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.redView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.redView.heightAnchor constraintEqualToAnchor:self.yellowView.heightAnchor].active = YES;
    
    [self.greenView.topAnchor constraintEqualToAnchor:self.blueView.bottomAnchor constant:8].active = YES;
    [self.greenView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.greenView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.greenView.widthAnchor constraintEqualToAnchor:self.yellowView.widthAnchor].active = YES;
    
    [self.yellowView.leadingAnchor constraintEqualToAnchor:self.greenView.trailingAnchor constant:8].active = YES;
    [self.yellowView.topAnchor constraintEqualToAnchor:self.redView.bottomAnchor constant:8].active = YES;
    [self.yellowView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.yellowView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    [self.label.centerXAnchor constraintEqualToAnchor:self.yellowView.centerXAnchor].active = YES;
    [self.label.centerYAnchor constraintEqualToAnchor:self.yellowView.centerYAnchor].active = YES;
    NSLayoutConstraint* constraint = [self.label.widthAnchor constraintEqualToAnchor:nil constant:60];
    constraint.priority = 751;
    constraint.active = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
