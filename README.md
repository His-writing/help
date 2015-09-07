启动页
使用方法

 如果（[NSUserDefaults的standardUserDefaults] boolForKey：@“firstStart”]！）{
        BootPictureView * bootPIc = [[BootPictureView
页头] initWithFrame：方法CGRectMake（0，0，kDeviceWidth，kDeviceHeight）];

        [self.view addSubview：bootPIc]。
        [NSUserDefaults的standardUserDefaults] setBool：YES
forKey：@“firstStart”];
    }
