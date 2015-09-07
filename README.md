启动页
使用方法

 if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        BootPictureView *bootPIc = [[BootPictureView
alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];

        [self.view addSubview:bootPIc];
        [[NSUserDefaults standardUserDefaults] setBool:YES
forKey:@"firstStart"];
    }
