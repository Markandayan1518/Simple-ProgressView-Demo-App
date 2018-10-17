//
//  ViewController.m
//  MY UI ProgressView
//
//  Created by Markandayan Perumandi on 17/10/18.
//  Copyright © 2018 Markandayan Perumandi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *loadedPercent;


@property (weak, nonatomic) IBOutlet UIProgressView *defaultProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *customProgressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (IBAction)onSelectStyle:(UISegmentedControl *)sender {
    if ( sender.selectedSegmentIndex == 0 ){
        self.defaultProgressView.progressViewStyle = UIProgressViewStyleDefault;
        self.customProgressView.progressViewStyle = UIProgressViewStyleDefault;
    }else{
        self.defaultProgressView.progressViewStyle = UIProgressViewStyleBar;
        self.customProgressView.progressViewStyle = UIProgressViewStyleBar;
    }
}

- (IBAction)onValueChangedSlider:(UISlider *)sender {
    float value = sender.value;
    self.defaultProgressView.progress = value;
    self.customProgressView.progress = value;
    
//    NSProgress *progress = self.defaultProgressView.observedProgress;
    self.loadedPercent.text = [[NSString alloc] initWithFormat:@"%d %%", (int) (value * 100) ] ;

}


- (IBAction)onChangeProgressTintColor:(UISegmentedControl *)sender {
    self.customProgressView.tintColor = [self colorWithSegmentIndex:sender.selectedSegmentIndex];
}

- (IBAction)onChangeTrackTintColor:(UISegmentedControl *)sender {
    self.customProgressView.trackTintColor = [self colorWithSegmentIndex:sender.selectedSegmentIndex];
}


- (IBAction)onChangeProgressImage:(UISwitch *)sender {
    UIImage *progressImage =[UIImage imageNamed:@"progress.png"];
    [progressImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 1)];
    if(sender.isOn){
        self.customProgressView.progressImage = progressImage;
    }else{
        self.customProgressView.progressImage = nil;
    }
}
- (IBAction)onChangeTrackImage:(UISwitch *)sender {
    UIImage *trackImage = [UIImage imageNamed:@"track.png"];
    [trackImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 1)];
    if(sender.isOn){
        self.customProgressView.progressImage = trackImage;
    }else{
        self.customProgressView.progressImage = nil;
    }
}

- (UIColor *) colorWithSegmentIndex : (NSUInteger) index {
    UIColor *color = [UIColor blackColor];
    switch (index) {
        case 0:
            color = [UIColor redColor];
            break;
        case 1:
            color = [UIColor blueColor];
            break;
        case 2:
            color = [UIColor greenColor];
            break;
        case 3:
            color = [UIColor yellowColor];
            break;
        default:
            break;
    }
    return color;
}

@end
