//
//  FirstVC.m
//  ZZMBProgressHUDDemo
//
//  Created by sunparl on 2018/9/4.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "FirstVC.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "MBProgressHUD+ZZ.h"

@interface FirstVC ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MBProgressVC";
    
    self.dataSource = @[@"提示信息", @"错误提示", @"成功提示", @"警告提示", @"自定义图片提示", @"加载中", @"进度显示"];
    
    [self.view addSubview:self.tableView];
}

#pragma mark ------------- 懒加载 ------------------
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

#pragma mark UITableViewDataSource ---------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"test -------- %@", self.dataSource[indexPath.row]];
    return cell;
}

#pragma mark UITableViewDelegate  ------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [MBProgressHUD justShowMessage:self.dataSource[0]];
        }
            break;
        case 1:
        {
            [MBProgressHUD justShowError:self.dataSource[1]];
        }
            break;
        case 2:
        {
            [MBProgressHUD justShowSuccess:self.dataSource[2]];
        }
            break;
        case 3:
        {
            [MBProgressHUD justShowWarning:self.dataSource[3]];
        }
            break;
        case 4:
        {
            [MBProgressHUD justShowMessageWithImageName:@"MBHUD_Info" message:@"哈哈哈！"];
        }
            break;
        case 5:
        {
            [MBProgressHUD justShowLoadingView];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD justHiddenWindow];
            });
        }
            break;
        case 6:
        {
            MBProgressHUD *hud = [MBProgressHUD justShowViewFromProgress];
            // 模拟网络请求进度
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                float progress = 0.0f;
                
                while (progress < 1.0f) {
                    progress += 0.01f;
                    // 主线程刷新进度
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hud.progress = progress;
                    });
                    // 进程挂起50毫秒
                    usleep(50000);
                }
                // 100%后移除
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD justHiddenWindow];
                });
            });
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
