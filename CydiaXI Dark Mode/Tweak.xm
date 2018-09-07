@interface CydiaLoadingViewController : UIViewController
@end

%hook CydiaLoadingViewController
-(void)loadView {
%orig;
UIView *xiView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
xiView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
UIImageView *logo =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png"]];
logo.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 60, [UIScreen mainScreen].bounds.size.height / 2 - 90, 120, 120);
logo.layer.masksToBounds = YES;
logo.layer.cornerRadius = 10;
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 + 60, [UIScreen mainScreen].bounds.size.width, 40)];
label.text = @"Cydia";
label.textAlignment = NSTextAlignmentCenter;
label.textColor = [UIColor whiteColor];
[label setFont:[UIFont boldSystemFontOfSize:30]];\
[xiView addSubview:logo];
[xiView addSubview:label];
[[self view] addSubview:xiView];
}
%end


@interface HomeController : UIViewController
-(void)setURL:(id)URL;
-(void)reloadData;
@end

%hook HomeController
#define cyHomeKitURLiPad @"/Applications/Cydia.app/CydiaXIdark.html"
#define cyHomeKitURLiPhone @"/Applications/Cydia.app/CydiaXIdark.html"

-(id)init {
    self.view.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    NSString* htmlString = [NSString stringWithContentsOfFile:cyHomeKitURLiPhone encoding:NSUTF8StringEncoding error:nil];
    [(UIWebView *)self.view loadHTMLString:htmlString baseURL:[NSURL URLWithString:cyHomeKitURLiPhone]];
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}
%end

@interface PackageCell : UITableViewCell
@end

@interface UITableViewCellContentView : UIView
@end

@interface CyteTableViewCellContentView : UIView
@end

extern "C" void UISetColor(CGColorRef color);
%hook PackageCell
- (void) setPackage:(id)package asSummary:(bool)summary {
  %orig;
  for (UITableViewCellContentView *uicell in self.subviews) {
    for (CyteTableViewCellContentView *cytecell in uicell.subviews) {

      if (NSString *mode = (NSString *)[package mode]) {
        if ([mode isEqualToString:@"REMOVE"] || [mode isEqualToString:@"PURGE"]) {
          [cytecell setBackgroundColor:[UIColor colorWithRed:0.6 green:0.30 blue:0.30 alpha:0.4]];
        } else {
          [cytecell setBackgroundColor:[UIColor colorWithRed:0.30 green:0.6 blue:0.30 alpha:0.4]];
        }
      } else {
        [cytecell setBackgroundColor:[UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0]];
      }

    }
  }
   bool commercial_ = (bool)object_getIvar(self, class_getInstanceVariable([self class], "commercial_"));
   NSString* name_ = (NSString *)object_getIvar(self, class_getInstanceVariable([self class], "name_"));
   NSString* source_ = (NSString *)object_getIvar(self, class_getInstanceVariable([self class], "source_"));
   NSString* description_ = (NSString *)object_getIvar(self, class_getInstanceVariable([self class], "description_"));
   float width([self bounds].size.width);

   if (!commercial_) {
     UISetColor([UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor);
   } else {
     UISetColor([UIColor colorWithRed:0.4 green:0.5 blue:0.9 alpha:1].CGColor);
   }
   [name_ drawAtPoint:CGPointMake(48, 8) forWidth:(width - 80) withFont:[UIFont boldSystemFontOfSize:18] lineBreakMode:NSLineBreakByTruncatingTail];
   if (!commercial_) {
     UISetColor([UIColor grayColor].CGColor);
   }
   [source_ drawAtPoint:CGPointMake(58, 29) forWidth:(width - 29) withFont:[UIFont systemFontOfSize:12] lineBreakMode:NSLineBreakByTruncatingTail];
   [description_ drawAtPoint:CGPointMake(12, 46) forWidth:(width - 46) withFont:[UIFont systemFontOfSize:14] lineBreakMode:NSLineBreakByTruncatingTail];
}
%end

@interface CyteTableViewCell : UIView
@end

%hook CyteTableViewCell
- (void)layoutSubviews {
  %orig;
    self.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
}
%end

%hook CyteTableViewCellContentView
- (void)layoutSubviews {
  %orig;
  self.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
}
%end

%hook UITableView
- (void)layoutSubviews {
  %orig;
    self.separatorColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1.0];
}
%end

%hook UITabBar
-(void)didMoveToWindow {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
}
%end

%hook UINavigationBar
-(void)didMoveToWindow {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
}
%end

@interface UISearchBarTextField : UIView
@end

%hook UISearchBarTextField
-(void)didMoveToWindow {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
}
%end

@interface UIStatusBarForegroundView : UIView
@end

%hook UIStatusBarForegroundView
-(void)didMoveToWindow {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
}
%end

%hook UITableView
-(void)didMoveToWindow {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
}
%end

%hook UITableViewCell
-(void)didMoveToWindow {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
}
%end

@interface UITableViewIndex : UIView
@property (nonatomic, strong) UIColor *indexBackgroundColor;
@end

%hook UITableViewIndex
-(void)didMoveToWindow {
    %orig;
    self.indexBackgroundColor = [UIColor colorWithRed:0.19 green:0.19 blue:0.19 alpha:1.0];
}
%end

%hook UILabel
-(UIColor *)textColor {
return [UIColor whiteColor];
}
%end

@interface _UITableViewHeaderFooterContentView : UIView
@end

%hook _UITableViewHeaderFooterContentView
-(void)didMoveToWindow {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.19 green:0.19 blue:0.19 alpha:1.0];
}
%end

%hook UILabel
-(void)didMoveToWindow {
  self.textColor = [UIColor whiteColor];
}
%end

@interface _UITableViewCellSeparatorView : UIView
@end

%hook _UITableViewCellSeparatorView
-(void)didMoveToSuperview {
    %orig;
    self.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1.0];
}
%end

@interface _UIBarBackground : UIView
@end

%hook _UIBarBackground
-(void)layoutSubviews {
  %orig;
  self.hidden = YES;
}
%end
